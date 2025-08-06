import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<GenerateHistory> uploadTranslationNewVersion({
  required Client client,
  required GitVariables gitVariables,
  required String projectApiToken,
  required Set<ContextPath> codeBase,
  required Map<LanguageCode,
          Map<CountryCode, Map<TranslationKey, TranslationContent>>>
      madeTranslations,
  required TranslationPayloadInfo currentPayloadInfo,
}) async {
  // return BabelFailureResponse.onlyBabelException(
  //   exception: BabelException(title: 'Test functoin', description: 'Blabla'),
  // ).toFailure();

  try {
    final GenerateHistory generatedHistory = await client.publicGenerate(
      gitCommit: gitVariables.previousCommit,
      gitUser: gitVariables.user,
      projectApiToken: projectApiToken,
      projectCodeBaseFolders: codeBase,
      originUrl: gitVariables.originUrl,
      // Create stream of translation chunks
      madeTranslations: _createTranslationStream(madeTranslations),
      projectShaIdentifier: gitVariables.projectShaIdentifier,
      currentCommitSha: gitVariables.latestShaIdentifier,
      pathsOfKeys: ArbKeysAppearancesPath(
        pathAppearancesPerKey: currentPayloadInfo.keyToContextsPaths,
      ),
      hardcodedStringToKeyCache: currentPayloadInfo.hardcodedStringToKeyCache,
      keyToDeclaration: currentPayloadInfo.keyToDeclaration,
      keyToImplementation: currentPayloadInfo.keyToImplementation,
    );

    return generatedHistory.toSuccess();
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Failed to upload translations',
        description:
            'Unable to upload the new translation version to the server. This may be due to network issues, invalid API key, or server problems. Please check your API key and internet connection',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }
}

/// Creates a stream of translation chunks that are within API limits
Stream<
        Map<LanguageCode,
            Map<CountryCode, Map<TranslationKey, TranslationContent>>>>
    _createTranslationStream(
  Map<LanguageCode, Map<CountryCode, Map<TranslationKey, TranslationContent>>>
      madeTranslations,
) async* {
  for (final entry1 in madeTranslations.entries) {
    final LanguageCode languageCode = entry1.key;
    final Map<CountryCode, Map<TranslationKey, TranslationContent>> countryMap =
        entry1.value;

    for (final entry2 in countryMap.entries) {
      final CountryCode countryCode = entry2.key;
      final Map<TranslationKey, TranslationContent> translations = entry2.value;

      // Split translations into manageable chunks
      final chunks = splitIntoManageableGroupsForApi(translations);

      for (final chunk in chunks) {
        yield {
          languageCode: {countryCode: chunk},
        };

        // Wait 150ms between each chunk to avoid overwhelming the server
        await Future.delayed(Duration(milliseconds: 150));
      }
    }
  }
}

AsyncBabelResult<GenerateFlowUploadedNewTranslations>
    generate_uploadTranslationNewVersion(
  GenerateFlowTranslatedNewStringsArb payload,
) async {
  return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
    title: 'Test failure',
    description: 'This is a test failure for uploadTranslationNewVersion',
  )).toFailure();

  return uploadTranslationNewVersion(
    codeBase: payload.contextPaths,
    madeTranslations: payload.madeTranslations,
    projectApiToken: payload.projectApiToken,
    gitVariables: payload.gitVariables,
    client: payload.client.server,
    currentPayloadInfo: payload.hardcodedStringsPayloadInfo,
  ).map((generatedHistory) {
    return GenerateFlowUploadedNewTranslations(
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
      hardcodedStringsPayloadInfo: payload.hardcodedStringsPayloadInfo,
      hardcodedStringsPerFile: payload.hardcodedStringsPerFile,
      contextPaths: payload.contextPaths,
      madeTranslations: payload.madeTranslations,
      generatedHistoryItem: generatedHistory,
    );
  });
}
