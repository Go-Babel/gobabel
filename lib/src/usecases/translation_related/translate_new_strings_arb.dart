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

  final Map<L10nKey, L10nValue> referenceTranslation =
      currentPayloadInfo.referenceMap
          .firstWhere((element) => element.locale == referenceLocale)
          .referenceMap;

  // First, let's ensure that the reference translation has ALL the keys so it is a good reference.
  if (referenceTranslation.isEmpty) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Reference translation is empty',
        description:
            'The language "$referenceLocale" translation does not contain any translations. '
            'Please ensure that the reference translation is correctly set up.',
      ),
    ).toFailure();
  }
  for (final Translatables translatable in currentPayloadInfo.referenceMap) {
    for (final L10nKey value in translatable.referenceMap.keys) {
      if (!referenceTranslation.containsKey(value)) {
        return BabelFailureResponse.onlyBabelException(
          exception: BabelException(
            title: 'Missing key in reference ARB',
            description:
                'The reference ARB file is missing the key "$value". '
                'Please ensure that the reference ARB (in language "$referenceLocale") file contains all necessary keys.',
          ),
        ).toFailure();
      }
    }
  }

  for (final Translatables translatable in currentPayloadInfo.referenceMap) {
    final BabelSupportedLocales locale = translatable.locale;
    try {
      // Not all fields need to be translated because some of them are already translated and should not be overwritten.
      final Map<L10nKey, L10nValue> pendingTranslations = {};
      final Map<L10nKey, L10nValue> alreadyTranslated = {};

      referenceTranslation.forEach((key, value) {
        final bool hasCache = translatable.referenceMap.containsKey(key);

        if (hasCache) {
          alreadyTranslated[key] = value;
        } else {
          pendingTranslations[key] = value;
        }
      });

      final Map<L10nKey, L10nValue> pendingTranslated = await client
          .publicTranslateArb
          .translate(
            projectApiToken: projectApiToken,
            projectShaIdentifier: gitVariables.projectShaIdentifier,
            toLanguageCode: locale.languageCode,
            toCountryCode: locale.countryCode,
            referenceLanguageCode: referenceLocale.languageCode,
            referenceCountryCode: referenceLocale.countryCode,
            referenceArb: pendingTranslations,
            pathsOfKeys: ArbKeysAppearancesPath(
              pathAppearancesPerKey: pathAppearancesPerKey,
            ),
          );

      if (madeTranslations[locale.languageCode] == null) {
        madeTranslations[locale.languageCode] = {};
      }
      madeTranslations[locale.languageCode]![locale.countryCode] =
          pendingTranslated;
      madeTranslations[locale.languageCode]![locale.countryCode] =
          alreadyTranslated;
    } catch (error, stackTrace) {
      return BabelFailureResponse.withErrorAndStackTrace(
        exception: BabelException(
          title: 'Translation API request failed',
          description:
              'Failed to translate ARB strings for ${locale.languageCode}_${locale.countryCode}. This may be due to API key issues, network connectivity problems, or the translation service being temporarily unavailable. Please check your API key and internet connection',
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
