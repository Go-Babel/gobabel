import 'package:dio/dio.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Map<L10nKey, L10nValue>> downloadReferenceArb({
  required String downloadUrl,
  required Dio dio,
}) async {
  try {
    final response = await dio.get(
      downloadUrl,
      options: Options(responseType: ResponseType.json),
    );

    if (response.data is Map<String, dynamic>) {
      try {
        final Map<L10nKey, L10nValue> arbMap =
            ((response.data as Map)['record'] as Map)
                .cast<L10nKey, L10nValue>();

        return arbMap.toSuccess();
      } catch (e) {
        return BabelException(
          title: 'Failed to parse ARB response',
          description: 'Unable to parse the downloaded ARB file data. '
              'The response format may be invalid or corrupted. '
              'Please check your API key and try again. '
              'Error: $e',
        ).toFailure();
      }
    } else {
      return BabelException(
        title: 'Invalid ARB response format',
        description: 'Expected a JSON object in the response, but received ${response.data.runtimeType}. '
            'This might indicate an API change or network issue. '
            'Please verify your API key and connection.',
      ).toFailure();
    }
  } on DioException catch (e) {
    final errorMessage =
        e.response?.statusCode != null
            ? 'HTTP ${e.response!.statusCode}: ${e.response!.statusMessage ?? e.message}'
            : e.message ?? 'Network error';
    return BabelException(
      title: 'Failed to download reference ARB',
      description: 'Unable to download the ARB file from the server. '
          '$errorMessage. '
          'Please check your internet connection and API key permissions. '
          'URL: $downloadUrl',
    ).toFailure();
  } catch (e) {
    return BabelException(
      title: 'Unexpected download error',
      description: 'An unexpected error occurred while downloading the reference ARB file. '
          'This might be due to network issues or server problems. '
          'Please try again or contact support if the issue persists. '
          'Error: $e',
    ).toFailure();
  }
}

AsyncResult<GenerateFlowDownloadReferenceArb> generate_downloadReferenceArb(
  GenerateFlowGotAppLanguages payload,
) async {
  final downloadLink = payload.downloadLink;
  if (downloadLink.isEmpty) {
    return BabelException(
      title: 'Missing download link',
      description: 'No download link was provided for the reference ARB file. '
          'This might indicate that the project is not properly configured '
          'or the language data is missing. Please check your project settings.',
    ).toFailure();
  }

  final dio = Dio();

  final arbResult = await downloadReferenceArb(
    downloadUrl: downloadLink,
    dio: dio,
  );

  return arbResult.flatMap((arbMap) {
    return GenerateFlowDownloadReferenceArb(
      willLog: payload.willLog,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      inputedByUserLocale: payload.inputedByUserLocale,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitVariables: payload.gitVariables,
      maxLanguageCount: payload.maxLanguageCount,
      languages: payload.languages,
      downloadLink: downloadLink,
      referenceArbMap: arbMap,
    ).toSuccess();
  });
}
