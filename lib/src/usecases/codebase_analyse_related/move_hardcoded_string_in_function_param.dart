import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/token.dart'; // Added import for Token
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:meta/meta.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<Unit> multiMoveHardcodedStringInFuntionParamUsecase({
  required List<File> targetFiles,
}) async {
  for (final file in targetFiles) {
    final source = await file.readAsString();
    final transformed = singleMoveHardcodedStringInFuntionParamUsecase(source);
    if (transformed != source) {
      await file.writeAsString(transformed);
    }
  }

  return Success(unit);
}

@visibleForTesting
String singleMoveHardcodedStringInFuntionParamUsecase(String fileContent) {
  // First pass: Move hardcoded strings to nullable parameters with ??= assignments
  final parseResult = parseString(
    content: fileContent,
    featureSet: FeatureSet.latestLanguageVersion(),
    throwIfDiagnostics:
        false, // Allow processing potentially incomplete/invalid code
  );
  final compilationUnit = parseResult.unit;

  final List<_Modification> modifications = [];
  final Set<String> nullCoalescingVariables = {};
  final visitor = _HardcodedStringVisitor(
    modifications,
    fileContent,
    nullCoalescingVariables,
  );
  compilationUnit.accept(visitor);

  // Apply modifications from bottom to top (highest offset first)
  // to avoid offset shifts affecting subsequent modifications.
  modifications.sort((a, b) => b.offset.compareTo(a.offset));

  String newContent = fileContent;
  for (final mod in modifications) {
    newContent =
        newContent.substring(0, mod.offset) +
        mod.replacementText +
        newContent.substring(mod.offset + mod.length);
  }

  // Second pass: Add null assertions where needed
  if (nullCoalescingVariables.isNotEmpty) {
    newContent = _addNullAssertions(newContent, nullCoalescingVariables);
  }

  return newContent;
}

class _Modification {
  final int offset;
  final int length;
  final String replacementText;

  _Modification(this.offset, this.length, this.replacementText);

  @override
  String toString() =>
      '_Modification(offset: $offset, length: $length, replacement: "$replacementText")';
}

class _HardcodedStringVisitor extends GeneralizingAstVisitor<void> {
  final List<_Modification> modifications;
  final String sourceCode;
  final Set<String> nullCoalescingVariables;

  _HardcodedStringVisitor(
    this.modifications,
    this.sourceCode,
    this.nullCoalescingVariables,
  );

  @override
  void visitMethodDeclaration(MethodDeclaration node) {
    _processFunctionLike(
      node.name.lexeme, // Pass the method name
      node.parameters,
      node.body,
    );
    super.visitMethodDeclaration(node);
  }

  @override
  void visitFunctionDeclaration(FunctionDeclaration node) {
    _processFunctionLike(
      node.name.lexeme, // Pass the function name
      node.functionExpression.parameters,
      node.functionExpression.body,
    );
    super.visitFunctionDeclaration(node);
  }

