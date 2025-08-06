// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'babel_failure_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BabelFailureResponseOnlyBabelExceptionImpl
    _$$BabelFailureResponseOnlyBabelExceptionImplFromJson(
            Map<String, dynamic> json) =>
        _$BabelFailureResponseOnlyBabelExceptionImpl(
          exception: BabelException.fromJson(
              json['exception'] as Map<String, dynamic>),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$BabelFailureResponseOnlyBabelExceptionImplToJson(
        _$BabelFailureResponseOnlyBabelExceptionImpl instance) =>
    <String, dynamic>{
      'exception': instance.exception,
      'runtimeType': instance.$type,
    };

_$BabelFailureResponseWithErrorAndStackTraceImpl
    _$$BabelFailureResponseWithErrorAndStackTraceImplFromJson(
            Map<String, dynamic> json) =>
        _$BabelFailureResponseWithErrorAndStackTraceImpl(
          exception: BabelException.fromJson(
              json['exception'] as Map<String, dynamic>),
          error: const ErrorObjectConverter().fromJson(json['error'] as String),
          stackTrace: const StackTraceConverter()
              .fromJson(json['stackTrace'] as String),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$BabelFailureResponseWithErrorAndStackTraceImplToJson(
        _$BabelFailureResponseWithErrorAndStackTraceImpl instance) =>
    <String, dynamic>{
      'exception': instance.exception,
      'error': const ErrorObjectConverter().toJson(instance.error),
      'stackTrace': const StackTraceConverter().toJson(instance.stackTrace),
      'runtimeType': instance.$type,
    };
