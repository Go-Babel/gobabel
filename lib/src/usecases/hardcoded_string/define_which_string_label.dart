import 'dart:async';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/extract_hardcode_string/hardcoded_string_entity.dart';
import 'package:gobabel/src/usecases/hardcoded_string/display_review_hardcoded_string_session_to_user.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

@override
AsyncBabelResult<List<HardcodedStringEntity>>
listenToUserFacingHardcodedStringSessionResult({
  required List<HardcodedStringEntity> strings,
  required Client client,
  required ReviewSessionUuid sessionUuid,
  required Map<Sha1, HardCodedString> fieldsToBeAnalysed,
}) async {
  if (strings.isEmpty) {
    return <HardcodedStringEntity>[].toSuccess();
  }

  final Map<Sha1, IsUserFacingString> combinedResults = {};
  Map<Sha1, NewRemapedString> remapedStrings = {};
  final Stream<ReviewSessionResponse> sessionResponse = client
      .publicStringsReviewSession
      .getSessionResponse(sessionUuid: sessionUuid);
  final Completer<void> completer = Completer<void>();
  BabelFailureResponse? streamError;
  final StreamSubscription<ReviewSessionResponse> subscription = sessionResponse
      .listen(
        (data) {
          combinedResults.addAll(data.sessionResponse);
          remapedStrings.addAll(data.remapedHardcodedString);
        },
        onError: (error) {
          // Stop the session timer on error
          stopSessionCountdownTimer();
          streamError = BabelFailureResponse.withErrorAndStackTrace(
            exception: BabelException(
              title: 'Error in Hardcoded String Review Session',
              description: error.toString(),
            ),
            error: error,
            stackTrace: StackTrace.current,
          );
          completer.complete();
        },
        onDone: () async {
          // Stop the session timer when the stream completes
          stopSessionCountdownTimer();
          try {
            await client.publicStringsReviewSession
                .notifyThatSessionCanBeDisposedSession(
                  sessionUuid: sessionUuid,
                );
          } catch (_) {}
          completer.complete();
        },
      );
  await completer.future;
  await subscription.cancel();
  if (streamError != null) {
    return streamError!.toFailure();
  }

  // Filter and update the strings that needed validation based on the server responses
  final List<HardcodedStringEntity> apiValidatedStrings = [];
  for (final string in strings) {
    final trimmedString = string.value.trimHardcodedString;
    // First find the SHA for this string value
    Sha1? sha1;
    for (final entry in fieldsToBeAnalysed.entries) {
      if (entry.value == trimmedString) {
        sha1 = entry.key;
        break;
      }
    }

    // Check if SHA exists and if the result is true
    if (sha1 != null && combinedResults[sha1] == true) {
      // Check if this string has been remapped
      final remappedContent = remapedStrings[sha1];
      if (remappedContent != null) {
        // Create a new entity with the remapped content
        apiValidatedStrings.add(
          HardcodedStringEntity(
            value: remappedContent,
            filePath: string.filePath,
            parentStartIndex: string.parentStartIndex,
            parentEndIndex: string.parentEndIndex,
            fileStartIndex: string.fileStartIndex,
            fileEndIndex: string.fileEndIndex,
            dynamicFields: string.dynamicFields,
          ),
        );
      } else {
        // Use the original string
        apiValidatedStrings.add(string);
      }
    }
  }

  return apiValidatedStrings.toSuccess();
}

AsyncBabelResult<GenerateFlowDefinedStringLabels>
generate_listenToUserFacingHardcodedStringSessionResult(
  GenerateFlowDisplayedSessionReviewToUser payload,
) async {
  // Resume the loading indicator when user completes the review
  // Note: The session timer is already stopped in listenToUserFacingHardcodedStringSessionResult
  LoadingIndicator.instance.resumeAfterUserAction();

  // If the new flag is true, accept all hardcoded strings as user-facing
  if (payload.dangerouslyAutoAcceptAllHardcodedStringsAsUserFacing) {
    return GenerateFlowDefinedStringLabels(
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
      labelStrings: payload.allExtractedStrings, // Accept all strings
    ).toSuccess();
  }

  // Skip processing if there are no extracted strings or no session
  if (payload.allExtractedStrings.isEmpty || payload.sessionUuid == null) {
    return GenerateFlowDefinedStringLabels(
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
      labelStrings: <HardcodedStringEntity>[],
    ).toSuccess();
  }

  final labelStringsResult =
      await listenToUserFacingHardcodedStringSessionResult(
        client: payload.client.server,
        strings: payload.allExtractedStrings,
        sessionUuid: payload.sessionUuid!,
        fieldsToBeAnalysed: payload.fieldsToBeAnalysed,
      );

  if (labelStringsResult.isError()) {
    return labelStringsResult.asBabelResultErrorAsync();
  }

  final labelStrings = labelStringsResult.getOrThrow();

  return GenerateFlowDefinedStringLabels(
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
    labelStrings: labelStrings,
  ).toSuccess();
}
