import 'dart:async';
import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

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

    // Fetch session expiration time
    DateTime? sessionExpirationTime;
    try {
      sessionExpirationTime = await payload.client.server
          .publicStringsReviewSession
          .getSessionStartTime(sessionUuid);
    } catch (e) {
      // If we can't get the expiration time, continue without timer
      print('Warning: Could not fetch session expiration time'.yellow);
    }

    // Print the URL in blue color using chalk
    print('\n${reviewUrl.blue}\n');
    print('Opening review session in your default browser...\n');
    
    // Start the countdown timer if we have expiration time
    if (sessionExpirationTime != null) {
      print('Session will expire in 1 hour. Timer will update below:');
      _startSessionCountdownTimer(sessionExpirationTime);
      print(''); // Add empty line for timer to display
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
      print('Please open the following URL in your browser:');
      print(reviewUrl.blue);
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
  Timer.periodic(const Duration(seconds: 1), (timer) {
    final now = DateTime.now();
    final remaining = sessionExpirationTime.difference(now);
    
    if (remaining.isNegative) {
      // Clear the current line and print final message
      stdout.write('\r\x1B[K'); // Clear line
      print('⏰ Session has expired!'.red.bold);
      timer.cancel();
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
    
    // Use carriage return to update the same line
    stdout.write('\r\x1B[K'); // Clear line
    stdout.write('$statusIcon Session time remaining: $coloredTime');
  });
}
