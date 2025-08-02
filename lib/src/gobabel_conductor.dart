import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/flow_interface.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel/src/usecases/arb_related/get_l10n_project_config.dart';
import 'package:gobabel/src/usecases/arb_related/map_project_arb_data.dart';
import 'package:gobabel/src/usecases/arb_related/remove_unnecessary_arb_config_files.dart';
import 'package:gobabel/src/usecases/arb_related/resolve_l10n_keys_ref_in_codebase.dart';
import 'package:gobabel/src/usecases/babel_dependencies_setup/add_babel_initialization_to_main_usecase.dart';
import 'package:gobabel/src/usecases/babel_dependencies_setup/ensure_shared_prefs_if_flutter_project.dart';
import 'package:gobabel/src/usecases/babel_dependencies_setup/extract_babel_function_declarations.dart';
import 'package:gobabel/src/usecases/babel_dependencies_setup/generate_babel_class.dart';
import 'package:gobabel/src/usecases/babel_dependencies_setup/write_babel_text_file_into_directory.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/dart_fix_format_usecase.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/ensure_no_static_error_on_dart_files.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/extract_project_code_base.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/move_hardcoded_string_in_function_param.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/move_hardcoded_string_param_case.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/remove_adjacent_string_concatenation.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/remove_const_keyword_usecase.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/remove_const_of_constructors_with_default_string_in_parameter.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/remove_const_of_lists_that_contain_hardcoded_strings.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/resolve_enum_hardcoded_string_variables.dart';
import 'package:gobabel/src/usecases/create_api_client_entity.dart';
import 'package:gobabel/src/usecases/final_resolver_function/create_project.dart';
import 'package:gobabel/src/usecases/final_resolver_function/sync_project.dart';
import 'package:gobabel/src/usecases/git_and_yaml/commit_all_changes.dart';
import 'package:gobabel/src/usecases/git_and_yaml/ensure_git_directory_is_configured.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_code_base_yaml_info.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_git_user.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_last_local_commit_in_current_branch.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_project_git_dependencies.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_project_origin_url.dart';
import 'package:gobabel/src/usecases/git_and_yaml/reset_all_changes_in_codebase_if_needed.dart';
import 'package:gobabel/src/usecases/hardcoded_string/create_human_friendly_arb_keys.dart';
import 'package:gobabel/src/usecases/hardcoded_string/define_which_string_label.dart';
import 'package:gobabel/src/usecases/hardcoded_string/extract_all_hardcoded_strings.dart';
import 'package:gobabel/src/usecases/hardcoded_string/map_babel_labels.dart';
import 'package:gobabel/src/usecases/hardcoded_string/map_strings_hierarchy.dart';
import 'package:gobabel/src/usecases/hardcoded_string/resolve_hardcoded_strings_in_codebase.dart';
import 'package:gobabel/src/usecases/key_integrity/generate_log_if_requested.dart';
import 'package:gobabel/src/usecases/remote_project_related/get_app_languages.dart';
import 'package:gobabel/src/usecases/remote_project_related/get_project_cache_map.dart';
import 'package:gobabel/src/usecases/set_target_files_usecase/get_files_verification_state.dart';
import 'package:gobabel/src/usecases/translation_data_payload_info/resolve_project_arb_files_payload.dart';
import 'package:gobabel/src/usecases/translation_data_payload_info/resolve_project_cache_translation_payload.dart';
import 'package:gobabel/src/usecases/translation_data_payload_info/resolve_project_hardcoded_strings.dart';
import 'package:gobabel/src/usecases/translation_related/translate_new_strings_arb.dart';
import 'package:gobabel/src/usecases/translation_related/upload_translation_commit_data.dart';
import 'package:gobabel/src/usecases/translation_related/upload_translation_new_version.dart';
import 'package:gobabel_core/gobabel_core.dart';

class GobabelConductor {
  AsyncBabelResult<void> create({
    required String accountApiKey,
    required String directoryPath,
    bool willLog = false,
  }) async {
    return create_initFlowState(
          accountApiKey: accountApiKey,
          directoryPath: directoryPath,
          willLog: willLog,
        )
        .toNextStep(create_createClientEntity)
        .toNextStep(create_ensureGitDirectoryIsConfigured)
        .toNextStep(create_getCodeBaseYamlInfo)
        .toNextStep(create_getGitUser)
        .toNextStep(create_getLastLocalCommitInCurrentBranch)
        .toNextStep(create_getProjectOriginUrl)
        .toNextStep(create_getProjectGitDependencies)
        .toNextStep(create_extractProjectCodeBase)
        .toNextStep(create_createProject)
        .log_if_needed;
  }

