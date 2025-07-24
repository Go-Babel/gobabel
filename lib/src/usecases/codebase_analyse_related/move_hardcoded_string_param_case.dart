// File: lib/src/move_hardcoded_string_param_usecase.dart
import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<Unit> multiMoveHardCodedStringParamUseCase({
  required List<File> targetFiles,
}) async {
  File? currentFile;
  try {
    for (final file in targetFiles) {
      currentFile = file;
      final source = await file.readAsString();
      final transformed = singleMoveHardCodedStringParamUseCase(source);
      if (transformed != source) {
        await file.writeAsString(transformed);
      }
    }
    return Success(unit);
  } on BabelException catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: error,
      error: 'Parameter transformation failed',
      stackTrace: stackTrace,
    ).toFailure();
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Parameter Transformation Failed',
        description:
            'Failed to transform hardcoded string parameters in constructor.\n\n'
            'This transformation moves default string values from constructor parameters '
            'to the constructor body.\n'
            'The error happened in file "${currentFile?.path ?? 'unknown'}".\n\n'
            'This may fail if:\n'
            '• The file has syntax errors\n'
            '• The file uses unsupported Dart language features\n'
            '• File permissions prevent reading or writing\n'
            '• The AST structure is unexpected',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }
}

@visibleForTesting
String singleMoveHardCodedStringParamUseCase(String source) {
  try {
    final parseResult = parseString(
      content: source,
      featureSet: FeatureSet.latestLanguageVersion(),
      throwIfDiagnostics: false,
    );

    if (parseResult.errors.isNotEmpty) {
      throw BabelException(
        title: 'Dart Parse Error',
        description:
            'Failed to parse Dart file due to syntax errors.\n\n'
            'Parse errors: ${parseResult.errors.map((e) => '• ${e.message} at line ${e.offset}').join('\n')}\n\n'
            'Common causes:\n'
            '• Missing semicolons or brackets\n'
            '• Invalid Dart syntax\n'
            '• Incomplete code statements\n'
            '• Unsupported language features\n\n'
            'Please fix the syntax errors before running GoBabel.',
      );
    }

    final visitor = _ConstructorTransformVisitor(source);
    parseResult.unit.accept(visitor);

    return visitor.getTransformedSource();
  } on ArgumentError {
    // parseString throws ArgumentError when throwIfDiagnostics is not set
    // and there are parse errors
    throw BabelException(
      title: 'Dart Parse Error',
      description:
          'Failed to parse Dart file due to syntax errors.\n\n'
          'The file contains invalid Dart syntax that prevents parsing.\n\n'
          'Common causes:\n'
          '• Missing semicolons or brackets\n'
          '• Invalid Dart syntax\n'
          '• Incomplete code statements\n'
          '• Unsupported language features\n\n'
          'Please fix the syntax errors before running GoBabel.',
    );
  }
}

class _ConstructorTransformVisitor extends RecursiveAstVisitor<void> {
  final String _source;
  final List<_ConstructorTransformation> _transformations = [];

  _ConstructorTransformVisitor(this._source);

  @override
  void visitConstructorDeclaration(ConstructorDeclaration node) {
    // Skip factory constructors
    if (node.factoryKeyword != null) {
      super.visitConstructorDeclaration(node);
      return;
    }

    final parametersToTransform = <_ParameterTransformation>[];

    if (node.parameters.parameters.isNotEmpty) {
      for (final param in node.parameters.parameters) {
        if (param is DefaultFormalParameter &&
            param.defaultValue is SimpleStringLiteral) {
          final stringLiteral = param.defaultValue as SimpleStringLiteral;
          final paramName = _getParameterName(param.parameter);

          if (paramName != null) {
            // Get the raw string representation including quotes
            final rawStringValue = _source.substring(
              stringLiteral.offset,
              stringLiteral.end,
            );
            parametersToTransform.add(
              _ParameterTransformation(
                parameter: param,
                parameterName: paramName,
                defaultValue: stringLiteral.value,
                rawDefaultValue: rawStringValue,
              ),
            );
          }
        }
      }
    }

    if (parametersToTransform.isNotEmpty) {
      _transformations.add(
        _ConstructorTransformation(
          constructor: node,
          parametersToTransform: parametersToTransform,
        ),
      );
    }

    super.visitConstructorDeclaration(node);
  }

