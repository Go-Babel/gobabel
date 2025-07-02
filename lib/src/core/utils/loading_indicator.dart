import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/flows_state/flow_interface.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as p;
import 'package:result_dart/result_dart.dart';

class BarProgressInfo {
  final String message;
  final int totalSteps;
  final int currentStep;

  const BarProgressInfo({
    required this.message,
    required this.totalSteps,
    required this.currentStep,
  });
}

class LoadingIndicator {
  static LoadingIndicator? _instance;
  LoadingIndicator._();
  static LoadingIndicator get instance =>
      (_instance ??= LoadingIndicator._()).._stopwatch.start();

  // Test-only method to reset the singleton
  static void resetForTesting() {
    _instance?.dispose();
    _instance = null;
  }

  final Stopwatch _stopwatch = Stopwatch();
  static const List<String> _spinnerChars = ['|', '/', '-', '\\'];
  static const Duration _interval = Duration(milliseconds: 120);
  int _idx = 0;
  Timer? _timer;

  String? _lastMessage;
  int _currentLineCount = 1;

  void _cleanLine() {
    // Move cursor to beginning of line and clear it
    stdout.write('\r\x1B[2K');
    // If we have multiple lines, move up and clear those too
    for (int i = 1; i < _currentLineCount; i++) {
      stdout.write('\x1B[1A\x1B[2K');
    }
  }

  String _generateProgressBar(int current, int total, int width) {
    if (total <= 0) return '';

    // Calculate progress percentage
    final progress = (current / total).clamp(0.0, 1.0);
    final filledLength = (progress * width).round();
    final emptyLength = width - filledLength;

    // Create the bar
    final bar = '█' * filledLength + '░' * emptyLength;
    final percentage = (progress * 100).toStringAsFixed(1);

    return '[$bar] $percentage%';
  }

  int _getTerminalWidth() {
    try {
      if (stdout.hasTerminal) {
        return stdout.terminalColumns;
      }
    } catch (_) {}
    return 80; // Default terminal width
  }

  late int _totalCount;
  late int _step;

  void setLoadingProgressBar({
    required String message,
    required BarProgressInfo barProgressInfo,
  }) {
    manageLoading(
      message: message,
      totalCount: _totalCount,
      step: _step,
      barProgressInfo: barProgressInfo,
    );
  }

  void setLoadingState({
    required String message,
    required int totalCount,
    required int step,
  }) {
    _totalCount = totalCount;
    _step = step;
    manageLoading(
      message: message,
      totalCount: totalCount,
      step: step,
      barProgressInfo: null,
    );
  }

  @visibleForTesting
  void manageLoading({
    required String message,
    required int totalCount,
    required int step,
    BarProgressInfo? barProgressInfo,
  }) {
    // Cancel any existing timer first
    _timer?.cancel();

    // Start a periodic timer to update the spinner
    _timer = Timer.periodic(_interval, (_) {
      final seconds = (_stopwatch.elapsedMilliseconds / 1000).toStringAsFixed(
        1,
      );
      final spinnerChar = _spinnerChars[_idx % _spinnerChars.length];
      final mainMessage =
          '[ ($step/$totalCount) ${seconds}s ] $spinnerChar $message';

      _cleanLine();

      if (barProgressInfo != null) {
        // Multi-line output with progress bar
        _currentLineCount = 3;

        // Get terminal width and calculate bar width (leave some space for text)
        final termWidth = _getTerminalWidth();
        final barWidth = (termWidth - 20).clamp(40, 100); // Min 40, max 100

        final progressBar = _generateProgressBar(
          barProgressInfo.currentStep,
          barProgressInfo.totalSteps,
          barWidth,
        );

        // Display all three lines
        stdout.write(mainMessage);
        stdout.write('\n${barProgressInfo.message}');
        stdout.write('\n$progressBar');

        _lastMessage = mainMessage;
      } else {
        // Single line output
        _currentLineCount = 1;
        stdout.write(mainMessage);
        _lastMessage = mainMessage;
      }

      _idx++;
    });
  }

  void displayError() {
    _cleanLine();
    stdout.write(_lastMessage?.red ?? 'An error occurred'.red);
  }

  void dispose() {
    _timer?.cancel();
    _stopwatch.stop();
  }
}

extension MakeExtBabelResult<S extends FlowInterface<FlowInterface>>
    on AsyncBabelResult<S> {
  AsyncBabelResult<W> toNextStep<W extends FlowInterface<FlowInterface>>(
    AsyncBabelResult<W> Function(S success) fn,
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
    final logPayload = {
      'errorTitle': errorTitle,
      'errorDescription': errorDescription,
      'error': error.toString(),
      'stackTrace': stackTrace.toString(),
      'targetDirectory': directory.path,
      'lastSuccessState': lastSuccessStateInJson,
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
