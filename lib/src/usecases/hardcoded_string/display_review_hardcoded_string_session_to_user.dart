import 'dart:async';
import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/utils/console_manager.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

// Global timer reference to allow cancellation when loading resumes
Timer? _sessionTimer;

// Track how many lines were written during the review session display
int _reviewSessionLinesWritten = 0;

AsyncBabelResult<GenerateFlowDisplayedSessionReviewToUser>
    generate_displayReviewHardcodedStringSessionToUser(
  GenerateFlowCreatedHardcodedStringReviewSession payload,
) async {
  try {
    final response = GenerateFlowDisplayedSessionReviewToUser(
      willLog: payload.willLog,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      inputedByUserLocale: payload.inputedByUserLocale,
      dangerouslyAutoDetectUserFacingHardcodedStrings:
          payload.dangerouslyAutoDetectUserFacingHardcodedStrings,
      dangerouslyAutoAcceptAllHardcodedStringsAsUserFacing:
          payload.dangerouslyAutoAcceptAllHardcodedStringsAsUserFacing,
      runForAllFiles: payload.runForAllFiles,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitVariables: payload.gitVariables,
      maxLanguageCount: payload.maxLanguageCount,
      languages: payload.languages,
      projectCacheMap: payload.projectCacheMap,
      cacheMapTranslationPayloadInfo: payload.cacheMapTranslationPayloadInfo,
      filesVerificationState: payload.filesVerificationState,
      projectArbData: payload.projectArbData,
      remapedArbKeys: payload.remapedArbKeys,
      codebaseArbTranslationPayloadInfo:
          payload.codebaseArbTranslationPayloadInfo,
      allExtractedStrings: payload.allExtractedStrings,
      sessionUuid: payload.sessionUuid,
      fieldsToBeAnalysed: payload.fieldsToBeAnalysed,
    );

    // Skip display if either dangerous flag is true
    if (payload.dangerouslyAutoDetectUserFacingHardcodedStrings ||
        payload.dangerouslyAutoAcceptAllHardcodedStringsAsUserFacing) {
      _reviewSessionLinesWritten = 0; // Ensure counter is reset
      return response.toSuccess();
    }

    // Get the base URL from the client host
    final baseUrl = payload.client.host
        // replace local host with the correct port for the web server for debugging
        .replaceAll('localhost:8080', 'localhost:8082');
    final sessionUuid = payload.sessionUuid;
    
    // sessionUuid should not be null at this point, but check anyway
    if (sessionUuid == null) {
      return BabelFailureResponse.onlyBabelException(
        exception: BabelException(
          title: 'Session UUID is null',
          description: 'Cannot display review session without a valid session UUID.',
        ),
      ).toFailure();
    }

    // Construct the full URL
    final reviewUrl = '${baseUrl}review-hardcoded-strings-session/$sessionUuid';

    // Pause the loading indicator
    LoadingIndicator.instance.pauseForUserAction();
    
    // Add a small delay to ensure the console stream is fully released
    await Future.delayed(const Duration(milliseconds: 100));

    // Reset line counter for new session
    _reviewSessionLinesWritten = 0;

    // Fetch session expiration time
    DateTime? sessionExpirationTime;
    try {
      sessionExpirationTime = await payload.client.server
          .publicStringsReviewSession
          .getSessionStartTime(sessionUuid);
    } catch (e) {
      // If we can't get the expiration time, continue without timer
      ConsoleManager.instance.warning('Could not fetch session expiration time', id: 'review_session_warning');
      _reviewSessionLinesWritten++; // Count warning line
    }

    // Print the URL in blue color using chalk
    ConsoleManager.instance.writeLine('', id: 'review_session_empty1'); // Empty line
    _reviewSessionLinesWritten++;
    ConsoleManager.instance.writeLine(reviewUrl.blue, id: 'review_session_url');
    _reviewSessionLinesWritten++;
    ConsoleManager.instance.writeLine('', id: 'review_session_empty2'); // Empty line
    _reviewSessionLinesWritten++;
    ConsoleManager.instance.writeLine('Opening review session in your default browser...', id: 'review_session_info');
    _reviewSessionLinesWritten++;
    ConsoleManager.instance.writeLine('', id: 'review_session_empty3'); // Empty line
    _reviewSessionLinesWritten++;
    
    // Start the countdown timer if we have expiration time
    if (sessionExpirationTime != null) {
      ConsoleManager.instance.writeLine('Session will expire in 1 hour. Timer will update below:', id: 'review_session_expire_info');
      _reviewSessionLinesWritten++;
      ConsoleManager.instance.writeLine('Waiting for you to complete the review in your browser...', id: 'review_session_waiting');
      _reviewSessionLinesWritten++;
      
      _startSessionCountdownTimer(sessionExpirationTime);
    }

    // Determine the command based on the operating system
    String command;
    if (Platform.isMacOS) {
      command = 'open "$reviewUrl"';
    } else if (Platform.isLinux) {
      command = 'xdg-open "$reviewUrl"';
    } else if (Platform.isWindows) {
      command = 'start "$reviewUrl"';
    } else {
      // Fallback - just print the URL
      ConsoleManager.instance.writeLine('Please open the following URL in your browser:', id: 'review_session_manual_open');
      _reviewSessionLinesWritten += 2; // Count the fallback lines
      ConsoleManager.instance.writeLine(reviewUrl.blue, id: 'review_session_manual_url');
      return response.toSuccess();
    }

    // Run the command to open the browser
    await runBabelProcess(command: command, dirrPath: payload.directoryPath);

    return response.toSuccess();
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      error: error,
      stackTrace: stackTrace,
      exception: BabelException(
        title: 'Failed to display review session',
        description:
            'An error occurred while trying to open the review session in the browser.',
      ),
    ).toFailure();
  }
}

