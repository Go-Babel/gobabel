import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';
import 'package:gobabel_core/gobabel_core.dart';

class GetAppLanguagesUsecase {
  Future<void> call({required String token}) async {
    final BabelSupportedLocales inputedByUserLocale =
        Dependencies.referenceLanguage;
    final GitVariables gitVariables = Dependencies.gitVariables;
    final languagesResponse = await Dependencies.client.publicProject
        .getProjectLanguages(
          projectShaIdentifier: gitVariables.projectShaIdentifier,
        );

    Dependencies.maxLanguageCount = languagesResponse.maxLanguageCount;

    if (languagesResponse.languages.isEmpty) {
      Dependencies.projectLanguages.addAll([inputedByUserLocale]);
    }

    final List<BabelSupportedLocales> castedSupportedLocales = [];

    for (final language in languagesResponse.languages) {
      final castedLanguage = BabelSupportedLocales.fromLocale(
        language.languageCode,
        language.countryCode,
      );
      if (castedLanguage == null) {
        throw Exception('Invalid language/country code for $language');
      }
      castedSupportedLocales.add(castedLanguage);
    }

    Dependencies.projectLanguages.addAll(castedSupportedLocales);
  }
}
