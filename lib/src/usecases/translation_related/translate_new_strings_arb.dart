import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

/// Translates new ARB strings for all project languages except the reference.
AsyncBabelResult<
  Map<LanguageCode, Map<CountryCode, Map<TranslationKey, TranslationContent>>>
>
translateNewStringsArb({
  required String projectApiToken,
  required GitVariables gitVariables,
  required BabelSupportedLocales referenceLocale,
  required Client client,
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

  final Map<L10nKey, L10nValue> referenceTranslation = {};

  final Map<BabelSupportedLocales, Map<L10nKey, L10nValue>> referenceMap = {};
  for (final Translatables element in currentPayloadInfo.referenceMap) {
    if (element.locale == referenceLocale) {
      referenceTranslation.addAll(element.referenceMap);
    }
    referenceMap[element.locale] = element.referenceMap;
  }

  for (final locale in projectLanguages) {
    if (referenceMap.containsKey(locale) == false) {
      referenceMap[locale] = {};
    }
  }

  for (final projectLanguage in currentPayloadInfo.referenceMap) {
    try {
      final result = await client.publicTranslateArb.translate(
        projectApiToken: projectApiToken,
        projectShaIdentifier: gitVariables.projectShaIdentifier,
        toLanguageCode: projectLanguage.locale.languageCode,
        toCountryCode: projectLanguage.locale.countryCode,
        referenceLanguageCode: referenceLocale.languageCode,
        referenceCountryCode: referenceLocale.countryCode,
        referenceArb: referenceTranslation,
        pathsOfKeys: ArbKeysAppearancesPath(
          pathAppearancesPerKey: pathAppearancesPerKey,
        ),
      );

      if (madeTranslations[projectLanguage.locale.languageCode] == null) {
        madeTranslations[projectLanguage.locale.languageCode] = {};
      }
      madeTranslations[projectLanguage.locale.languageCode]![projectLanguage
              .locale
              .countryCode] =
          result;
    } catch (error, stackTrace) {
      return BabelFailureResponse.withErrorAndStackTrace(
        exception: BabelException(
          title: 'Translation API request failed',
          description:
              'Failed to translate ARB strings for ${projectLanguage.locale.languageCode}_${projectLanguage.locale.countryCode}. This may be due to API key issues, network connectivity problems, or the translation service being temporarily unavailable. Please check your API key and internet connection',
        ),
        error: error,
        stackTrace: stackTrace,
      ).toFailure();
    }
  }

  return Success(madeTranslations);
}

/// Builder for the generate flow state
AsyncBabelResult<GenerateFlowTranslatedNewStringsArb>
generate_translateNewStringsArb(GenerateFlowExtractedCodeBase payload) async {
  return translateNewStringsArb(
    projectApiToken: payload.projectApiToken,
    gitVariables: payload.gitVariables,
    referenceLocale: payload.inputedByUserLocale,
    client: payload.client.server,
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
