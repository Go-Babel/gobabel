import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

/// Translates new ARB strings for all project languages except the reference.
AsyncResult<
  Map<LanguageCode, Map<CountryCode, Map<TranslationKey, TranslationContent>>>
>
translateNewStringsArb({
  required String projectApiToken,
  required GitVariables gitVariables,
  required BabelSupportedLocales referenceLocale,
  required Client client,
  required Map<L10nKey, L10nValue> newLabelsKeys,
  required Set<BabelSupportedLocales> projectLanguages,
  required TranslationPayloadInfo currentPayloadInfo,
}) async {
  final Map<TranslationKey, Set<ContextPath>> pathAppearancesPerKey =
      currentPayloadInfo.keyToContextsPaths;
  final Map<
    LanguageCode,
    Map<CountryCode, Map<TranslationKey, TranslationContent>>
  >
  madeTranslations = {};

  madeTranslations[referenceLocale.languageCode] = {
    referenceLocale.countryCode: newLabelsKeys,
  };

  final pendingToTranslateArb = projectLanguages.where(
    (locale) =>
        locale.languageCode != referenceLocale.languageCode ||
        locale.countryCode != referenceLocale.countryCode,
  );

  for (final projectLanguage in pendingToTranslateArb) {
    try {
      final result = await client.publicTranslateArb.translate(
        projectApiToken: projectApiToken,
        projectShaIdentifier: gitVariables.projectShaIdentifier,
        toLanguageCode: projectLanguage.languageCode,
        toCountryCode: projectLanguage.countryCode,
        referenceLanguageCode: referenceLocale.languageCode,
        referenceCountryCode: referenceLocale.countryCode,
        referenceArb: newLabelsKeys,
        pathsOfKeys: ArbKeysAppearancesPath(
          pathAppearancesPerKey: pathAppearancesPerKey,
        ),
      );

      if (madeTranslations[projectLanguage.languageCode] == null) {
        madeTranslations[projectLanguage.languageCode] = {};
      }
      madeTranslations[projectLanguage.languageCode]![projectLanguage
              .countryCode] =
          result;
    } catch (e) {
      return BabelException(
        title: 'Translation API request failed',
        description: 'Failed to translate ARB strings for ${projectLanguage.languageCode}_${projectLanguage.countryCode}. This may be due to API key issues, network connectivity problems, or the translation service being temporarily unavailable. Please check your API key and internet connection. Error details: $e',
      ).toFailure();
    }
  }

  return Success(madeTranslations);
}

/// Builder for the generate flow state
AsyncResult<GenerateFlowTranslatedNewStringsArb>
generate_translateNewStringsArb(GenerateFlowExtractedCodeBase payload) async {
  return translateNewStringsArb(
    projectApiToken: payload.projectApiToken,
    gitVariables: payload.gitVariables,
    referenceLocale: payload.inputedByUserLocale,
    client: payload.client.server,
    newLabelsKeys: payload.referenceArbMap,
    projectLanguages: payload.languages,
    currentPayloadInfo: payload.hardcodedStringsPayloadInfo,
  ).map((translations) {
    return GenerateFlowTranslatedNewStringsArb(
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
      madeTranslations: translations,
    );
  });
}
