import 'package:collection/collection.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

class GetAppLanguagesResponse {
  final int maxLanguageCount;
  final Set<BabelSupportedLocales> languages;
  final String downloadLink;
  const GetAppLanguagesResponse({
    required this.maxLanguageCount,
    required this.languages,
    required this.downloadLink,
  });
}

AsyncResult<GetAppLanguagesResponse> getAppLanguages({
  required String token,
  required BabelSupportedLocales inputedByUserLocale,
  required Client client,
  required GitVariables gitVariables,
}) async {
  final ({
    List<LanguageDataPayload> languages,
    int maxLanguageCount,
    DateTime updatedAt,
  })
  languagesResponse;
  try {
    languagesResponse = await client.publicProject.getProjectLanguages(
      projectShaIdentifier: gitVariables.projectShaIdentifier,
    );
  } catch (_) {
    return Exception(
      'Could not get project languages. Check your internet connection and try again. But this could be a internal error.',
    ).toFailure();
  }

  final int maxLanguageCount = languagesResponse.maxLanguageCount;
  final Set<BabelSupportedLocales> projectLanguages = {};
  for (final language in languagesResponse.languages) {
    final castedLanguage = BabelSupportedLocales.fromLocale(
      language.languageCode,
      language.countryCode,
    );
    if (castedLanguage == null) {
      return Exception(
        'Invalid language/country code for $language',
      ).toFailure();
    }
    projectLanguages.add(castedLanguage);
  }
  final String? downloadLink =
      languagesResponse.languages
          .firstWhereOrNull(
            (element) =>
                element.languageCode == inputedByUserLocale.languageCode &&
                element.countryCode == inputedByUserLocale.countryCode,
          )
          ?.downloadLink;
  if (downloadLink == null) {
    return BabelException(
      title:
          'No ".arb" translation download link found for the reference language "$inputedByUserLocale".',
      description: 'Please make sure the language is supported and try again.',
    ).toFailure();
  }

  return GetAppLanguagesResponse(
    maxLanguageCount: maxLanguageCount,
    languages: projectLanguages,
    downloadLink: downloadLink,
  ).toSuccess();
}

AsyncResult<GenerateFlowGotAppLanguages> generate_getAppLanguages(
  GenerateFlowGotGitVariables payload,
) {
  final gitVariables = payload.gitVariables;
  final inputedByUserLocale = payload.inputedByUserLocale;
  final client = payload.client.server;
  final accountApiKey = payload.accountApiKey;
  final directoryPath = payload.directoryPath;
  return getAppLanguages(
    token: accountApiKey,
    inputedByUserLocale: inputedByUserLocale,
    client: client,
    gitVariables: gitVariables,
  ).flatMap((response) {
    return GenerateFlowGotAppLanguages(
      willLog: payload.willLog,
      accountApiKey: accountApiKey,
      directoryPath: directoryPath,
      inputedByUserLocale: inputedByUserLocale,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitVariables: gitVariables,
      maxLanguageCount: response.maxLanguageCount,
      languages: response.languages,
      downloadLink: response.downloadLink,
    ).toSuccess();
  });
}
