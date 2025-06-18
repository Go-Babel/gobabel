import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<GenerateHistory> uploadTranslationNewVersion({
  required Client client,
  required GitVariables gitVariables,
  required String projectApiToken,
  required Set<ContextPath> codeBase,
  required Map<
    LanguageCode,
    Map<CountryCode, Map<TranslationKey, TranslationContent>>
  >
  madeTranslations,
  required TranslationPayloadInfo currentPayloadInfo,
}) async {
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
      // hardcodedStringMap: Dependencies.newAddedHardcodedStringKeyCache,
      hardcodedStringToKeyCache: currentPayloadInfo.hardcodedStringToKeyCache,
      keyToDeclaration: currentPayloadInfo.keyToDeclaration,
      keyToImplementation: currentPayloadInfo.keyToImplementation,
    );

    return generatedHistory.toSuccess();
  } catch (e) {
    return Exception('Error uploading translation: $e').toFailure();
  }
}

/// Creates a stream of translation chunks that are within API limits
Stream<
  Map<LanguageCode, Map<CountryCode, Map<TranslationKey, TranslationContent>>>
>
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

        // Wait 100ms between each chunk to avoid overwhelming the server
        await Future.delayed(Duration(milliseconds: 100));
      }
    }
  }
}

AsyncResult<GenerateFlowUploadedNewTranslations>
generate_uploadTranslationNewVersion(
  GenerateFlowTranslatedNewStringsArb payload,
) {
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
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitVariables: payload.gitVariables,
      maxLanguageCount: payload.maxLanguageCount,
      languages: payload.languages,
      downloadLink: payload.downloadLink,
      referenceArbMap: payload.referenceArbMap,
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
