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

  String _truncateMessage(String message, int maxWidth) {
    if (message.length <= maxWidth) return message;

    // Remove ANSI escape codes for length calculation
    final cleanMessage = message.replaceAll(RegExp(r'\x1B\[[0-9;]*m'), '');

    if (cleanMessage.length <= maxWidth) return message;

    // Truncate and add ellipsis
    final truncateAt = maxWidth - 3; // Leave room for '...'

    // Find a good truncation point (try to break at word boundary)
    int breakPoint = truncateAt;
    for (int i = truncateAt; i > truncateAt - 10 && i > 0; i--) {
      if (cleanMessage[i] == ' ') {
        breakPoint = i;
        break;
      }
    }

    // Apply truncation to the original message (with ANSI codes)
    int realIndex = 0;
    int cleanIndex = 0;

    while (cleanIndex < breakPoint && realIndex < message.length) {
      if (realIndex < message.length - 1 &&
          message.substring(realIndex).startsWith('\x1B[')) {
        // Skip ANSI escape sequence
        final endIndex = message.indexOf('m', realIndex);
        if (endIndex != -1) {
          realIndex = endIndex + 1;
          continue;
        }
      }
      realIndex++;
      cleanIndex++;
    }

    return '${message.substring(0, realIndex)}...';
  }

  int _calculateLineCount(String text, int terminalWidth) {
    // Remove ANSI escape codes for accurate length calculation
    final cleanText = text.replaceAll(RegExp(r'\x1B\[[0-9;]*m'), '');
    return (cleanText.length / terminalWidth).ceil();
  }

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

  int _totalCount = 0;
  int _step = 0;

  String? _lastRawMessage;

  void setLoadingProgressBar({
    required String message,
    required BarProgressInfo barProgressInfo,
  }) {
    _lastRawMessage = message;
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
    _lastRawMessage = message;
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
      final termWidth = _getTerminalWidth();
      final timeFormatted = _formatElapsedTime(_stopwatch.elapsedMilliseconds);
      final spinnerChar = _spinnerChars[_idx % _spinnerChars.length];

      // Build and truncate main message to fit terminal
      var mainMessage =
          '[ ($step/$totalCount) $timeFormatted ] $spinnerChar ${message.replaceAll('[ Normalizing codebase ]', '[ Normalizing codebase ]'.aquamarine)}';
      mainMessage = _truncateMessage(mainMessage, termWidth - 1);

      if (barProgressInfo != null) {
        // Multi-line output with progress bar

        // Calculate bar width (leave some space for text)
        final barWidth = (termWidth - 20).clamp(40, 100); // Min 40, max 100

        final progressBar = _generateProgressBar(
          barProgressInfo.currentStep,
          barProgressInfo.totalSteps,
          barWidth,
        );

        // Truncate bar progress message to fit
        final truncatedBarMessage = _truncateMessage(
          barProgressInfo.message,
          termWidth - 1,
        );

        // Calculate actual line count based on wrapped text
        final mainMessageLines = _calculateLineCount(mainMessage, termWidth);
        final barMessageLines = _calculateLineCount(
          truncatedBarMessage,
          termWidth,
        );
        final progressBarLines = _calculateLineCount(progressBar, termWidth);
        _currentLineCount =
            mainMessageLines + barMessageLines + progressBarLines;

        // Display all three lines
        stdout.write(mainMessage);
        stdout.write('\n$truncatedBarMessage');
        stdout.write('\n$progressBar');
        stdout.flush();

        _lastMessage = mainMessage;
      } else {
        // Single line output
        _currentLineCount = _calculateLineCount(mainMessage, termWidth);
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

  void pauseForUserAction() {
    _timer?.cancel();
    _cleanLine();
    
    // Get current time
    final timeString = _formatElapsedTime(_stopwatch.elapsedMilliseconds);
    
    // Display paused message with current progress
    final messageToShow = _lastRawMessage ?? 'Processing';
    final pausedMessage = '[ ($_step/$_totalCount) $timeString ] ${messageToShow.replaceAll('[ Normalizing codebase ]', '[ Normalizing codebase ]'.aquamarine)} ${'[PAUSED - WAITING USER ACTION]'.yellow}';
    
    stdout.write(pausedMessage);
    stdout.flush();
    
    // Pause the stopwatch
    _stopwatch.stop();
  }
  
  void resumeAfterUserAction() {
    // Resume the stopwatch
    _stopwatch.start();
    
    // Resume the loading animation with the last message
    if (_lastRawMessage != null) {
      manageLoading(
        message: _lastRawMessage!,
        totalCount: _totalCount,
        step: _step,
        barProgressInfo: null,
      );
    }
  }

  void displaySuccess(String message) {
    _timer?.cancel();
    _cleanLine();

    // Clear the entire terminal screen
    stdout.write('\x1B[2J\x1B[H');

    // Calculate total elapsed time
    final timeString = _formatElapsedTime(_stopwatch.elapsedMilliseconds);

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

  /// Formats elapsed time in milliseconds to a human-readable string
  /// Format: "h:mm:ss" when hours > 0, "m:ss" when hours = 0
  String _formatElapsedTime(int milliseconds) {
    final totalSeconds = milliseconds ~/ 1000;
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    if (hours > 0) {
      return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '$minutes:${seconds.toString().padLeft(2, '0')}';
    }
  }
}
