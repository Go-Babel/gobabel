import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/go_babel_core.dart';

class TranslateNewStringsArbUsecase {
  const TranslateNewStringsArbUsecase();

  Future<void> call({
    required String token,
    required BabelSupportedLocales referenceLocale,
  }) async {
    final GitVariables gitVariables = Dependencies.gitVariables;

    final Map<
      LanguageCode,
      Map<CountryCode, Map<TranslationKey, TranslationContent>>
    >
    madeTranslations = {};

    for (final projectLanguage in Dependencies.projectLanguages) {
      final result = await Dependencies.client.translateArb.translate(
        token: token,
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
