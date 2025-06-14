import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/extract_project_code_base.dart';
import 'package:gobabel/src/usecases/create_api_client_entity.dart';
import 'package:gobabel/src/usecases/final_resolver_function/create_project.dart';
import 'package:gobabel/src/usecases/final_resolver_function/sync_project.dart';
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
    return create_initFlowState(
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
    return sync_initFlowState(
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

  AsyncResult<void> generate({
    required String accountApiKey,
    required String directoryPath,
  }) async {
    return generate_initFlowState(
          accountApiKey: accountApiKey,
          directoryPath: directoryPath,
        )
        .flatMap(generate_createClientEntity)
        .flatMap(generate_ensureGitDirectoryIsConfigured)
        .flatMap(generate_getCodeBaseYamlInfo)
        .flatMap(generate_getGitUser)
        .flatMap(generate_getLastLocalCommitInCurrentBranch)
        .flatMap(generate_getProjectOriginUrl)
        .flatMap(generate_getProjectGitDependencies);
    // .flatMap(generate_extractProjectCodeBase) // Not applicable for generate flow
    // .flatMap(generate_createProject); // Not applicable for generate flow
  }
}
