import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
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

  // Separate reference locale from locales needing translation
  final List<Translatables> localesNeedingTranslation = [];

  for (final Translatables translatable in currentPayloadInfo.referenceMap) {
    final BabelSupportedLocales locale = translatable.locale;
    if (madeTranslations[locale.languageCode] == null) {
      madeTranslations[locale.languageCode] = {};
    }

    final bool isReferenceLocale = locale == referenceLocale;
    if (isReferenceLocale) {
      // We can add directly, no translation needed.
      madeTranslations[locale.languageCode]![locale.countryCode] =
          translatable.referenceMap;
    } else {
      localesNeedingTranslation.add(translatable);
    }
  }

  // Process translations for each locale
  if (localesNeedingTranslation.isNotEmpty) {
    // Track total work items for progress bar
    final List<_TranslationWorkItem> allWorkItems = [];

    // First, prepare all work items by splitting pending translations into manageable groups
    for (final translatable in localesNeedingTranslation) {
      final locale = translatable.locale;

      // Separate already translated from pending translations
      final Map<L10nKey, L10nValue> pendingTranslations = {};
      final Map<L10nKey, L10nValue> alreadyTranslated = {};

      referenceTranslation.forEach((key, value) {
        final bool hasCache = translatable.referenceMap.containsKey(key);

        if (hasCache) {
          alreadyTranslated[key] = translatable.referenceMap[key]!;
        } else {
          pendingTranslations[key] = value;
        }
      });

      // Skip if no pending translations
      if (pendingTranslations.isEmpty) {
        // Add directly to results
        madeTranslations[locale.languageCode]![locale.countryCode] = Map.from(
          alreadyTranslated,
        );
        continue;
      }

      // Split pending translations into manageable groups for API
      final groups = splitIntoManageableGroupsForApi(pendingTranslations);

      // Create work items for each group
      for (final group in groups) {
        allWorkItems.add(
          _TranslationWorkItem(
            locale: locale,
            pendingGroup: group,
            alreadyTranslated: alreadyTranslated,
          ),
        );
      }
    }

    // Process work items in parallel batches
    if (allWorkItems.isNotEmpty) {
      const batchSize = 3;
      final totalWorkItems = allWorkItems.length;
      final bool showProgressBar = totalWorkItems > 2;
      int processedItems = 0;

      for (
        int batchStart = 0;
        batchStart < totalWorkItems;
        batchStart += batchSize
      ) {
        final batchEnd = (batchStart + batchSize).clamp(0, totalWorkItems);
        final batch = allWorkItems.sublist(batchStart, batchEnd);

        // Update progress bar at the start of each batch
        if (showProgressBar) {
          LoadingIndicator.instance.setLoadingProgressBar(
            message: 'Translating ARB files to different languages...',
            barProgressInfo: BarProgressInfo(
              message: 'Processing translation groups...',
              totalSteps: totalWorkItems,
              currentStep: processedItems + 1,
            ),
          );
        }

        // Create futures for parallel execution
        final futures = <Future<_TranslationResult>>[];

        for (final workItem in batch) {
          futures.add(() async {
            // Make API call for this group
            final pendingTranslated = await client.publicTranslateArb.translate(
              projectApiToken: projectApiToken,
              projectShaIdentifier: gitVariables.projectShaIdentifier,
              toLanguageCode: workItem.locale.languageCode,
              toCountryCode: workItem.locale.countryCode,
              referenceLanguageCode: referenceLocale.languageCode,
              referenceCountryCode: referenceLocale.countryCode,
              referenceArb: workItem.pendingGroup,
              pathsOfKeys: ArbKeysAppearancesPath(
                pathAppearancesPerKey: pathAppearancesPerKey,
              ),
            );

            return _TranslationResult(
              locale: workItem.locale,
              translations: pendingTranslated,
              alreadyTranslated: workItem.alreadyTranslated,
            );
          }());
        }

        try {
          // Execute all futures in the batch in parallel
          final results = await Future.wait(futures);

          // Process results
          for (final result in results) {
            final locale = result.locale;

            // Merge translations for this locale
            if (madeTranslations[locale.languageCode]![locale.countryCode] ==
                null) {
              madeTranslations[locale.languageCode]![locale.countryCode] = {};
            }

            // Add already translated items (only once per locale)
            if (result.alreadyTranslated.isNotEmpty &&
                madeTranslations[locale.languageCode]![locale.countryCode]!
                    .isEmpty) {
              madeTranslations[locale.languageCode]![locale.countryCode]!
                  .addAll(result.alreadyTranslated);
            }

            // Add newly translated items
            madeTranslations[locale.languageCode]![locale.countryCode]!.addAll(
              result.translations,
            );

            processedItems++;

            // Update progress bar after each completed work item
            if (showProgressBar && processedItems < totalWorkItems) {
              LoadingIndicator.instance.setLoadingProgressBar(
                message: 'Translating ARB files to different languages...',
                barProgressInfo: BarProgressInfo(
                  message: 'Processing translation groups...',
                  totalSteps: totalWorkItems,
                  currentStep: processedItems + 1,
                ),
              );
            }
          }
        } catch (error, stackTrace) {
          // Extract locale information from the batch for better error messaging
          final failedInfo = batch
              .map((w) => '${w.locale.languageCode}_${w.locale.countryCode}')
              .toSet()
              .join(', ');

          return BabelFailureResponse.withErrorAndStackTrace(
            exception: BabelException(
              title: 'Translation API request failed',
              description:
                  'Failed to translate ARB strings for work items in locales: $failedInfo. '
                  'This may be due to API key issues, network connectivity problems, or the translation service being temporarily unavailable. '
                  'Please check your API key and internet connection',
            ),
            error: error,
            stackTrace: stackTrace,
          ).toFailure();
        }
      }
    }
  }

  return Success(madeTranslations);
}

// Helper classes for managing translation work items
class _TranslationWorkItem {
  final BabelSupportedLocales locale;
  final Map<L10nKey, L10nValue> pendingGroup;
  final Map<L10nKey, L10nValue> alreadyTranslated;

  const _TranslationWorkItem({
    required this.locale,
    required this.pendingGroup,
    required this.alreadyTranslated,
  });
}

class _TranslationResult {
  final BabelSupportedLocales locale;
  final Map<L10nKey, L10nValue> translations;
  final Map<L10nKey, L10nValue> alreadyTranslated;

  const _TranslationResult({
    required this.locale,
    required this.translations,
    required this.alreadyTranslated,
  });
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
      hardcodedStringsPayloadInfo: payload.hardcodedStringsPayloadInfo,
      hardcodedStringsPerFile: payload.hardcodedStringsPerFile,
      contextPaths: payload.contextPaths,
      madeTranslations: translations,
    );
  });
}
