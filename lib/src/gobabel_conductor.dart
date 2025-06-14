import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/extract_project_code_base.dart';
import 'package:gobabel/src/usecases/create_api_client_entity.dart';
import 'package:gobabel/src/usecases/final_resolver_function/create_project.dart';
import 'package:gobabel/src/usecases/git_and_yaml/ensure_git_directory_is_configured.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_code_base_yaml_info.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_git_user.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_last_local_commit_in_current_branch.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_project_git_dependencies.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_project_origin_url.dart';
import 'package:result_dart/result_dart.dart';

class GobabelConductor {
  AsyncResult<void> create({
    required String accountApiKey,
    required String directoryPath,
  }) async {
    return createFlowState(
          accountApiKey: accountApiKey,
          directoryPath: directoryPath,
        )
        .flatMap(create_createClientEntity)
        .flatMap(create_ensureGitDirectoryIsConfigured)
        .flatMap(create_getCodeBaseYamlInfo)
        .flatMap(create_getGitUser)
        .flatMap(create_getLastLocalCommitInCurrentBranch)
        .flatMap(create_getProjectOriginUrl)
        .flatMap(create_getProjectGitDependencies)
        .flatMap(create_extractProjectCodeBase)
        .flatMap(create_createProject);
  }

  AsyncResult<void> sync({
    required String accountApiKey,
    required String directoryPath,
  }) async {
    return syncFlowState(
          accountApiKey: accountApiKey,
          directoryPath: directoryPath,
        )
        .flatMap(sync_createClientEntity)
        .flatMap(sync_ensureGitDirectoryIsConfigured)
        .flatMap(sync_getCodeBaseYamlInfo)
        .flatMap(sync_getGitUser)
        .flatMap(sync_getLastLocalCommitInCurrentBranch)
        .flatMap(sync_getProjectOriginUrl)
        .flatMap(sync_getProjectGitDependencies)
        .flatMap(sync_extractProjectCodeBase)
        .flatMap(sync_createProject);
  }
}
