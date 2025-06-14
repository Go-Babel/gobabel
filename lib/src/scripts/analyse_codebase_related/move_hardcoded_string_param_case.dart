// File: lib/src/move_hardcoded_string_param_usecase.dart
import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/core/dependencies.dart';

class MoveHardCodedStringParamUseCase {
  Future<void> call() async {
    final List<File> files = await Dependencies.filesToBeAnalysed;
    if (files.isEmpty) {
      return;
    }

    for (final file in files) {
      final source = await file.readAsString();
      final transformed = analyseSingleFile(source);
      if (transformed != source) {
        await file.writeAsString(transformed);
      }
    }
  }

  @visibleForTesting
  String analyseSingleFile(String source) {
    final parseResult = parseString(
      content: source,
      featureSet: FeatureSet.latestLanguageVersion(),
    );

    if (parseResult.errors.isNotEmpty) {
      throw Exception('Parse errors: ${parseResult.errors}');
    }

    final visitor = _ConstructorTransformVisitor(source);
    parseResult.unit.accept(visitor);

    return visitor.getTransformedSource();
  }
}

class _ConstructorTransformVisitor extends RecursiveAstVisitor<void> {
  final String _source;
  final List<_ConstructorTransformation> _transformations = [];

  _ConstructorTransformVisitor(this._source);

  @override
  void visitConstructorDeclaration(ConstructorDeclaration node) {
    final parametersToTransform = <_ParameterTransformation>[];

    if (node.parameters.parameters.isNotEmpty) {
      for (final param in node.parameters.parameters) {
        if (param is DefaultFormalParameter &&
            param.defaultValue is SimpleStringLiteral) {
          final stringLiteral = param.defaultValue as SimpleStringLiteral;
          final paramName = _getParameterName(param.parameter);

          if (paramName != null) {
            parametersToTransform.add(
              _ParameterTransformation(
                parameter: param,
                parameterName: paramName,
                defaultValue: stringLiteral.value,
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
    final newParameters = <String>[];
    final initializerEntries = <String>[];

    for (final param in constructor.parameters.parameters) {
      final transformParam = parametersToTransform
          .cast<_ParameterTransformation?>()
          .firstWhere((t) => t?.parameter == param, orElse: () => null);

      if (transformParam != null) {
        // Transform parameter to nullable without default
        final paramDecl = transformParam.parameter.parameter;
        final paramName = transformParam.parameterName;

        if (paramDecl is SimpleFormalParameter) {
          final typeAnnotation = paramDecl.type?.toString() ?? 'String';
          newParameters.add('$typeAnnotation? $paramName');
        } else if (paramDecl is FieldFormalParameter) {
          newParameters.add('String? $paramName');
        }

        // Add initializer entry
        initializerEntries.add(
          '$paramName = $paramName ?? \'${transformParam.defaultValue}\'',
        );
      } else {
        // Keep original parameter
        newParameters.add(param.toString());
      }
    }

    // Build new constructor
    final constructorName = constructor.name?.toString() ?? '';
    final className = (constructor.parent as ClassDeclaration).name.toString();
    final isConst = constructor.constKeyword != null ? 'const ' : '';

    final newParameterList = newParameters.join(', ');
    final initializerList =
        initializerEntries.isNotEmpty
            ? ' : ${initializerEntries.join(', ')}'
            : '';

    final newConstructor =
        '$isConst$className${constructorName.isNotEmpty ? '.$constructorName' : ''}({\n$newParameterList\n})$initializerList;';

    // Replace in source
    final constructorStart = constructor.offset;
    final constructorEnd = constructor.end;

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

  _ParameterTransformation({
    required this.parameter,
    required this.parameterName,
    required this.defaultValue,
  });
}
