import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:gobabel/src/flows_state/flow_interface.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:path/path.dart' as p;
import 'package:result_dart/result_dart.dart';

class LoadingIndicator {
  static LoadingIndicator? _instance;
  LoadingIndicator._();
  static LoadingIndicator get instance =>
      (_instance ??= LoadingIndicator._()).._stopwatch.start();

  final Stopwatch _stopwatch = Stopwatch();
  static const List<String> _spinnerChars = ['|', '/', '-', '\\'];
  static const Duration _interval = Duration(milliseconds: 120);
  int _idx = 0;
  Timer? _timer;

  void set({
    required String message,
    required int totalCount,
    required int step,
    bool enabled = true,
  }) {
    // Cancel any existing timer first
    _timer?.cancel();

    // Skip if logging is disabled
    if (!enabled) return;

    // final String message = loadingMessage.message;
    // final int step = loadingMessage.step;

    // Start a periodic timer to update the spinner
    _timer = Timer.periodic(_interval, (_) {
      final seconds = (_stopwatch.elapsedMilliseconds / 1000).toStringAsFixed(
        1,
      );
      final spinnerChar = _spinnerChars[_idx % _spinnerChars.length];
      stdout
        ..write(' ' * (message.length + 15))
        ..write('\r[ ($step/$totalCount) ${seconds}s ] $spinnerChar $message');

      _idx++;
    });
  }

  void dispose() {
    _timer?.cancel();
    _stopwatch.stop();
  }
}

// extension on AsyncResultDart<GenerateFlowState, Exception> {
extension MakeExt<S extends FlowInterface<FlowInterface>, F extends Object>
    on AsyncResultDart<S, F> {
  AsyncResultDart<W, F> toNextStep<W extends FlowInterface<FlowInterface>>(
    FutureOr<ResultDart<W, F>> Function(S success) fn,
  ) async {
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
  LoadingIndicator.instance.set(
    message: success.message,
    step: success.stepCount,
    totalCount: success.maxAmountOfSteps,
    enabled: success.shouldLog,
  );
}

Future<void> resolveError(Object error) async {
  LoadingIndicator.instance.dispose();
  final Directory directory = lastCorrectState.directory;
  final bool willLog = lastCorrectState.shouldLog;
  if (willLog) {
    final String errorTitle;
    final String errorDescription;

    if (error is BabelException) {
      errorTitle = error.title;
      errorDescription = error.description;
    } else {
      errorTitle = 'An unexpected error occurred';
      errorDescription = error.toString();
    }
    final lastSuccessStateInJson = lastCorrectState.toJson();
    final logPayload = {
      'errorTitle': errorTitle,
      'errorDescription': errorDescription,
      'error': error.toString(),
      'targetDirectory': directory.path,
      'lastSuccessState': lastSuccessStateInJson,
    };

    await _saveStringData(
      dirr: directory,
      data: logPayload,
      fileName: 'error_log.json',
    );
  }
}

/// Saves data to a JSON file
Future<void> _saveStringData({
  required Directory dirr,
  required Map<String, dynamic> data,
  required String fileName,
}) async {
  final outFile = File(p.join(dirr.path, fileName));
  await outFile.writeAsString(JsonEncoder.withIndent('  ').convert(data));
}
