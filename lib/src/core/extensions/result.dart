import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:result_dart/result_dart.dart';

extension StringResultOnErrorMap<T>
    on ResultDart<String, BabelFailureResponse> {
  AsyncBabelResult<R> asBabelResultErrorAsync<R extends Object>() async {
    return Failure(
      fold((_) => throw Exception('No error found'), (onFailure) => onFailure),
    );
  }

  SyncBabelResult<R> asBabelResultErrorSync<R extends Object>() {
    return Failure(
      fold((_) => throw Exception('No error found'), (onFailure) => onFailure),
    );
  }
}

extension ResultOnErrorMap<T extends Object>
    on ResultDart<T, BabelFailureResponse> {
  AsyncBabelResult<R> asBabelResultErrorAsync<R extends Object>() async {
    return Failure(
      fold((_) => throw Exception('No error found'), (onFailure) => onFailure),
    );
  }

  SyncBabelResult<R> asBabelResultErrorSync<R extends Object>() {
    return Failure(
      fold((_) => throw Exception('No error found'), (onFailure) => onFailure),
    );
  }
}