void _startSessionCountdownTimer(DateTime sessionExpirationTime) {
  // Cancel any existing timer
  _sessionTimer?.cancel();
  
  final console = ConsoleManager.instance;
  
  // Store initial cursor position for the timer line
  console.writeLine('', id: 'review_session_timer'); // Create a dedicated line for the timer
  _reviewSessionLinesWritten++;
  
  _sessionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
    final now = DateTime.now();
    final remaining = sessionExpirationTime.difference(now);
    
    if (remaining.isNegative) {
      // Move up to timer line, clear it, and print final message
      console.moveCursorUp(1);
      console.clearLine();
      console.writeLine('⏰ Session has expired!'.red.bold, id: 'review_session_timer');
      console.moveCursorDown(1);
      timer.cancel();
      _sessionTimer = null;
      // Don't cleanup here, let the stream completion handle it
      return;
    }
    
    final totalMinutes = remaining.inMinutes;
    final hours = remaining.inHours;
    final minutes = remaining.inMinutes.remainder(60);
    final seconds = remaining.inSeconds.remainder(60);
    
    // Format time string
    String timeString;
    if (hours > 0) {
      timeString = '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      timeString = '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
    
    // Determine color based on time remaining
    String coloredTime;
    String statusIcon;
    if (totalMinutes >= 35) {
      coloredTime = timeString.green.bold;
      statusIcon = '✅';
    } else if (totalMinutes >= 10) {
      coloredTime = timeString.yellow.bold;
      statusIcon = '⚠️';
    } else {
      coloredTime = timeString.red.bold;
      statusIcon = '⚠️';
    }
    
    // Move up to the timer line, clear it, and update with new time
    console.moveCursorUp(1);
    console.clearLine();
    console.write('$statusIcon Session time remaining: $coloredTime', id: 'review_session_timer');
    console.moveCursorDown(1);
    console.flush();
  });
}

// Function to stop the session timer (can be called from other files)
void stopSessionCountdownTimer() {
  if (_sessionTimer != null && _sessionTimer!.isActive) {
    _sessionTimer!.cancel();
    _sessionTimer = null;
  }
  
  // Clear all the review session output lines
  cleanupReviewSessionDisplay();
}

// Function to clean up all review session display lines
void cleanupReviewSessionDisplay() {
  if (_reviewSessionLinesWritten > 0) {
    try {
      final console = ConsoleManager.instance;
      
      // Clear the current line first
      console.clearLine();
      console.moveCursorToLineStart();
      
      // Move up and clear each line that was written during review session
      // This includes all the lines we wrote plus the timer line
      for (int i = 0; i < _reviewSessionLinesWritten + 1; i++) {
        console.moveCursorUp(1);
        console.clearLine();
      }
      
      // Also need to clear the PAUSED line from LoadingIndicator
      console.moveCursorUp(1);
      console.clearLine();
      
      // Move cursor to start of line
      console.moveCursorToLineStart();
      
      // Reset the counter
      _reviewSessionLinesWritten = 0;
    } catch (_) {
      // Ignore errors if console operations fail
      _reviewSessionLinesWritten = 0;
    }
  }
}
