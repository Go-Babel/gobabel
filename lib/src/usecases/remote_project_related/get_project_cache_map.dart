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
    return Exception('Error getting project cache map').toFailure();
  }
}

AsyncResult<GenerateFlowProjectCacheMap> generate_getProjectCacheMap(
  GenerateFlowDownloadReferenceArb payload,
) async {
  final projectApiToken = payload.accountApiKey;
  final gitVariables = payload.gitVariables;
  final client = payload.client.server;

  final cacheResult = await getProjectCacheMap(
    projectApiToken: projectApiToken,
    gitVariables: gitVariables,
    client: client,
  );

  return cacheResult.flatMap((cache) {
    return GenerateFlowProjectCacheMap(
      referenceArbMap: payload.referenceArbMap,
      accountApiKey: projectApiToken,
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
