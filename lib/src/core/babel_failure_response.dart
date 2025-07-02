import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/flows_state/flow_interface.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

part 'babel_failure_response.freezed.dart';
part 'babel_failure_response.g.dart';

typedef BabelResult =
    AsyncResultDart<FlowInterface<FlowInterface>, BabelFailureResponse>;
typedef SyncBabelResult =
    ResultDart<FlowInterface<FlowInterface>, BabelFailureResponse>;

@freezed
abstract class BabelFailureResponse with _$BabelFailureResponse {
  factory BabelFailureResponse.onlyBabelException({
    required BabelException exception,
  }) = _BabelFailureResponseOnlyBabelException;

  factory BabelFailureResponse.withErrorAndStackTrace({
    required BabelException exception,
    @ErrorObjectConverter() required Object error,
    @StackTraceConverter() required StackTrace stackTrace,
  }) = _BabelFailureResponseWithErrorAndStackTrace;
  factory BabelFailureResponse.fromJson(Map<String, dynamic> json) =>
      _$BabelFailureResponseFromJson(json);
}

class StackTraceConverter implements JsonConverter<StackTrace, String> {
  const StackTraceConverter();

  @override
  StackTrace fromJson(String json) {
    return StackTrace.fromString(json);
  }

  @override
  String toJson(StackTrace stackTrace) {
    return stackTrace.toString();
  }
}

class ErrorObjectConverter implements JsonConverter<Object, String> {
  const ErrorObjectConverter();

  @override
  Object fromJson(String json) {
    return json;
  }

  @override
  String toJson(Object object) {
    return object.toString();
  }
}
