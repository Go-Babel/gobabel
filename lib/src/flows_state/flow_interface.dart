import 'dart:convert';
import 'dart:io';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/usecases/key_integrity/generate_log_if_requested.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:path/path.dart' as p;
import 'package:result_dart/result_dart.dart';

typedef BabelResponse<T> = AsyncResultDart<FlowInterface<T>, BabelException>;
typedef SyncBabelResponse<T> = ResultDart<FlowInterface<T>, BabelException>;

abstract class FlowInterface<T> extends Object
    implements Loadable, Loggable, Resetable, SerializableFromJson<T> {}

abstract class Loadable {
  String get message;
  int get maxAmountOfSteps;
  int get stepCount;
}

abstract class Loggable {
  bool get shouldLog;
  Directory get directory;
}

abstract class Resetable {
  bool get shouldReset;
}

abstract class SerializableFromJson<T> {
  SerializableFromJson();
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}

extension MakeExtBabelResult<S extends FlowInterface<FlowInterface>>
    on AsyncBabelResult<S> {
  AsyncBabelResult<W> toNextStep<W extends FlowInterface<FlowInterface>>(
    AsyncBabelResult<W> Function(S success) fn,
  ) async {
    await Future.delayed(const Duration(milliseconds: 220));
    return then(
      (result) => result.fold(
        (success) {
          resolve(success);
          return fn(success);
        },
        (error) async {
          await resolveError(error);
          return Failure(error);
        },
      ),
    );
  }
}

late FlowInterface<FlowInterface> lastCorrectState;

void resolve(FlowInterface<FlowInterface> success) {
  lastCorrectState = success;
  LoadingIndicator.instance.setLoadingState(
    message: success.message,
    step: success.stepCount,
    totalCount: success.maxAmountOfSteps,
  );
}

bool didAlreadyLogError = false;
Future<void> resolveError(BabelFailureResponse babelFailure) async {
  if (didAlreadyLogError) return;
  didAlreadyLogError = true;
  LoadingIndicator.instance.dispose();
  final Directory directory = lastCorrectState.directory;
  final bool willLog = lastCorrectState.shouldLog;

  final BabelException babelException = babelFailure.exception;

  if (willLog) {
    final String errorTitle;
    final String errorDescription;

    errorTitle = babelException.title;
    errorDescription = babelException.description;

    final Object? error = babelFailure.mapOrNull(
      withErrorAndStackTrace: (value) => value.error,
    );
    final StackTrace? stackTrace = babelFailure.mapOrNull(
      withErrorAndStackTrace: (value) => value.stackTrace,
    );

    final lastSuccessStateInJson = lastCorrectState.toJson();
    final List<String> filesToBeAnalysedPaths = [];
    if (lastCorrectState is GenerateFlowState) {
      final files =
          await (lastCorrectState as GenerateFlowState).filesToBeAnalysed;
      filesToBeAnalysedPaths.addAll(files.map((file) => file.path));
    }
    final logPayload = {
      'errorTitle': errorTitle,
      'errorDescription': errorDescription,
      if (logMessages.isNotEmpty)
        'specificLogMessages': logMessages.join('\n\n'),
      'targetDirectory': directory.path,
      'errorObject': error.toString(),
      'stackTrace': stackTrace.toString(),
      'lastSuccessState': lastSuccessStateInJson,
      'logMessages': logMessages,
      if (filesToBeAnalysedPaths.isNotEmpty)
        'filesAnalysed': filesToBeAnalysedPaths,
    };

    await saveStringData(
      dirr: directory,
      data: logPayload,
      fileName: 'gobabel_error_log.json',
    );
  }

  LoadingIndicator.instance.displayError();
}

/// Saves data to a JSON file
Future<void> saveStringData({
  required Directory dirr,
  required Map<String, dynamic> data,
  required String fileName,
}) async {
  final outFile = File(p.join(dirr.path, fileName));
  await outFile.writeAsString(JsonEncoder.withIndent('  ').convert(data));
}
