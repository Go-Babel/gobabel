import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<ProjectCacheMap> getProjectCacheMap({
  required String projectApiToken,
  required GitVariables gitVariables,
  required Client client,
}) async {
  try {
    final ProjectCacheMap cache = await client.publicHardcodedStringKeyCache
        .getByProjectId(
          projectApiToken: projectApiToken,
          projectShaIdentifier: gitVariables.projectShaIdentifier,
        );
    return cache.toSuccess();
  } catch (_) {
    return BabelException(
      title: 'Failed to retrieve project cache',
      description: 'Unable to fetch the project cache map from the server. '
          'This could be due to network issues, invalid API key, '
          'or the project not being properly initialized. '
          'Please verify your credentials and connection.',
    ).toFailure();
  }
}

AsyncResult<GenerateFlowProjectCacheMap> generate_getProjectCacheMap(
  GenerateFlowDownloadReferenceArb payload,
) async {
  final projectApiToken = payload.projectApiToken;
  final gitVariables = payload.gitVariables;
  final client = payload.client.server;

  final cacheResult = await getProjectCacheMap(
    projectApiToken: projectApiToken,
    gitVariables: gitVariables,
    client: client,
  );

  return cacheResult.flatMap((cache) {
    return GenerateFlowProjectCacheMap(
      willLog: payload.willLog,
      referenceArbMap: payload.referenceArbMap,
      projectApiToken: projectApiToken,
      directoryPath: payload.directoryPath,
      inputedByUserLocale: payload.inputedByUserLocale,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitVariables: gitVariables,
      maxLanguageCount: payload.maxLanguageCount,
      languages: payload.languages,
      downloadLink: payload.downloadLink,
      projectCacheMap: cache,
    ).toSuccess();
  });
}
