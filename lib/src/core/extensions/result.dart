import 'dart:async';

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

  BabelFailureResponse get getErr {
    return fold(
      (success) => throw Exception('No error found'),
      (failure) => failure,
    );
  }
}

extension ResultDartExt<S extends Object, F extends Object>
    on AsyncResultDart<S, F> {
  /// Returns the Future result of onSuccess for the encapsulated value
  /// if this instance represents `Success` or the result of onError function
  /// for the encapsulated value if it is `Error`.
  Future<W> foldAsync<W>(
    FutureOr<W> Function(S success) onSuccess,
    FutureOr<W> Function(F error) onError,
  ) {
    return then<W>((result) async => await result.fold(onSuccess, onError));
  }
}
