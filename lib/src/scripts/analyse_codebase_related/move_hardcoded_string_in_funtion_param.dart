import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

/// A use case that transforms Dart code by moving hardcoded string default values
/// from function parameters inside the function body, making the parameters nullable.
class MoveHardcodedStringInFuntionParamUsecase {
  String execute(String fileContent) {
    final parseResult = parseString(
      content: fileContent,
      featureSet: FeatureSet.latestLanguageVersion(),
      throwIfDiagnostics: false, // Allow processing potentially incomplete/invalid code
    );
    final compilationUnit = parseResult.unit;

    final List<_Modification> modifications = [];
    final visitor = _HardcodedStringVisitor(modifications, fileContent);
    compilationUnit.accept(visitor);

    // Apply modifications from bottom to top (highest offset first)
    // to avoid offset shifts affecting subsequent modifications.
    modifications.sort((a, b) => b.offset.compareTo(a.offset));

    String newContent = fileContent;
    for (final mod in modifications) {
      newContent = newContent.substring(0, mod.offset) +
                   mod.replacementText +
                   newContent.substring(mod.offset + mod.length);
    }
    return newContent;
  }
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

  _HardcodedStringVisitor(this.modifications, this.sourceCode);

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
                  defaultValueNode.offset, defaultValueNode.end);

              final equalSign = param.separator;
              if (equalSign != null) {
                parameterModifications.add(_Modification(
                  equalSign.offset,
                  defaultValueNode.end - equalSign.offset,
                  "",
                ));

                parameterModifications.add(_Modification(
                  paramTypeNode.end,
                  0,
                  "?",
                ));

                assignmentsToAdd.add("  $paramName ??= $defaultValueText;");
              }
            }
          }
        }
      }
    }

    if (assignmentsToAdd.isNotEmpty) {
      modifications.addAll(parameterModifications);

      if (functionBody is BlockFunctionBody) {
        final bodyStartOffset = functionBody.block.leftBracket.end;
        String textToInsert = "\n" + assignmentsToAdd.join("\n");
        if (functionBody.block.statements.isNotEmpty) {
          textToInsert += "\n";
        }
        modifications.add(_Modification(
          bodyStartOffset,
          0,
          textToInsert,
        ));
      } else if (functionBody is ExpressionFunctionBody) {
        print(
            "Warning: Function '$functionName' with ExpressionFunctionBody at offset ${functionBody.offset} " +
            "has hardcoded string parameters. Automatic refactoring for this style is not fully supported.");
      }
    }
  }
}
