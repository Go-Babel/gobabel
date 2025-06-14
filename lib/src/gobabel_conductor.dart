import 'dart:async';

import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/extract_project_code_base.dart';
import 'package:gobabel/src/usecases/create_api_client_entity.dart';
import 'package:gobabel/src/usecases/git_and_yaml/ensure_git_directory_is_configured.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_code_base_yaml_info.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_git_user.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_last_local_commit_in_current_branch.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_project_git_dependencies.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_project_origin_url.dart';
import 'package:result_dart/result_dart.dart';

class GobabelConductor {
  Future<void> create({
    required String accountApiKey,
    required String directoryPath,
  }) async {
    createFlowState(accountApiKey: accountApiKey, directoryPath: directoryPath)
        .flatMap(create_createClientEntity)
        .flatMap(create_ensureGitDirectoryIsConfigured)
        .flatMap(create_getCodeBaseYamlInfo)
        .flatMap(create_getGitUser)
        .flatMap(create_getLastLocalCommitInCurrentBranch)
        .flatMap(create_getProjectOriginUrl)
        .flatMap(create_getProjectGitDependencies)
        .flatMap(create_extractProjectCodeBase);
  }
}
