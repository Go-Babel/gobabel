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

    final bool dangerouslyAutoDetectUserFacingHardcodedStrings =
        payload.dangerouslyAutoDetectUserFacingHardcodedStrings;
    if (dangerouslyAutoDetectUserFacingHardcodedStrings) {
      return response.toSuccess();
    }

    // Get the base URL from the client host
    final baseUrl = payload.client.host
        // replace local host with the correct port for the web server for debugging
        .replaceAll('localhost:8080', 'localhost:8082');
    final sessionUuid = payload.sessionUuid;

    // Construct the full URL
    final reviewUrl = '${baseUrl}review-hardcoded-strings-session/$sessionUuid';

    // Pause the loading indicator
    LoadingIndicator.instance.pauseForUserAction();

    // Print the URL in blue color using chalk
    print('\n${reviewUrl.blue}\n');
    print('Opening review session in your default browser...\n');

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
