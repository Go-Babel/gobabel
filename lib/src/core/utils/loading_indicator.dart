import 'dart:async';
import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:meta/meta.dart';

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
  static LoadingIndicator get instance {
    if (_instance != null) {
      // If instance already exists, return it
      return _instance!;
    }

    final instance = (_instance ??= LoadingIndicator._()).._stopwatch.start();

    final bool useUnicode =
        stdout.hasTerminal &&
        (!Platform.isWindows || Platform.environment.containsKey('WT_SESSION'));

    if (useUnicode) {
      instance._spinnerChars = ['⢎⡰', '⢎⡡', '⢎⡑', '⢎⠱', '⠎⡱', '⢊⡱', '⢌⡱', '⢆⡱'];
    } else {
      instance._spinnerChars = ['|', '/', '-', '\\'];
    }

    return instance;
  }

  // Test-only method to reset the singleton
  static void resetForTesting() {
    _instance?.dispose();
    _instance = null;
  }

  final Stopwatch _stopwatch = Stopwatch();
  List<String> _spinnerChars = [];
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
      _cleanLine();
      final seconds = (_stopwatch.elapsedMilliseconds / 1000).toStringAsFixed(
        1,
      );
      final spinnerChar = _spinnerChars[_idx % _spinnerChars.length];
      final mainMessage =
          '[ ($step/$totalCount) ${seconds}s ] $spinnerChar $message';

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
        stdout.write(
          '\n${barProgressInfo.message}'.replaceAll(
            '[ Normalizing codebase ]',
            '[ Normalizing codebase ]'.aquamarine,
          ),
        );
        stdout.write('\n$progressBar');
        stdout.flush();

        _lastMessage = mainMessage;
      } else {
        // Single line output
        _currentLineCount = 1;
        stdout.write(mainMessage);
        stdout.flush();
        _lastMessage = mainMessage;
      }

      _idx++;
    });
  }

  void displayError() {
    _cleanLine();
    stdout.write(
      (_lastMessage?.replaceAll(RegExp(_spinnerChars.join('|')), ''))?.red ??
          'An error occurred'.red,
    );
    stdout.flush();
  }

  void displaySuccess(String message) {
    _timer?.cancel();
    _cleanLine();

    // Clear the entire terminal screen
    stdout.write('\x1B[2J\x1B[H');

    // Calculate total elapsed time
    final totalSeconds = _stopwatch.elapsedMilliseconds / 1000;
    final minutes = (totalSeconds / 60).floor();
    final seconds = (totalSeconds % 60).toStringAsFixed(1);
    
    final timeString = minutes > 0 
        ? '${minutes}m ${seconds}s' 
        : '${seconds}s';
    
    // Display only the success message with time
    stdout.writeln(message);
    stdout.writeln('\nCompleted in $timeString'.dim);
    stdout.flush();

    dispose();
  }

  void dispose() {
    _timer?.cancel();
    _stopwatch.stop();
  }
}
