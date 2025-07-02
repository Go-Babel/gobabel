import 'package:dio/dio.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<Map<L10nKey, L10nValue>> downloadReferenceArb({
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
      } catch (error, stackTrace) {
        return BabelFailureResponse.withErrorAndStackTrace(
          exception: BabelException(
            title: 'Failed to parse ARB response',
            description:
                'Unable to parse the downloaded ARB file data. '
                'The response format may be invalid or corrupted. '
                'Please check your API key and try again.',
          ),
          error: error,
          stackTrace: stackTrace,
        ).toFailure();
      }
    } else {
      return BabelFailureResponse.onlyBabelException(
        exception: BabelException(
          title: 'Invalid ARB response format',
          description:
              'Expected a JSON object in the response, but received ${response.data.runtimeType}. '
              'This might indicate an API change or network issue. '
              'Please verify your API key and connection.',
        ),
      ).toFailure();
    }
  } on DioException catch (error, stackTrace) {
    final errorMessage =
        error.response?.statusCode != null
            ? 'HTTP ${error.response!.statusCode}: ${error.response!.statusMessage ?? error.message}'
            : error.message ?? 'Network error';
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Failed to download reference ARB',
        description:
            'Unable to download the ARB file from the server. '
            '$errorMessage. '
            'Please check your internet connection and API key permissions. '
            'URL: $downloadUrl',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Unexpected download error',
        description:
            'An unexpected error occurred while downloading the reference ARB file. '
            'This might be due to network issues or server problems. '
            'Please try again or contact support if the issue persists.',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }
}

AsyncBabelResult<GenerateFlowDownloadReferenceArb>
generate_downloadReferenceArb(GenerateFlowGotAppLanguages payload) async {
  final downloadLink = payload.downloadLink;
  if (downloadLink.isEmpty) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Missing download link',
        description:
            'No download link was provided for the reference ARB file. '
            'This might indicate that the project is not properly configured '
            'or the language data is missing. Please check your project settings.',
      ),
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
