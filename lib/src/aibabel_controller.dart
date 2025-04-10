import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/scripts/arb_migration_related/find_arb_data.dart';
import 'package:gobabel/src/scripts/extract_strings_related/get_harcoded_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/map_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/update_dart_file_content_strings.dart';
import 'package:gobabel/src/scripts/get_codebase_yaml_info.dart';
import 'package:gobabel/src/scripts/edit_each_file_content.dart';
import 'package:gobabel/src/scripts/git_related/ensure_git_directory_is_configured.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';
import 'package:gobabel/src/scripts/git_related/reset_all_changes_done.dart';
import 'package:gobabel/src/scripts/notify_aibabel_api_about_new_version.dart';
import 'package:gobabel/src/scripts/write_babel_text_file_into_directory.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

class AibabelController {
  final EnsureGitDirectoryIsConfiguredUsecase _ensureGitDirectoryIsConfigured;
  final GetCodeBaseYamlInfoUsecase _getCodeBaseYamlInfo;
  final RunForEachFileTextUsecase _runForEachFileTextUsecase;
  final UpdateDartFileContentStringsUsecase
  _updateDartFileContentStringsUsecase;
  final WriteBabelTextFileIntoDirectory _writeBabelTextFileIntoDirectory;
  final NotifyAibabelApiAboutNewVersionUseCase
  _notifyAibabelApiAboutNewVersionUseCase;
  final GetProjectGitDependenciesUsecase _getProjectGitDependenciesUsecase;
  final ResetAllChangesDoneUsecase _resetAllChangesDoneUsecase;
  final FindArbDataUsecase _findArbDataUsecase;

  const AibabelController({
    required EnsureGitDirectoryIsConfiguredUsecase
    ensureGitDirectoryIsConfigured,
    required GetCodeBaseYamlInfoUsecase getCodeBaseYamlInfo,
    required GetHarcodedStringsUsecase getHarcodedStringsUsecase,
    required RunForEachFileTextUsecase runForEachFileTextUsecase,
    required MapStringsUsecase mapStringsUsecase,
    required UpdateDartFileContentStringsUsecase
    updateDartFileContentStringsUsecase,
    required WriteBabelTextFileIntoDirectory writeBabelTextFileIntoDirectory,
    required NotifyAibabelApiAboutNewVersionUseCase
    notifyAibabelApiAboutNewVersionUseCase,
    required ResetAllChangesDoneUsecase resetAllChangesDoneUsecase,
    required GetProjectGitDependenciesUsecase getProjectGitDependenciesUsecase,
    required FindArbDataUsecase findArbDataUsecase,
  }) : _ensureGitDirectoryIsConfigured = ensureGitDirectoryIsConfigured,
       _getCodeBaseYamlInfo = getCodeBaseYamlInfo,
       _runForEachFileTextUsecase = runForEachFileTextUsecase,
       _updateDartFileContentStringsUsecase =
           updateDartFileContentStringsUsecase,
       _writeBabelTextFileIntoDirectory = writeBabelTextFileIntoDirectory,
       _notifyAibabelApiAboutNewVersionUseCase =
           notifyAibabelApiAboutNewVersionUseCase,
       _resetAllChangesDoneUsecase = resetAllChangesDoneUsecase,
       _getProjectGitDependenciesUsecase = getProjectGitDependenciesUsecase,
       _findArbDataUsecase = findArbDataUsecase;

  Future<void> sync({required String token}) async {
    // Ensure the current directory is a git directory
    final ensureGitDirResp = await _ensureGitDirectoryIsConfigured();
    if (ensureGitDirResp.isError()) return printRespError(ensureGitDirResp);

    final yamlInfoResp = await _getCodeBaseYamlInfo();
    if (yamlInfoResp.isError()) return printRespError(yamlInfoResp);
    final CodeBaseYamlInfo yamlInfo = yamlInfoResp.getOrThrow();

    final GitVariables gitVariables = await _getProjectGitDependenciesUsecase();

    await Dependencies.client.syncProject(
      name: yamlInfo.projectName,
      description: yamlInfo.projectDescription ?? '',
      codeBasePathJson: '',
      shaIdentifier: gitVariables.projectShaIdentifier,
      token: token,
    );
  }

  Future<void> createNewVersion({
    required String token,
    required LabelLocale labelLocale,
  }) async {
    try {
      // Ensure the current directory is a git directory
      final ensureGitDirResp = await _ensureGitDirectoryIsConfigured();
      if (ensureGitDirResp.isError()) return printRespError(ensureGitDirResp);

      final yamlInfoResp = await _getCodeBaseYamlInfo();
      if (yamlInfoResp.isError()) return printRespError(yamlInfoResp);
      final CodeBaseYamlInfo yamlInfo = yamlInfoResp.getOrThrow();
      Dependencies.codeBaseYamlInfo = yamlInfo;
      Dependencies.alreadyExistingLabels = {};
      Dependencies.newLabels = {};

      final GitVariables gitVariables =
          await _getProjectGitDependenciesUsecase();

      final ArbData? arb = await _findArbDataUsecase();

      await _runForEachFileTextUsecase(
        onDartFileFinded: (
          ContextPath filePath,
          String fileContentAsString,
        ) async {
          final res = _updateDartFileContentStringsUsecase(
            filePath: filePath,
            fileAsString: fileContentAsString,
          );
          return res;
        },
      );

      await _writeBabelTextFileIntoDirectory(
        projectShaIdentifier: gitVariables.projectShaIdentifier,
        version: yamlInfo.version,
      );
      await _notifyAibabelApiAboutNewVersionUseCase(
        labelLocale: labelLocale,
        token: token,
        gitVariables: gitVariables,
      );
    } catch (e) {
      printError(
        'Error creating new version, '
        'all changes will be reverted.\n',
        e,
      );
      await _resetAllChangesDoneUsecase();
    }
  }
}

void printRespError(ResultDart result) {
  print('\x1B[31m${result.exceptionOrNull()}\x1B[0m');
}

void printError(String text, [Object error = '']) {
  print('${text.split('\n').map((t) => '\x1B[31m$t\x1B[0m').join('\n')}$error');
}

void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}
