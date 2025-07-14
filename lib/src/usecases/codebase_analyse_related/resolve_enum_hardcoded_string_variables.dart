import 'dart:io';

import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<Unit> multiResolveEnumHardcodedStringsUsecase({
  required List<File> targetFiles,
}) async {
  for (final file in targetFiles) {
    final source = await file.readAsString();
    final transformed = resolveEnumHardcodedStringsUsecase(source);
    if (transformed != source) {
      await file.writeAsString(transformed);
    }
  }

  return Success(unit);
}

/// This function will move hardcoded strings that are variables of an enum
/// to a String getter in the enum body.
String resolveEnumHardcodedStringsUsecase(String dartFileContent) {
  try {
    final parseResult = parseString(content: dartFileContent);
    if (parseResult.errors.isNotEmpty) {
      // If there are parse errors, return the original content
      return dartFileContent;
    }

    final visitor = _EnumTransformVisitor();
    parseResult.unit.visitChildren(visitor);

    if (visitor.transformations.isEmpty) {
      return dartFileContent;
    }

    return _applyTransformations(dartFileContent, visitor.transformations);
  } catch (e) {
    // If any error occurs, return the original content
    return dartFileContent;
  }
}

AsyncBabelResult<GenerateFlowResolvedEnumHardcodedStrings>
generate_multiResolveEnumHardcodedStringsUsecase(
  GenerateFlowRemovedAdjacentStringConcatenation payload,
) async {
  final targetFiles = await payload.filesToBeAnalysed;

  final result = await multiResolveEnumHardcodedStringsUsecase(
    targetFiles: targetFiles,
  );

  if (result.isError()) {
    return result.asBabelResultErrorAsync();
  }

  return GenerateFlowResolvedEnumHardcodedStrings(
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

String _applyTransformations(
  String content,
  List<_EnumTransformation> transformations,
) {
  // Sort transformations by offset in descending order to avoid offset issues
  transformations.sort(
    (a, b) => b.enumDeclaration.offset.compareTo(a.enumDeclaration.offset),
  );

  String result = content;
  for (final transformation in transformations) {
    result = _transformEnum(result, transformation);
  }

  return result;
}

String _transformEnum(String content, _EnumTransformation transformation) {
  final enumDeclaration = transformation.enumDeclaration;
  final stringFields = transformation.stringFields;

  if (stringFields.isEmpty) {
    return content;
  }

  final enumStart = enumDeclaration.offset;
  final enumEnd = enumDeclaration.end;

  // Parse the enum content to extract its parts
  final enumName = enumDeclaration.name.lexeme;
  final enumConstants = enumDeclaration.constants;
  final members = enumDeclaration.members;

  // Build the new enum content
  final buffer = StringBuffer();

  // Start with enum declaration
  buffer.write('enum $enumName {');

  // Add enum constants without string parameters
  for (int i = 0; i < enumConstants.length; i++) {
    final constant = enumConstants[i];
    final constantName = constant.name.lexeme;

    buffer.write('\n  $constantName');

    // Add constructor call without string parameters if arguments exist
    if (constant.arguments != null &&
        constant.arguments!.argumentList.arguments.isNotEmpty) {
      final args = constant.arguments!.argumentList.arguments;
      final nonStringArgs = <String>[];

      for (final arg in args) {
        if (arg is NamedExpression) {
          final paramName = arg.name.label.name;
          if (!stringFields.any((sf) => sf.name == paramName)) {
            nonStringArgs.add(arg.toSource());
          }
        }
      }

      if (nonStringArgs.isNotEmpty) {
        buffer.write('(\n    ${nonStringArgs.join(',\n    ')},\n  )');
      }
    }

    if (i < enumConstants.length - 1) {
      buffer.write(',');
    } else {
      buffer.write(';');
    }
  }

  // Add non-string fields and constructor
  buffer.write('\n');
  for (final member in members) {
    if (member is FieldDeclaration) {
      final fields = member.fields.variables;
      final hasNonStringField = fields.any(
        (field) => !stringFields.any((sf) => sf.name == field.name.lexeme),
      );

      if (hasNonStringField) {
        // Keep only non-string fields
        final nonStringFields =
            fields
                .where(
                  (field) =>
                      !stringFields.any((sf) => sf.name == field.name.lexeme),
                )
                .toList();

        if (nonStringFields.isNotEmpty) {
          buffer.write('\n  ${member.fields.type?.toSource() ?? 'final'} ');
          buffer.write(nonStringFields.map((f) => f.name.lexeme).join(', '));
          buffer.write(';');
        }
      }
    } else if (member is ConstructorDeclaration) {
      // Update constructor to remove string parameters
      final params = member.parameters.parameters;
      final nonStringParams =
          params.where((param) {
            String paramName = '';
            if (param is DefaultFormalParameter) {
              paramName = param.parameter.name?.lexeme ?? '';
            } else {
              paramName = param.name?.lexeme ?? '';
            }
            return !stringFields.any((sf) => sf.name == paramName);
          }).toList();

      if (nonStringParams.isNotEmpty) {
        buffer.write('\n\n  const $enumName({');
        for (int i = 0; i < nonStringParams.length; i++) {
          final param = nonStringParams[i];
          buffer.write('\n    ${param.toSource()}');
          if (i < nonStringParams.length - 1) {
            buffer.write(',');
          }
        }
        buffer.write('\n  });');
      } else {
        buffer.write('\n\n  const $enumName();');
      }
    }
  }

  // Add string getters
  for (final stringField in stringFields) {
    buffer.write('\n\n  ${stringField.type} get ${stringField.name} {');
    buffer.write('\n    switch (this) {');

    for (final constant in enumConstants) {
      final constantName = constant.name.lexeme;
      String? value;

      if (constant.arguments != null &&
          constant.arguments!.argumentList.arguments.isNotEmpty) {
        for (final arg in constant.arguments!.argumentList.arguments) {
          if (arg is NamedExpression) {
            final paramName = arg.name.label.name;
            if (paramName == stringField.name) {
              value = arg.expression.toSource();
              break;
            }
          }
        }
      }

      buffer.write('\n      case $enumName.$constantName:');
      buffer.write('\n        return $value;');
    }

    buffer.write('\n    }');
    buffer.write('\n  }');
  }

  buffer.write('\n}');

  // Replace the original enum with the transformed one
  return content.substring(0, enumStart) +
      buffer.toString() +
      content.substring(enumEnd);
}

class _EnumTransformation {
  final EnumDeclaration enumDeclaration;
  final List<_StringField> stringFields;

  _EnumTransformation({
    required this.enumDeclaration,
    required this.stringFields,
  });
}

class _StringField {
  final String name;
  final String type;

  _StringField({required this.name, required this.type});
}

class _EnumTransformVisitor extends GeneralizingAstVisitor<void> {
  final List<_EnumTransformation> transformations = [];

  @override
  void visitEnumDeclaration(EnumDeclaration node) {
    final stringFields = <_StringField>[];

    // Find string fields in the enum
    for (final member in node.members) {
      if (member is FieldDeclaration) {
        final type = member.fields.type;
        if (type != null) {
          final typeString = type.toSource();
          if (typeString == 'String' || typeString == 'String?') {
            for (final variable in member.fields.variables) {
              stringFields.add(
                _StringField(name: variable.name.lexeme, type: typeString),
              );
            }
          }
        }
      }
    }

    // Check if any enum constants have hardcoded string values
    bool hasHardcodedStrings = false;
    for (final constant in node.constants) {
      if (constant.arguments != null &&
          constant.arguments!.argumentList.arguments.isNotEmpty) {
        for (final arg in constant.arguments!.argumentList.arguments) {
          if (arg is NamedExpression) {
            final paramName = arg.name.label.name;
            if (stringFields.any((sf) => sf.name == paramName)) {
              if (arg.expression is StringLiteral) {
                hasHardcodedStrings = true;
                break;
              }
            }
          }
        }
        if (hasHardcodedStrings) break;
      }
    }

    if (hasHardcodedStrings && stringFields.isNotEmpty) {
      transformations.add(
        _EnumTransformation(enumDeclaration: node, stringFields: stringFields),
      );
    }

    super.visitEnumDeclaration(node);
  }
}