  void _processFunctionLike(
    String functionName, // Added functionName parameter
    FormalParameterList? parameterList,
    FunctionBody functionBody, // Renamed from body to functionBody
  ) {
    if (parameterList == null) return;

    final List<String> assignmentsToAdd = [];
    final List<_Modification> parameterModifications = [];

    for (final param in parameterList.parameters) {
      if (param is DefaultFormalParameter) {
        final defaultValueNode = param.defaultValue;
        final formalParam = param.parameter;

        if (defaultValueNode is StringLiteral &&
            formalParam is SimpleFormalParameter) {
          final paramNameToken = formalParam.name;
          final paramTypeNode = formalParam.type;

          if (paramNameToken != null && paramTypeNode != null) {
            bool isStringType = false;
            if (paramTypeNode is NamedType) {
              if (paramTypeNode.name2.lexeme == 'String') {
                isStringType = true;
              }
            }

            if (isStringType) {
              final paramName = paramNameToken.lexeme;
              final defaultValueText = sourceCode.substring(
                defaultValueNode.offset,
                defaultValueNode.end,
              );

              final equalSign = param.separator;
              if (equalSign != null) {
                // 1. Remove " = 'defaultValue'"
                // Check if there's already a space before the equals sign
                var startOffset = equalSign.offset;
                var replacement = "";

                // If there's a space before the equals sign, preserve it
                if (startOffset > 0 && sourceCode[startOffset - 1] == ' ') {
                  startOffset--; // Include the space in removal
                  replacement = " "; // Replace with single space
                }

                parameterModifications.add(
                  _Modification(
                    startOffset,
                    defaultValueNode.end - startOffset,
                    replacement,
                  ),
                );

                // 2. Add '?' to the type if it's not already nullable
                // To check if already nullable, we inspect the source text immediately after the type.
                // This is a simplification; a more robust check would involve deeper AST analysis of the type itself.
                bool alreadyNullable = false;
                if (paramTypeNode.end < sourceCode.length &&
                    sourceCode[paramTypeNode.end] == '?') {
                  alreadyNullable = true;
                }
                if (!alreadyNullable) {
                  parameterModifications.add(
                    _Modification(
                      paramTypeNode.end, // Offset after the type
                      0, // Length 0 for insertion
                      "?", // Insert '?'
                    ),
                  );
                }

                assignmentsToAdd.add("  $paramName ??= $defaultValueText;");
                nullCoalescingVariables.add(paramName);
              }
            }
          }
        }
      }
    }

    if (assignmentsToAdd.isNotEmpty) {
      modifications.addAll(parameterModifications);

      if (functionBody is BlockFunctionBody) {
        final bodyStartOffset =
            functionBody.block.leftBracket.end; // Offset after '{'

        String textToInsert = "\n${assignmentsToAdd.join("\n")}";
        if (functionBody.block.statements.isNotEmpty) {
          textToInsert += "\n";
        }

        modifications.add(
          _Modification(
            bodyStartOffset,
            0, // Length 0 for insertion
            textToInsert,
          ),
        );
      } else if (functionBody is ExpressionFunctionBody) {
        final expressionText = sourceCode.substring(
          functionBody.expression.offset,
          functionBody.expression.end,
        );

        final indentedAssignments = assignmentsToAdd
            .map((line) => "  ${line.trimLeft()}")
            .join("\n");

        // Determine if the original function was async
        String asyncKeyword = functionBody.isAsynchronous ? "async " : "";

        String newBlockBodyString =
            " $asyncKeyword{\n$indentedAssignments\n  return $expressionText;\n}";

        final Token arrowToken =
            functionBody.functionDefinition; // This is '=>' or 'async =>' token

        modifications.add(
          _Modification(
            arrowToken.offset, // Start of the arrow token
            (functionBody.end - arrowToken.offset)
                .toInt(), // Length from arrow to end of expression body
            newBlockBodyString,
          ),
        );
      }
    }
  }
}

String _addNullAssertions(
  String fileContent,
  Set<String> nullCoalescingVariables,
) {
  final parseResult = parseString(
    content: fileContent,
    featureSet: FeatureSet.latestLanguageVersion(),
    throwIfDiagnostics: false,
  );

  final compilationUnit = parseResult.unit;
  final List<_Modification> modifications = [];
  final visitor = _NullAssertionVisitor(
    modifications,
    fileContent,
    nullCoalescingVariables,
  );
  compilationUnit.accept(visitor);

  // Apply modifications from bottom to top
  modifications.sort((a, b) => b.offset.compareTo(a.offset));

  String newContent = fileContent;
  for (final mod in modifications) {
    newContent =
        newContent.substring(0, mod.offset) +
        mod.replacementText +
        newContent.substring(mod.offset + mod.length);
  }

  return newContent;
}

