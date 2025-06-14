import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Unit> createProject({
  required String accountApiKey,
  required Client client,
  required CodeBaseYamlInfo yamlInfo,
  required Set<ContextPath> codeBase,
  required GitVariables gitVariables,
}) async {
  await client.publicCreateProject(
    name: yamlInfo.projectName,
    description: yamlInfo.projectDescription ?? '',
    projectCodeBaseFolders: codeBase,
    originUrl: gitVariables.originUrl,
    projectShaIdentifier: gitVariables.projectShaIdentifier,
    accountApiKey: accountApiKey,
  );
  return Success(unit);
}

AsyncResult<CreateFlowCreatedProjectInGobabelServer> create_createProject(
  CreateFlowExtractedProjectCodebase payload,
) async {
  final yamlInfo = payload.yamlInfo;
  final codeBase = payload.contextPaths;
  final gitVariables = payload.gitVariables;

  final createProjectResult = await createProject(
    accountApiKey: payload.accountApiKey,
    client: payload.client.server,
    yamlInfo: yamlInfo,
    codeBase: codeBase,
    gitVariables: gitVariables,
  );

  return createProjectResult.flatMap((_) {
    return CreateFlowCreatedProjectInGobabelServer(
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: payload.client,
      gitVariables: gitVariables,
      yamlInfo: yamlInfo,
      contextPaths: codeBase,
    ).toSuccess();
  });
}

// Note: GenerateFlowState does not have an equivalent for ExtractedProjectCodebase or CreatedProjectInGobabelServer
// Therefore, these functions will not be created for the generate flow.