  String? _getParameterName(NormalFormalParameter parameter) {
    if (parameter is SimpleFormalParameter) {
      return parameter.name?.lexeme;
    } else if (parameter is FieldFormalParameter) {
      return parameter.name.lexeme;
    } else if (parameter is FunctionTypedFormalParameter) {
      return parameter.name.lexeme;
    }
    return null;
  }

  String getTransformedSource() {
    if (_transformations.isEmpty) {
      return _source;
    }

    String result = _source;

    // Apply transformations in reverse order to maintain offsets
    for (final transformation in _transformations.reversed) {
      result = _applyTransformation(result, transformation);
    }

    return result;
  }

  String _applyTransformation(
    String source,
    _ConstructorTransformation transformation,
  ) {
    final constructor = transformation.constructor;
    final parametersToTransform = transformation.parametersToTransform;

    // Build new parameter list
    final newParams = <String>[];

    for (final param in constructor.parameters.parameters) {
      final transformParam = parametersToTransform
          .cast<_ParameterTransformation?>()
          .firstWhere((t) => t?.parameter == param, orElse: () => null);

      if (transformParam != null) {
        // Transform parameter to nullable without default
        final paramDecl = transformParam.parameter.parameter;
        final paramName = transformParam.parameterName;

        String newParamString;
        if (paramDecl is SimpleFormalParameter) {
          final typeAnnotation = paramDecl.type?.toString() ?? 'String';
          newParamString = '$typeAnnotation? $paramName';
        } else if (paramDecl is FieldFormalParameter) {
          newParamString = 'String? $paramName';
        } else {
          newParamString = param.toString();
        }

        newParams.add(newParamString);
      } else {
        // Keep original parameter
        newParams.add(param.toString());
      }
    }

    // Get existing initializers (like super calls)
    // but exclude simple field assignments for parameters we're transforming
    final existingInitializers = <String>[];
    final transformedParamNames =
        parametersToTransform.map((t) => t.parameterName).toSet();

    // Track which parameters are used in super calls
    final paramsUsedInSuper = <String>{};

    if (constructor.initializers.isNotEmpty) {
      for (final initializer in constructor.initializers) {
        // Check if this is a simple field assignment for a transformed parameter
        if (initializer is ConstructorFieldInitializer &&
            transformedParamNames.contains(initializer.fieldName.name)) {
          // Skip this initializer as we're replacing it
          continue;
        }

        // Check if this is a super constructor invocation
        if (initializer is SuperConstructorInvocation) {
          // Track which parameters are used in the super call
          final superSource = _source.substring(
            initializer.offset,
            initializer.end,
          );
          for (final paramName in transformedParamNames) {
            if (superSource.contains(paramName)) {
              paramsUsedInSuper.add(paramName);
            }
          }

          // Transform the super call to add null-aware operators
          String transformedSuper = superSource;
          for (final transform in parametersToTransform) {
            if (paramsUsedInSuper.contains(transform.parameterName)) {
              // Replace parameter references with null-aware expression
              final paramName = transform.parameterName;
              final defaultValue = transform.rawDefaultValue;

              // Simple replacement - this handles basic cases
              // For more complex cases, we'd need full AST analysis
              transformedSuper = transformedSuper.replaceAll(
                RegExp('\\b$paramName\\b'),
                '$paramName ?? $defaultValue',
              );
            }
          }
          existingInitializers.add(transformedSuper);
        } else {
          existingInitializers.add(initializer.toString());
        }
      }
    }

    // Only add field initializers for parameters NOT used in super calls
    final fieldInitializers = <String>[];
    for (final transform in parametersToTransform) {
      if (!paramsUsedInSuper.contains(transform.parameterName)) {
        fieldInitializers.add(
          '${transform.parameterName} = ${transform.parameterName} ?? ${transform.rawDefaultValue}',
        );
      }
    }

    // Build new constructor
    final constructorName = constructor.name?.toString() ?? '';
    final className = (constructor.parent as ClassDeclaration).name.toString();
    final isConst = constructor.constKeyword != null ? 'const ' : '';

    // Combine field initializers with existing ones (like super calls)
    final allInitializers = [...fieldInitializers, ...existingInitializers];
    final initializerList =
        allInitializers.isNotEmpty ? ' : ${allInitializers.join(', ')}' : '';

    // Build constructor with same formatting style as original
    final constructorSignature =
        '$isConst$className${constructorName.isNotEmpty ? '.$constructorName' : ''}';

    // Check if constructor body exists
    final body = constructor.body;
    // ignore: unnecessary_null_comparison
    final hasBody = body != null;
    final bodySuffix = hasBody ? '' : ';';

    // Preserve the original formatting of the parameter list if it's multi-line
    final originalParams = _source.substring(
      constructor.parameters.leftParenthesis.end,
      constructor.parameters.rightParenthesis.offset,
    );
    final isMultiLine = originalParams.contains('\n');

    // Check if the last parameter has a trailing comma
    final hasTrailingComma =
        constructor.parameters.parameters.isNotEmpty &&
        _source
            .substring(
              constructor.parameters.parameters.last.end,
              constructor.parameters.rightParenthesis.offset,
            )
            .trim()
            .startsWith(',');

    // Determine the parameter delimiters (none for required positional, {} for named, [] for optional positional)
    final leftDelimiter = constructor.parameters.leftDelimiter?.lexeme ?? '';
    final rightDelimiter = constructor.parameters.rightDelimiter?.lexeme ?? '';

    // Build the parameter list with proper formatting
    String formattedParameterList;

    // Separate parameters based on whether they're in the optional section or not
    final beforeDelimiter = <String>[];
    final insideDelimiter = <String>[];

    // Check if we have delimiters (for optional parameters)
    final hasDelimiters = leftDelimiter.isNotEmpty;

    if (hasDelimiters) {
      // For named parameters ({}), all parameters are inside the delimiters
      // For positional optional ([]), we need to separate required and optional
      if (leftDelimiter == '{') {
        // All parameters go inside the delimiters for named parameters
        // UNLESS there are required positional parameters before the named ones
        bool foundNamedParam = false;

        for (int i = 0; i < constructor.parameters.parameters.length; i++) {
          final originalParam = constructor.parameters.parameters[i];
          final newParam = newParams[i];

          // Check if this is a named parameter (it's inside the delimiter section)
          if (!foundNamedParam && originalParam.isNamed) {
            foundNamedParam = true;
          }

          if (foundNamedParam || originalParam.isNamed) {
            insideDelimiter.add(newParam);
          } else {
            // This is a required positional parameter before named parameters
            beforeDelimiter.add(newParam);
          }
        }
      } else {
        // For positional optional parameters ([])
        bool insideOptionalSection = false;

        for (int i = 0; i < constructor.parameters.parameters.length; i++) {
          final originalParam = constructor.parameters.parameters[i];
          final newParam = newParams[i];

          // Check if this parameter starts the optional section
          if (!insideOptionalSection && originalParam.isOptional) {
            insideOptionalSection = true;
          }

          if (insideOptionalSection) {
            insideDelimiter.add(newParam);
          } else {
            beforeDelimiter.add(newParam);
          }
        }
      }

      // Build the formatted parameter list
      if (isMultiLine) {
        // For multi-line with named parameters ({}), wrap all parameters
        if (leftDelimiter == '{') {
          // Named parameters - all parameters go inside the delimiters
          final formattedParams = newParams
              .map(
                (p) =>
                    '    $p${hasTrailingComma || newParams.indexOf(p) < newParams.length - 1 ? ',' : ''}',
              )
              .join('\n');
          formattedParameterList =
              '($leftDelimiter\n$formattedParams\n  $rightDelimiter)';
        } else {
          // Positional optional parameters ([]) - need to separate required and optional
          final parts = <String>[];

          // Add required parameters
          for (final param in beforeDelimiter) {
            parts.add('    $param,');
          }

          // Add optional parameters with delimiters
          if (insideDelimiter.isNotEmpty) {
            for (int i = 0; i < insideDelimiter.length; i++) {
              final isLast = i == insideDelimiter.length - 1;
              if (i == 0 && beforeDelimiter.isEmpty) {
                // First parameter and no required params
                parts.add(
                  '    $leftDelimiter${insideDelimiter[i]}${isLast && !hasTrailingComma ? '' : ','}',
                );
              } else if (i == 0) {
                // First optional parameter with required params before
                parts.add('    $leftDelimiter${insideDelimiter[i]},');
              } else if (isLast) {
                // Last optional parameter
                parts.add(
                  '    ${insideDelimiter[i]}$rightDelimiter${hasTrailingComma ? ',' : ''}',
                );
              } else {
                // Middle optional parameters
                parts.add('    ${insideDelimiter[i]},');
              }
            }
          }

          formattedParameterList = '(\n${parts.join('\n')}\n  )';
        }
      } else {
        // Single line formatting
        if (leftDelimiter == '{') {
          // Named parameters
          if (beforeDelimiter.isEmpty) {
            // All parameters are named
            formattedParameterList =
                '($leftDelimiter${insideDelimiter.join(', ')}$rightDelimiter)';
          } else {
            // Mix of required positional and named parameters
            formattedParameterList =
                '(${beforeDelimiter.join(', ')}, $leftDelimiter${insideDelimiter.join(', ')}$rightDelimiter)';
          }
        } else {
          // Positional optional parameters
          if (beforeDelimiter.isEmpty) {
            // Only optional parameters
            formattedParameterList =
                '($leftDelimiter${insideDelimiter.join(', ')}$rightDelimiter)';
          } else if (insideDelimiter.isEmpty) {
            // Only required parameters (shouldn't happen if we have delimiters)
            formattedParameterList = '(${beforeDelimiter.join(', ')})';
          } else {
            // Both required and optional
            formattedParameterList =
                '(${beforeDelimiter.join(', ')}, $leftDelimiter${insideDelimiter.join(', ')}$rightDelimiter)';
          }
        }
      }
    } else {
      // No delimiters - all parameters are either required positional or all named
      final newParameterList = newParams.join(', ');

      if (isMultiLine) {
        final formattedParams = newParams
            .map(
              (p) =>
                  '    $p${hasTrailingComma || newParams.indexOf(p) < newParams.length - 1 ? ',' : ''}',
            )
            .join('\n');
        formattedParameterList = '(\n$formattedParams\n  )';
      } else {
        formattedParameterList = '($newParameterList)';
      }
    }

    final newConstructor =
        '$constructorSignature$formattedParameterList$initializerList$bodySuffix';

    // Replace in source
    final constructorStart = constructor.offset;
    final constructorEnd = hasBody ? body.offset : constructor.end;

    return source.substring(0, constructorStart) +
        newConstructor +
        source.substring(constructorEnd);
  }
}

class _ConstructorTransformation {
  final ConstructorDeclaration constructor;
  final List<_ParameterTransformation> parametersToTransform;

  _ConstructorTransformation({
    required this.constructor,
    required this.parametersToTransform,
  });
}

class _ParameterTransformation {
  final DefaultFormalParameter parameter;
  final String parameterName;
  final String defaultValue;
  final String rawDefaultValue;

  _ParameterTransformation({
    required this.parameter,
    required this.parameterName,
    required this.defaultValue,
    required this.rawDefaultValue,
  });
}

AsyncBabelResult<GenerateFlowMovedHardcodedStringParams>
generate_multiMoveHardCodedStringParamUseCase(
  GenerateFlowMovedHardcodedStringsInFunctionParams payload,
) async {
  final targetFiles = await payload.filesToBeAnalysed;

  final result = await multiMoveHardCodedStringParamUseCase(
    targetFiles: targetFiles,
  );

  if (result.isError()) {
    return result.asBabelResultErrorAsync();
  }

  return GenerateFlowMovedHardcodedStringParams(
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
