import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<GenerateFlowCreatedHardcodedStringReviewSession>
    generate_createHardcodedStringReviewSession(
  GenerateFlowExtractedAllStrings payload,
) async {
  if (payload.allExtractedStrings.isEmpty) {
    return GenerateFlowCreatedHardcodedStringReviewSession(
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
      sessionUuid: null,
      fieldsToBeAnalysed: {},
    ).toSuccess();
  }

  final Map<Sha1, HardCodedString> fieldsToBeAnalysed = {};
  for (final string in payload.allExtractedStrings) {
    final sha1Result = generateSha1(string.value.trimHardcodedString);
    if (sha1Result.isError()) {
      return BabelFailureResponse.onlyBabelException(
        exception: sha1Result.exceptionOrNull()!,
      ).toFailure();
    }
    fieldsToBeAnalysed[sha1Result.getOrThrow()] = string.value.trimHardcodedString;
  }

  try {
    final ReviewSessionUuid sessionUuid = await payload.client.server
        .publicStringsReviewSession
        .createSession(
      projectApiToken: payload.projectApiToken,
      projectShaIdentifier: payload.gitVariables.projectShaIdentifier,
      createdAt: DateTime.now(),
      hardcodedStringsToBeAnalysed: fieldsToBeAnalysed,
      dangerouslyAutoDetectUserFacingHardcodedStrings:
          payload.dangerouslyAutoDetectUserFacingHardcodedStrings,
    );

    return GenerateFlowCreatedHardcodedStringReviewSession(
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
      sessionUuid: sessionUuid,
      fieldsToBeAnalysed: fieldsToBeAnalysed,
    ).toSuccess();
  } catch (e) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Failed to create review session',
        description: 'Error creating hardcoded string review session: $e',
      ),
    ).toFailure();
  }
}