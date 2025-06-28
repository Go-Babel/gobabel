import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Unit> syncProject({
  required String accountApiKey,
  required Client client,
  required CodeBaseYamlInfo yamlInfo,
  required Set<ContextPath> codeBase,
  required GitVariables gitVariables,
}) async {
  try {
    await client.publicSync(
      name: yamlInfo.projectName,
      description: yamlInfo.projectDescription ?? '',
      projectCodeBaseFolders: codeBase,
      originUrl: gitVariables.originUrl,
      projectShaIdentifier: gitVariables.projectShaIdentifier,
      projectApiToken:
          accountApiKey, // Assuming accountApiKey is the projectApiToken for sync
    );
    return Success(unit);
  } catch (e) {
    return BabelException(
      title: 'Project Sync Failed',
      description:
          'Failed to synchronize your project with the GoBabel server. This could be due to network issues, invalid API credentials, or server unavailability. Please check your internet connection and API key, then try again. Error details: ${e.toString()}',
    ).toFailure();
  }
}

AsyncResult<SyncFlowCreatedProjectInGobabelServer> sync_createProject(
  SyncFlowExtractedProjectCodebase payload,
) async {
  final yamlInfo = payload.yamlInfo;
  final codeBase = payload.contextPaths;
  final gitVariables = payload.gitVariables;

  final syncProjectResult = await syncProject(
    accountApiKey: payload.accountApiKey,
    client: payload.client.server,
    yamlInfo: yamlInfo,
    codeBase: codeBase,
    gitVariables: gitVariables,
  );

  return syncProjectResult.flatMap((_) {
    return SyncFlowCreatedProjectInGobabelServer(
      willLog: payload.willLog,
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: payload.client,
      gitVariables: gitVariables,
      yamlInfo: yamlInfo,
      contextPaths: codeBase,
    ).toSuccess();
  });
}
