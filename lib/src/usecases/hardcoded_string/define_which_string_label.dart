import 'dart:async';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/extract_hardcode_string/hardcoded_string_entity.dart';
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
  final Stream<Map<Sha1, AiGeneratedIsUserFacingString>> sessionResponse =
      client.publicStringsReviewSession.getSessionResponse(
        sessionUuid: sessionUuid,
      );
  final Completer<void> completer = Completer<void>();
  BabelFailureResponse? streamError;
  final StreamSubscription<Map<String, bool>> subscription = sessionResponse
      .listen(
        (data) {
          combinedResults.addAll(data);
        },
        onError: (error) {
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

  // Filter the strings that needed validation based on the server responses
  final List<HardcodedStringEntity> apiValidatedStrings =
      strings.where((string) {
        final sha1 = fieldsToBeAnalysed[string.value.trimHardcodedString];
        // Check if SHA exists and if the result is true
        return sha1 != null && combinedResults[sha1] == true;
      }).toList();

  return apiValidatedStrings.toSuccess();
}

AsyncBabelResult<GenerateFlowDefinedStringLabels>
generate_listenToUserFacingHardcodedStringSessionResult(
  GenerateFlowDisplayedSessionReviewToUser payload,
) async {
  // Resume the loading indicator when user completes the review
  LoadingIndicator.instance.resumeAfterUserAction();

  // Skip processing if there are no extracted strings or no session
  if (payload.allExtractedStrings.isEmpty || payload.sessionUuid == null) {
    return GenerateFlowDefinedStringLabels(
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
