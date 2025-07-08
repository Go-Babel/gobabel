import 'package:collection/collection.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
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

AsyncBabelResult<GetAppLanguagesResponse> getAppLanguages({
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
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Failed to fetch project languages',
        description:
            'Unable to retrieve the project languages from the server. '
            'This could be due to network connectivity issues, invalid API credentials, '
            'or server problems. Please check your internet connection and API key, '
            'then try again.',
      ),
      error: error,
      stackTrace: stackTrace,
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
      return BabelFailureResponse.onlyBabelException(
        exception: BabelException(
          title: 'Invalid language code',
          description:
              'Received an invalid language or country code from the server: '
              '${language.languageCode}_${language.countryCode}. '
              'This might indicate a configuration issue with the project. '
              'Please contact support if this error persists.',
        ),
      ).toFailure();
    }
    projectLanguages.add(castedLanguage);
  }
  final String? downloadLink =
      languagesResponse.languages
          .firstWhereOrNull(
            (LanguageDataPayload element) =>
                element.languageCode == inputedByUserLocale.languageCode &&
                element.countryCode == inputedByUserLocale.countryCode,
          )
          ?.downloadLink;

  if (downloadLink == null) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title:
            'No ".arb" translation download link found for the reference language "$inputedByUserLocale".',
        description:
            'Please make sure the language is supported and try again.\n'
            'The supported languages are:\n• ${languagesResponse.languages.map((e) => BabelSupportedLocales.fromLocale(e.languageCode, e.countryCode)).join('\n• ')}',
      ),
    ).toFailure();
  }

  return GetAppLanguagesResponse(
    maxLanguageCount: maxLanguageCount,
    languages: projectLanguages,
    downloadLink: downloadLink,
  ).toSuccess();
}

AsyncBabelResult<GenerateFlowGotAppLanguages> generate_getAppLanguages(
  GenerateFlowGotGitVariables payload,
) {
  final gitVariables = payload.gitVariables;
  final inputedByUserLocale = payload.inputedByUserLocale;
  final client = payload.client.server;
  final accountApiKey = payload.projectApiToken;
  final directoryPath = payload.directoryPath;
  return getAppLanguages(
    token: accountApiKey,
    inputedByUserLocale: inputedByUserLocale,
    client: client,
    gitVariables: gitVariables,
  ).flatMap((response) {
    return GenerateFlowGotAppLanguages(
      willLog: payload.willLog,
      projectApiToken: accountApiKey,
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
