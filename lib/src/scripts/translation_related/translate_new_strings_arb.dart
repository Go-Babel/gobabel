import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';

class TranslateNewStringsArbUsecase {
  const TranslateNewStringsArbUsecase();

  Future<void> call({required String projectApiToken}) async {
    final GitVariables gitVariables = Dependencies.gitVariables;

    final Map<
      LanguageCode,
      Map<CountryCode, Map<TranslationKey, TranslationContent>>
    >
    madeTranslations = {};

    final BabelSupportedLocales referenceLocale =
        Dependencies.referenceLanguage;

    final pendingToTranslateArb =
        Dependencies.projectLanguages
            .where(
              (BabelSupportedLocales element) =>
                  element.languageCode != referenceLocale.languageCode &&
                  element.countryCode != referenceLocale.countryCode,
            )
            .toList();

    madeTranslations[referenceLocale.languageCode] = {
      referenceLocale.countryCode: Dependencies.newLabelsKeys,
    };

    final int total = pendingToTranslateArb.length;
    for (final entry in pendingToTranslateArb.asMap().entries) {
      final int index = entry.key;

      final projectLanguage = entry.value;

      final result = await runWithSpinner(
        successMessage:
            '"${"$projectLanguage".greenBright}" hardcoded strings translated',
        message:
            '(${index + 1}/$total) Translating hardcoded strings to "${"$projectLanguage".greenBright}"...',
        () async {
          return await Dependencies.client.publicTranslateArb.translate(
            projectApiToken: projectApiToken,
            projectShaIdentifier: gitVariables.projectShaIdentifier,
            toLanguageCode: projectLanguage.languageCode,
            toCountryCode: projectLanguage.countryCode,
            referenceLanguageCode: referenceLocale.languageCode,
            referenceCountryCode: referenceLocale.countryCode,
            referenceArb: Dependencies.newLabelsKeys,
            pathsOfKeys: ArbKeysAppearancesPath(
              pathAppearancesPerKey: Dependencies.pathAppearancesPerKey,
            ),
          );
        },
      );

      if (madeTranslations[projectLanguage.languageCode] == null) {
        madeTranslations[projectLanguage.languageCode] = {};
      }
      madeTranslations[projectLanguage.languageCode]![projectLanguage
              .countryCode] =
          result;
    }

    Dependencies.madeTranslations = madeTranslations;
  }
}
