import 'dart:async';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/extract_hardcode_string/hardcoded_string_entity.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

@override
AsyncBabelResult<List<HardcodedStringEntity>>
defineWhichStringLabelIsUserFacing({
  required List<HardcodedStringEntity> strings,
  required Client client,
  required String projectApiToken,
  required BigInt projectShaIdentifier,
  required bool dangerouslyAutoDetectUserFacingHardcodedStrings,
}) async {
  if (strings.isEmpty) return <HardcodedStringEntity>[].toSuccess();

  final Map<Sha1, HardCodedString> fieldsToBeAnalysed = {};
  for (final string in strings) {
    final sha1Result = generateSha1(string.value.trimHardcodedString);
    if (sha1Result.isError()) {
      return BabelFailureResponse.onlyBabelException(
        exception: sha1Result.exceptionOrNull()!,
      ).toFailure();
    }
  }

  final Map<Sha1, IsUserFacingString> combinedResults = {};

  final ReviewSessionUuid sessionUuid = await client.publicStringsReviewSession
      .createSession(
        projectApiToken: projectApiToken,
        projectShaIdentifier: projectShaIdentifier,
        createdAt: DateTime.now(),
        hardcodedStringsToBeAnalysed: fieldsToBeAnalysed,
        dangerouslyAutoDetectUserFacingHardcodedStrings:
            dangerouslyAutoDetectUserFacingHardcodedStrings,
      );

  final Stream<Map<Sha1, AiGeneratedIsUserFacingString>> sessionResponse =
      client.publicStringsReviewSession.getSessionResponse(
        sessionUuid: sessionUuid,
      );
  final Completer<void> completer = Completer<void>();
  final StreamSubscription<Map<String, bool>> subscription = sessionResponse
      .listen((data) {
        combinedResults.addAll(data);
      }, onDone: completer.complete);
  await completer.future;
  await subscription.cancel();

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
generate_defineWhichStringLabelIsUserFacing(
  GenerateFlowExtractedAllStrings payload,
) async {
  // Skip processing if there are no extracted strings
  if (payload.allExtractedStrings.isEmpty) {
    return GenerateFlowDefinedStringLabels(
      willLog: payload.willLog,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      inputedByUserLocale: payload.inputedByUserLocale,
      dangerouslyAutoDetectUserFacingHardcodedStrings:
          payload.dangerouslyAutoDetectUserFacingHardcodedStrings,
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
      labelStrings: <HardcodedStringEntity>[],
    ).toSuccess();
  }

  final labelStringsResult = await defineWhichStringLabelIsUserFacing(
    client: payload.client.server,
    strings: payload.allExtractedStrings,
    projectApiToken: payload.projectApiToken,
    projectShaIdentifier: payload.gitVariables.projectShaIdentifier,
    dangerouslyAutoDetectUserFacingHardcodedStrings: true,
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
    labelStrings: labelStrings,
  ).toSuccess();
}
