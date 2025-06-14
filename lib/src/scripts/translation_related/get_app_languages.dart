import 'package:collection/collection.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:dio/dio.dart';

class GetAppLanguagesUsecase {
  final Dio dio;
  GetAppLanguagesUsecase({required this.dio});
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
    } else {
      final String? downloadLink =
          languagesResponse.languages
              .firstWhereOrNull(
                (element) =>
                    element.languageCode == inputedByUserLocale.languageCode &&
                    element.countryCode == inputedByUserLocale.countryCode,
              )
              ?.downloadLink;
      if (downloadLink == null) {
        throw BabelException(
          title:
              'No ".arb" translation download link found for the reference language "$inputedByUserLocale".',
          description:
              'Please make sure the language is supported and try again.',
        );
      }

      final response = await dio.get(
        downloadLink,
        options: Options(responseType: ResponseType.json),
      );

      if (response.data is Map<String, dynamic>) {
        final Map<L10nKey, L10nValue> arbMap =
            ((response.data as Map)['record'] as Map)
                .cast<L10nKey, L10nValue>();

        // print('JSON:\n${JsonEncoder.withIndent('  ').convert(arbMap)}');

        Dependencies.referenceLanguageJson = arbMap;

        // Add all ARB keys to alreadyCreatedUniqueKeys
        for (final k in arbMap.keys.where((key) => !key.startsWith('@'))) {
          GaranteeUniquenessOfArbKeysUsecase.addUniqueKeys(k);
        }
      }
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
