import 'package:dio/dio.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel_core/gobabel_core.dart';
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
            ((response.data as Map)['record'] as Map).cast<L10nKey, L10nValue>();

        return arbMap.toSuccess();
      } catch (e, stackTrace) {
        return Exception(
          '❌ Failed to parse ARB response data: $e\nStackTrace: $stackTrace',
        ).toFailure();
      }
    } else {
      return Exception(
        '❌ Invalid response format: Expected a JSON object, got ${response.data.runtimeType}',
      ).toFailure();
    }
  } on DioException catch (e, stackTrace) {
    final errorMessage = e.response?.statusCode != null
        ? 'HTTP ${e.response!.statusCode}: ${e.response!.statusMessage ?? e.message}'
        : e.message ?? 'Network error';
    return Exception(
      '⚠️ Error downloading reference ARB from $downloadUrl: $errorMessage\nStackTrace: $stackTrace',
    ).toFailure();
  } catch (e, stackTrace) {
    return Exception(
      '⚠️ Unexpected error downloading reference ARB: $e\nStackTrace: $stackTrace',
    ).toFailure();
  }
}

AsyncResult<GenerateFlowDownloadReferenceArb> generate_downloadReferenceArb(
  GenerateFlowGotAppLanguages payload,
) async {
  final downloadLink = payload.downloadLink;
  if (downloadLink.isEmpty) {
    return Exception(
      '❌ No download link provided for the reference ARB file.',
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