class _NullAssertionVisitor extends RecursiveAstVisitor<void> {
  final List<_Modification> modifications;
  final String sourceCode;
  final Set<String> nullCoalescingVariables;
  final Map<String, AstNode> functionScopes = {};

  _NullAssertionVisitor(
    this.modifications,
    this.sourceCode,
    this.nullCoalescingVariables,
  );

  @override
  void visitMethodDeclaration(MethodDeclaration node) {
    _enterFunctionScope(node.name.lexeme, node);
    super.visitMethodDeclaration(node);
    _exitFunctionScope(node.name.lexeme);
  }

  @override
  void visitFunctionDeclaration(FunctionDeclaration node) {
    _enterFunctionScope(node.name.lexeme, node);
    super.visitFunctionDeclaration(node);
    _exitFunctionScope(node.name.lexeme);
  }

  @override
  void visitArgumentList(ArgumentList node) {
    for (final arg in node.arguments) {
      if (arg is NamedExpression) {
        _checkExpression(arg.expression);
      } else {
        _checkExpression(arg);
      }
    }
    super.visitArgumentList(node);
  }

  void _checkExpression(Expression expr) {
    if (expr is SimpleIdentifier) {
      final varName = expr.name;

      // Check if this is one of our null coalescing variables
      if (nullCoalescingVariables.contains(varName)) {
        // Check if we're inside a closure/function expression
        AstNode? current = expr;
        bool insideClosure = false;
        bool hasNullCoalescingAssignment = false;

        while (current != null) {
          // Check if we've found a function expression (closure)
          if (current is FunctionExpression &&
              current.parent is! FunctionDeclaration) {
            insideClosure = true;
          }

          // Check if we've found the function that has the ??= assignment
          if (current is FunctionBody) {
            // Look for the ??= assignment in this function body
            final bodySource = sourceCode.substring(
              current.offset,
              current.end,
            );
            if (bodySource.contains('$varName ??=')) {
              hasNullCoalescingAssignment = true;
              break;
            }
          }

          current = current.parent;
        }

        // Only add ! if we're inside a closure and the containing function has ??= assignment
        if (insideClosure && hasNullCoalescingAssignment) {
          // Check if ! is not already present
          final afterIdentifier = expr.end;
          if (afterIdentifier < sourceCode.length &&
              sourceCode[afterIdentifier] != '!') {
            modifications.add(_Modification(expr.end, 0, '!'));
          }
        }
      }
    }
  }

  void _enterFunctionScope(String name, AstNode node) {
    functionScopes[name] = node;
  }

  void _exitFunctionScope(String name) {
    functionScopes.remove(name);
  }
}

AsyncBabelResult<GenerateFlowMovedHardcodedStringsInFunctionParams>
generate_multiMoveHardcodedStringInFuntionParamUsecase(
  GenerateFlowAppliedInitialDartFixes payload,
) async {
  final targetFiles = await payload.filesToBeAnalysed;

  final result = await multiMoveHardcodedStringInFuntionParamUsecase(
    targetFiles: targetFiles,
  );

  if (result.isError()) {
    return result.asBabelResultErrorAsync();
  }

  return GenerateFlowMovedHardcodedStringsInFunctionParams(
    willLog: payload.willLog,
    projectApiToken: payload.projectApiToken,
    directoryPath: payload.directoryPath,
    inputedByUserLocale: payload.inputedByUserLocale,
    client: payload.client,
    yamlInfo: payload.yamlInfo,
    gitVariables: payload.gitVariables,
    maxLanguageCount: payload.maxLanguageCount,
    languages: payload.languages,
    projectCacheMap: payload.projectCacheMap,
    cacheMapTranslationPayloadInfo: payload.cacheMapTranslationPayloadInfo,
    filesVerificationState: payload.filesVerificationState,
    projectArbData: payload.projectArbData,
    remapedArbKeys: payload.remapedArbKeys,
    codebaseArbTranslationPayloadInfo:
        payload.codebaseArbTranslationPayloadInfo,
  ).toSuccess();
}
