import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/utils/console_manager.dart';
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

    final console = ConsoleManager.instance;
    final bool useUnicode =
        console.hasTerminal &&
        (!Platform.isWindows || Platform.environment.containsKey('WT_SESSION'));

    if (useUnicode) {
      instance._spinnerChars = ['⢎⡰', '⢎⡡', '⢎⡑', '⢎⠱', '⠎⡱', '⢊⡱', '⢌⡱', '⢆⡱'];
    } else {
      instance._spinnerChars = ['|', '/', '-', '\\'];
    }

    // Set up the loading display callback
    instance._setupLoadingCallback();

    return instance;
  }

  // Test-only method to reset the singleton
  static void resetForTesting() {
    _instance?.dispose();
    _instance = null;
  }

  final Stopwatch _stopwatch = Stopwatch();
  List<String> _spinnerChars = [];
  int _idx = 0;

  String? _lastMessage;
  BarProgressInfo? _currentBarProgressInfo;
  int _totalCount = 0;
  int _step = 0;
  String? _lastRawMessage;
  bool _isPaused = false;

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

  void _setupLoadingCallback() {
    ConsoleManager.instance.writeWithCallback(
      (terminalWidth, terminalHeight) {
        if (_lastMessage == null) return '';
        
        // Update spinner index every time we're called (roughly every 150ms from ConsoleManager timer)
        _idx++;
        
        final timeFormatted = _formatElapsedTime(_stopwatch.elapsedMilliseconds);
        final spinnerChar = _spinnerChars[_idx % _spinnerChars.length];

        // Build and truncate main message to fit terminal
        var mainMessage = '[ ($_step/$_totalCount) $timeFormatted ] $spinnerChar ${_lastMessage!.replaceAll('[ Normalizing codebase ]', '[ Normalizing codebase ]'.aquamarine)}';
        
        if (_isPaused) {
          mainMessage = '[ ($_step/$_totalCount) $timeFormatted ] ${_lastRawMessage?.replaceAll('[ Normalizing codebase ]', '[ Normalizing codebase ]'.aquamarine) ?? 'Processing'} ${'[PAUSED - WAITING USER ACTION]'.yellow}';
        }
        
        mainMessage = _truncateMessage(mainMessage, terminalWidth - 1);

        if (_currentBarProgressInfo != null && !_isPaused) {
          // Multi-line output with progress bar
          // Calculate bar width (leave some space for text)
          final barWidth = (terminalWidth - 20).clamp(40, 100); // Min 40, max 100

          final progressBar = _generateProgressBar(
            _currentBarProgressInfo!.currentStep,
            _currentBarProgressInfo!.totalSteps,
            barWidth,
          );

          // Truncate bar progress message to fit
          final truncatedBarMessage = _truncateMessage(
            _currentBarProgressInfo!.message,
            terminalWidth - 1,
          );

          // Display all three lines
          return '$mainMessage\n$truncatedBarMessage\n$progressBar';
        } else {
          // Single line output
          return mainMessage;
        }
      },
      id: 'flow_messages',
    );
  }

  void setLoadingProgressBar({
    required String message,
    required BarProgressInfo barProgressInfo,
  }) {
    _lastRawMessage = message;
    _lastMessage = message;
    _currentBarProgressInfo = barProgressInfo;
    _totalCount = _totalCount;
    _step = _step;
  }

  void setLoadingState({
    required String message,
    required int totalCount,
    required int step,
  }) {
    _totalCount = totalCount;
    _step = step;
    _lastRawMessage = message;
    _lastMessage = message;
    _currentBarProgressInfo = null;
  }

  @visibleForTesting
  void manageLoading({
    required String message,
    required int totalCount,
    required int step,
    BarProgressInfo? barProgressInfo,
  }) {
    // Simply update the state, the callback will handle display
    _lastMessage = message;
    _totalCount = totalCount;
    _step = step;
    _currentBarProgressInfo = barProgressInfo;
  }

  void displayError() {
    final console = ConsoleManager.instance;
    // Replace the flow_messages with an error message
    console.write(
      (_lastMessage?.replaceAll(RegExp(_spinnerChars.join('|')), ''))?.red ??
          'An error occurred'.red,
      id: 'flow_messages',
    );
  }

  void pauseForUserAction() {
    _isPaused = true;
    _stopwatch.stop();
  }
  
  void resumeAfterUserAction() {
    _isPaused = false;
    _stopwatch.start();
  }

  void displaySuccess(String message) {
    // Clear the loading display
    ConsoleManager.instance.excludeConsoleId('flow_messages');
    
    // Calculate total elapsed time
    final timeString = _formatElapsedTime(_stopwatch.elapsedMilliseconds);

    // Display success message
    final console = ConsoleManager.instance;
    console.writeLine(message, id: 'flow_success_message');
    console.writeLine('\nCompleted in $timeString'.dim, id: 'flow_success_time');

    dispose();
  }

  void dispose() {
    _stopwatch.stop();
    // Clear the flow_messages when disposing
    ConsoleManager.instance.excludeConsoleId('flow_messages');
    ConsoleManager.instance.excludeConsoleId('flow_success_message');
    ConsoleManager.instance.excludeConsoleId('flow_success_time');
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