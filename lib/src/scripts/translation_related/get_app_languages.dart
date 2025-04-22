import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';
import 'package:gobabel_core/go_babel_core.dart';

class GetAppLanguagesUsecase {
  Future<void> call({required String token}) async {
    final GitVariables gitVariables = Dependencies.gitVariables;
    final languagesResponse = await Dependencies.client.syncProject
        .getProjectLanguages(
          projectShaIdentifier: gitVariables.projectShaIdentifier,
        );

    if (languagesResponse.languages.isEmpty) {
      throw Exception(
        'Failed to get project dependencies. Please run sync command if it\'s a new project. Double-check if your token key is valid and not misstyped.',
      );
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