  AsyncBabelResult<void> sync({
    required String accountApiKey,
    required String directoryPath,
    bool willLog = false,
  }) async {
    return sync_initFlowState(
          accountApiKey: accountApiKey,
          directoryPath: directoryPath,
          willLog: willLog,
        )
        .toNextStep(sync_createClientEntity)
        .toNextStep(sync_ensureGitDirectoryIsConfigured)
        .toNextStep(sync_getCodeBaseYamlInfo)
        .toNextStep(sync_getGitUser)
        .toNextStep(sync_getLastLocalCommitInCurrentBranch)
        .toNextStep(sync_getProjectOriginUrl)
        .toNextStep(sync_getProjectGitDependencies)
        .toNextStep(sync_extractProjectCodeBase)
        .toNextStep(sync_extractBabelFunctionDeclarations)
        .toNextStep(sync_generateBabelClassUsecase)
        .toNextStep(sync_writeBabelTextFileIntoDirectory)
        .toNextStep(sync_syncProject)
        .log_if_needed
        .sync_resetIfError;
  }

  AsyncBabelResult<void> generate({
    required String projectApiToken,
    required String directoryPath,
    required BabelSupportedLocales inputedByUserLocale,
    required bool willLog,
    required bool dangerouslyAutoDetectUserFacingHardcodedStrings,
  }) async {
    return generate_initFlowState(
          willLog: willLog,
          projectApiToken: projectApiToken,
          directoryPath: directoryPath,
          inputedByUserLocale: inputedByUserLocale,
          dangerouslyAutoDetectUserFacingHardcodedStrings:
              dangerouslyAutoDetectUserFacingHardcodedStrings,
        )
        .toNextStep(generate_createClientEntity)
        .toNextStep(generate_ensureGitDirectoryIsConfigured)
        .toNextStep(generate_getCodeBaseYamlInfo)
        .toNextStep(generate_getGitUser)
        .toNextStep(generate_getLastLocalCommitInCurrentBranch)
        .toNextStep(generate_getProjectOriginUrl)
        .toNextStep(generate_getProjectGitDependencies)
        .toNextStep(generate_getAppLanguages)
        .toNextStep(generate_getProjectCacheMap)
        .toNextStep(generate_resolveProjectCacheTranslationPayload)
        .toNextStep(generate_ensureNoStaticErrorOnDartFilesDefault)
        .toNextStep(generate_getFilesVerificationState)
        .toNextStep(generate_getProjectYamlConfigUsecase)
        .toNextStep(generate_mapProjectArbDataUsecase)
        .toNextStep(generate_resolveProjectArbFilesPayload)
        .toNextStep(
          generate_multiRemoveAdjacentStringLiteralConcatenationUsecase,
        )
        .toNextStep(generate_multiResolveEnumHardcodedStringsUsecase)
        .toNextStep(generate_multiDartFixFormatUsecaseForNormalize)
        .toNextStep(generate_multiMoveHardcodedStringInFuntionParamUsecase)
        .toNextStep(generate_multiMoveHardCodedStringParamUseCase)
        .toNextStep(
          generate_multiRemoveConstOfListsSetsAndMapThatContainHardcodedStringsInside,
        )
        .toNextStep(
          generate_multiFileRemoveConstOfConstructorsWithDefaultStringInParameter,
        )
        .toNextStep(
          generate_multiRemoveConstFromAnyStructureThatHasHardcodedStringsInHierarchy,
        )
        .toNextStep(generate_extractAllStringsInDart)
        .toNextStep(generate_defineWhichStringLabelIsUserFacing)
        .toNextStep(generate_createHumanFriendlyArbKeysWithAiOnServer)
        .toNextStep(generate_mapStringsHierarchy)
        .toNextStep(generate_mapBabelLabels)
        .toNextStep(generate_resolveCodebaseHardcodedStringsProject)
        .toNextStep(generate_resolveHardcodedStringsInCodebase)
        .toNextStep(generate_generateBabelClassUsecase)
        .toNextStep(generate_writeBabelTextFileIntoDirectory)
        .toNextStep(generate_addBabelInitializationToMainUsecase)
        .toNextStep(generate_ensureSharedPrefsIsInFlutterProject)
        .toNextStep(generate_multiDartFixFormatUsecase)
        .toNextStep(
          generate_replaceAllL10nKeyReferencesInCodebaseForBabelFunctions,
        )
        .toNextStep(generate_removeUnnecessaryArbConfigFiles)
        .toNextStep(generate_extractProjectCodeBase)
        .toNextStep(generate_translateNewStringsArb)
        .toNextStep(generate_uploadTranslationNewVersion)
        .toNextStep(generate_commitAllChangesUsecase)
        .toNextStep(generate_getBabelChangesCommit)
        .toNextStep(generate_uploadBabelTranslationsChangesCommitToServer)
        .log_if_needed
        .generate_resetIfError;
  }
}
