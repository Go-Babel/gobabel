import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel/src/usecases/arb_related/get_l10n_project_config.dart';
import 'package:gobabel/src/usecases/arb_related/map_project_arb_data.dart';
import 'package:gobabel/src/usecases/arb_related/resolve_l10n_keys_ref_in_codebase.dart';
import 'package:gobabel/src/usecases/babel_dependencies_setup/add_babel_initialization_to_main_usecase.dart';
import 'package:gobabel/src/usecases/babel_dependencies_setup/ensure_shared_prefs_if_flutter_project.dart';
import 'package:gobabel/src/usecases/babel_dependencies_setup/write_babel_text_file_into_directory.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/dart_fix_format_usecase.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/ensure_no_static_error_on_dart_files.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/extract_project_code_base.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/normalize_codebase.dart';
import 'package:gobabel/src/usecases/create_api_client_entity.dart';
import 'package:gobabel/src/usecases/final_resolver_function/create_project.dart';
import 'package:gobabel/src/usecases/final_resolver_function/sync_project.dart';
import 'package:gobabel/src/usecases/git_and_yaml/ensure_git_directory_is_configured.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_code_base_yaml_info.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_git_user.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_last_local_commit_in_current_branch.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_project_git_dependencies.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_project_origin_url.dart';
import 'package:gobabel/src/usecases/hardcoded_string/resolve_hardcoded_strings_in_codebase.dart';
import 'package:gobabel/src/usecases/remote_project_related/download_reference_arb.dart';
import 'package:gobabel/src/usecases/remote_project_related/get_app_languages.dart';
import 'package:gobabel/src/usecases/remote_project_related/get_project_cache_map.dart';
import 'package:gobabel/src/usecases/set_target_files_usecase/get_files_verification_state.dart';
import 'package:gobabel/src/usecases/translation_data_payload_info/resolve_project_arb_files_payload.dart';
import 'package:gobabel/src/usecases/translation_data_payload_info/resolve_project_cache_translation_payload.dart';
import 'package:gobabel/src/usecases/translation_data_payload_info/resolve_project_hardcoded_strings.dart';
import 'package:gobabel_core/gobabel_core.dart';
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
    required String projectApiToken,
    required String directoryPath,
    required BabelSupportedLocales inputedByUserLocale,
  }) async {
    return generate_initFlowState(
          willLog: true,
          projectApiToken: projectApiToken,
          directoryPath: directoryPath,
          inputedByUserLocale: inputedByUserLocale,
        )
        .flatMap(generate_createClientEntity)
        .flatMap(generate_ensureGitDirectoryIsConfigured)
        .flatMap(generate_getCodeBaseYamlInfo)
        .flatMap(generate_getGitUser)
        .flatMap(generate_getLastLocalCommitInCurrentBranch)
        .flatMap(generate_getProjectOriginUrl)
        .flatMap(generate_getProjectGitDependencies)
        .flatMap(generate_getAppLanguages)
        .flatMap(generate_downloadReferenceArb)
        .flatMap(generate_getProjectCacheMap)
        .flatMap(generate_resolveProjectCacheTranslationPayload)
        .flatMap(generate_ensureNoStaticErrorOnDartFilesDefault)
        .flatMap(generate_getFilesVerificationState)
        .flatMap(generate_getProjectYamlConfigUsecase)
        .flatMap(generate_mapProjectArbDataUsecase)
        .flatMap(generate_resolveProjectArbFilesPayload)
        .flatMap(
          generate_replaceAllL10nKeyReferencesInCodebaseForBabelFunctions,
        )
        .flatMap(generate_normalizeCodeBase)
        .flatMap(generate_resolveCodebaseHardcodedStringsProject)
        .flatMap(generate_resolveHardcodedStringsInCodebase)
        .flatMap(generate_multiDartFixFormatUsecase)
        .flatMap(generate_writeBabelTextFileIntoDirectory)
        .flatMap(generate_addBabelInitializationToMainUsecase)
        .flatMap(generate_ensureSharedPrefsIsInFlutterProject)
        .flatMap(generate_extractProjectCodeBase);
    // .flatMap(generate_addBabelInitializationToMainUsecase);
  }
}
