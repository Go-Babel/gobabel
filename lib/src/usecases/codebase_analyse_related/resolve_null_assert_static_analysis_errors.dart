import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Unit> multiSingleResolveNullAssertStaticAnalysisErrorsForStrings({
  required List<File> targetFiles,
}) async {
  for (final file in targetFiles) {
    final source = await file.readAsString();
    final transformed = singleResolveNullAssertStaticAnalysisErrorsForStrings(
      source,
    );
    if (transformed != source) {
      await file.writeAsString(transformed);
    }
  }

  return Success(unit);
}

String singleResolveNullAssertStaticAnalysisErrorsForStrings(
  String fileContent,
) {
  try {
    final parseResult = parseString(
      content: fileContent,
      featureSet: FeatureSet.latestLanguageVersion(),
      throwIfDiagnostics: false,
    );

    // Use the visitor to find and fix nullable String issues
    final visitor = _NullAssertFixVisitor(fileContent);
    parseResult.unit.accept(visitor);

    return visitor.getTransformedContent();
  } catch (e) {
    // If parsing fails, return original content
    return fileContent;
  }
}

class _NullAssertFixVisitor extends RecursiveAstVisitor<void> {
  final String _sourceCode;
  final List<_Modification> _modifications = [];
  final Map<String, bool> _nullableVariables = {};

  _NullAssertFixVisitor(this._sourceCode);

  @override
  void visitVariableDeclaration(VariableDeclaration node) {
    super.visitVariableDeclaration(node);

    // Track nullable String variables
    final type = node.parent?.parent;
    if (type is VariableDeclarationList) {
      final typeAnnotation = type.type;
      if (typeAnnotation is NamedType) {
        final typeName = typeAnnotation.name2.lexeme;
        if (typeName == 'String' && typeAnnotation.question != null) {
          _nullableVariables[node.name.lexeme] = true;
        }
      }
    }
  }

  @override
  void visitSimpleFormalParameter(SimpleFormalParameter node) {
    super.visitSimpleFormalParameter(node);

    // Track nullable String parameters
    if (node.type is NamedType) {
      final namedType = node.type as NamedType;
      if (namedType.name2.lexeme == 'String' && namedType.question != null) {
        final paramName = node.name?.lexeme;
        if (paramName != null) {
          _nullableVariables[paramName] = true;
        }
      }
    }
  }

  @override
  void visitDefaultFormalParameter(DefaultFormalParameter node) {
    super.visitDefaultFormalParameter(node);

    // Check if the parameter became nullable after null-aware assignment
    final param = node.parameter;
    if (param is SimpleFormalParameter && param.type is NamedType) {
      final namedType = param.type as NamedType;
      if (namedType.name2.lexeme == 'String' && namedType.question != null) {
        final paramName = param.name?.lexeme;
        if (paramName != null) {
          _nullableVariables[paramName] = true;
        }
      }
    }
  }

  @override
  void visitArgumentList(ArgumentList node) {
    super.visitArgumentList(node);

    // Check each argument to see if it's a nullable String being passed to String parameter
    for (final argument in node.arguments) {
      if (argument is SimpleIdentifier) {
        final variableName = argument.name;
        if (_nullableVariables.containsKey(variableName) &&
            _nullableVariables[variableName] == true) {
          // Check if this argument needs null assertion
          if (_needsNullAssertion(argument)) {
            _modifications.add(
              _Modification(offset: argument.end, length: 0, replacement: '!'),
            );
          }
        }
      }
    }
  }

  @override
  void visitAssignmentExpression(AssignmentExpression node) {
    super.visitAssignmentExpression(node);

    // Check if we're assigning a nullable String to a non-nullable String
    final rightSide = node.rightHandSide;
    if (rightSide is SimpleIdentifier) {
      final variableName = rightSide.name;
      if (_nullableVariables.containsKey(variableName) &&
          _nullableVariables[variableName] == true) {
        if (_needsNullAssertion(rightSide)) {
          _modifications.add(
            _Modification(offset: rightSide.end, length: 0, replacement: '!'),
          );
        }
      }
    }
  }

  @override
  void visitMethodInvocation(MethodInvocation node) {
    super.visitMethodInvocation(node);

    // Check if the target of method invocation is a nullable String
    final target = node.target;
    if (target is SimpleIdentifier) {
      final variableName = target.name;
      if (_nullableVariables.containsKey(variableName) &&
          _nullableVariables[variableName] == true) {
        if (_needsNullAssertion(target)) {
          _modifications.add(
            _Modification(offset: target.end, length: 0, replacement: '!'),
          );
        }
      }
    }
  }

  @override
  void visitPropertyAccess(PropertyAccess node) {
    super.visitPropertyAccess(node);

    // Check if accessing property on nullable String
    final target = node.target;
    if (target is SimpleIdentifier) {
      final variableName = target.name;
      if (_nullableVariables.containsKey(variableName) &&
          _nullableVariables[variableName] == true) {
        if (_needsNullAssertion(target)) {
          _modifications.add(
            _Modification(offset: target.end, length: 0, replacement: '!'),
          );
        }
      }
    }
  }

  @override
  void visitInstanceCreationExpression(InstanceCreationExpression node) {
    super.visitInstanceCreationExpression(node);

    // Check constructor arguments
    final argumentList = node.argumentList;
    for (final argument in argumentList.arguments) {
      if (argument is SimpleIdentifier) {
        final variableName = argument.name;
        if (_nullableVariables.containsKey(variableName) &&
            _nullableVariables[variableName] == true) {
          if (_needsNullAssertion(argument)) {
            _modifications.add(
              _Modification(offset: argument.end, length: 0, replacement: '!'),
            );
          }
        }
      }
    }
  }

  bool _needsNullAssertion(SimpleIdentifier identifier) {
    // Check if this identifier is being used in a context where String is expected
    // but we have String?

    final parent = identifier.parent;

    // Skip if already has null assertion
    if (parent is PostfixExpression && parent.operator.lexeme == '!') {
      return false;
    }

    // Skip if it's part of a null-aware operation
    if (parent is BinaryExpression &&
        (parent.operator.lexeme == '??' || parent.operator.lexeme == '?.')) {
      return false;
    }

    // Skip if it's in a null check
    if (parent is BinaryExpression &&
        (parent.operator.lexeme == '==' || parent.operator.lexeme == '!=') &&
        (parent.rightOperand.toString() == 'null' ||
            parent.leftOperand.toString() == 'null')) {
      return false;
    }

    return true;
  }

  String getTransformedContent() {
    if (_modifications.isEmpty) {
      return _sourceCode;
    }

    // Sort modifications by offset in descending order to apply from end to start
    _modifications.sort((a, b) => b.offset.compareTo(a.offset));

    String result = _sourceCode;
    for (final modification in _modifications) {
      result =
          result.substring(0, modification.offset) +
          modification.replacement +
          result.substring(modification.offset + modification.length);
    }

    return result;
  }
}

class _Modification {
  final int offset;
  final int length;
  final String replacement;

  _Modification({
    required this.offset,
    required this.length,
    required this.replacement,
  });
}
