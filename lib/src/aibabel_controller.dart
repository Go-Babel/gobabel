import 'dart:io';

import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/scripts/arb_migration_related/find_arb_data.dart';
import 'package:gobabel/src/scripts/arb_migration_related/replace_arb_output_class_to_babel_text.dart';
import 'package:gobabel/src/scripts/extract_project_code_base.dart';
import 'package:gobabel/src/scripts/extract_strings_related/get_harcoded_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/map_strings.dart';
import 'package:gobabel/src/scripts/extract_strings_related/update_dart_file_content_strings.dart';
import 'package:gobabel/src/scripts/get_codebase_yaml_info.dart';
import 'package:gobabel/src/scripts/edit_each_file_content.dart';
import 'package:gobabel/src/scripts/git_related/ensure_git_directory_is_configured.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';
import 'package:gobabel/src/scripts/git_related/get_project_last_commit_sha_stamps.dart';
import 'package:gobabel/src/scripts/git_related/reset_all_changes_done.dart';
import 'package:gobabel/src/scripts/git_related/set_target_files.dart';
import 'package:gobabel/src/scripts/translation_related/get_app_languages.dart';
import 'package:gobabel/src/scripts/translation_related/upload_new_version.dart';
import 'package:gobabel/src/scripts/write_babel_text_file_into_directory.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/go_babel_core.dart';
import 'package:result_dart/result_dart.dart';

class AibabelController {
  final EnsureGitDirectoryIsConfiguredUsecase _ensureGitDirectoryIsConfigured;
  final GetCodeBaseYamlInfoUsecase _getCodeBaseYamlInfo;
  final RunForEachFileTextUsecase _runForEachFileTextUsecase;
  final UploadNewVersionUsecase _notifyAibabelApiAboutNewVersionUseCase;
  final UpdateDartFileContentStringsUsecase
  _updateDartFileContentStringsUsecase;
  final FindArbDataUsecase _findArbDataUsecase;
  final ReplaceArbOutputClassToBabelTextUsecase
  _replaceArbOutputClassToBabelTextUsecase;
  final WriteBabelTextFileIntoDirectory _writeBabelTextFileIntoDirectory;
  final GetProjectGitDependenciesUsecase _getProjectGitDependenciesUsecase;
  final ResetAllChangesDoneUsecase _resetAllChangesDoneUsecase;
  final ExtractProjectCodeBaseUsecase _extractProjectCodeBaseUsecase;
  final GetAppLanguagesUsecase _getAppLanguagesUsecase;
  final SetTargetFilesUsecase _setTargetFilesUsecase;

  const AibabelController({
    required EnsureGitDirectoryIsConfiguredUsecase
    ensureGitDirectoryIsConfigured,
    required GetCodeBaseYamlInfoUsecase getCodeBaseYamlInfo,
    required GetHarcodedStringsUsecase getHarcodedStringsUsecase,
    required RunForEachFileTextUsecase runForEachFileTextUsecase,
    required MapStringsUsecase mapStringsUsecase,
    required ReplaceArbOutputClassToBabelTextUsecase
    replaceArbOutputClassToBabelTextUsecase,
    required UpdateDartFileContentStringsUsecase
    updateDartFileContentStringsUsecase,
    required FindArbDataUsecase findArbDataUsecase,
    required WriteBabelTextFileIntoDirectory writeBabelTextFileIntoDirectory,
    required UploadNewVersionUsecase notifyAibabelApiAboutNewVersionUseCase,
    required ResetAllChangesDoneUsecase resetAllChangesDoneUsecase,
    required GetProjectGitDependenciesUsecase getProjectGitDependenciesUsecase,
    required ExtractProjectCodeBaseUsecase extractProjectCodeBaseUsecase,
    required GetAppLanguagesUsecase getAppLanguagesUsecase,
    required GetProjectLastCommitShaStampsUsecase
    getProjectLastCommitShaStampsUsecase,
    required SetTargetFilesUsecase setTargetFilesUsecase,
  }) : _ensureGitDirectoryIsConfigured = ensureGitDirectoryIsConfigured,
       _getCodeBaseYamlInfo = getCodeBaseYamlInfo,
       _runForEachFileTextUsecase = runForEachFileTextUsecase,
       _updateDartFileContentStringsUsecase =
           updateDartFileContentStringsUsecase,
       _notifyAibabelApiAboutNewVersionUseCase =
           notifyAibabelApiAboutNewVersionUseCase,
       _writeBabelTextFileIntoDirectory = writeBabelTextFileIntoDirectory,
       _resetAllChangesDoneUsecase = resetAllChangesDoneUsecase,
       _getProjectGitDependenciesUsecase = getProjectGitDependenciesUsecase,
       _findArbDataUsecase = findArbDataUsecase,
       _replaceArbOutputClassToBabelTextUsecase =
           replaceArbOutputClassToBabelTextUsecase,
       _extractProjectCodeBaseUsecase = extractProjectCodeBaseUsecase,
       _getAppLanguagesUsecase = getAppLanguagesUsecase,
       _setTargetFilesUsecase = setTargetFilesUsecase;

  Future<void> sync({required String token}) async {
    Dependencies.resetAll();
    // Ensure the current directory is a git directory
    final ensureGitDirResp = await _ensureGitDirectoryIsConfigured();
    if (ensureGitDirResp.isError()) return printRespError(ensureGitDirResp);

    final yamlInfoResp = await _getCodeBaseYamlInfo();
    if (yamlInfoResp.isError()) return printRespError(yamlInfoResp);
    final CodeBaseYamlInfo yamlInfo = Dependencies.codeBaseYamlInfo;

    await _getProjectGitDependenciesUsecase();
    final GitVariables gitVariables = Dependencies.gitVariables;
    final CodeBaseFolder codeBase = await _extractProjectCodeBaseUsecase();

    await Dependencies.client.syncProject.sincronize(
      name: yamlInfo.projectName,
      description: yamlInfo.projectDescription ?? '',
      projectCodeBase: codeBase,
      projectShaIdentifier: gitVariables.projectShaIdentifier,
      token: token,
    );
  }

  Future<void> createNewVersion({
    required String token,
    required BabelSupportedLocales labelLocale,
    Directory? directory,
  }) async {
    try {
      Dependencies.resetAll();
      await _setTargetFilesUsecase(token: token);
      await _getAppLanguagesUsecase(token: token);
      Dependencies.setTargetDirectory(directory);

      // Ensure the current directory is a git directory
      final ensureGitDirResp = await _ensureGitDirectoryIsConfigured();
      if (ensureGitDirResp.isError()) return printRespError(ensureGitDirResp);

      final yamlInfoResp = await _getCodeBaseYamlInfo();
      if (yamlInfoResp.isError()) return printRespError(yamlInfoResp);

      await _getProjectGitDependenciesUsecase();
      await _findArbDataUsecase();

      await _runForEachFileTextUsecase(
        onDartFileFinded: (
          ContextPath filePath,
          String fileContentAsString,
        ) async {
          final res = _updateDartFileContentStringsUsecase(
            filePath: filePath,
            fileAsString: fileContentAsString,
          );
          return _replaceArbOutputClassToBabelTextUsecase(
            fileContent: res,
            fileName: filePath,
          );
        },
      );

      await _writeBabelTextFileIntoDirectory();

      final CodeBaseFolder codeBase = await _extractProjectCodeBaseUsecase();

      await _notifyAibabelApiAboutNewVersionUseCase(
        token: token,
        projectCodeBase: codeBase,
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

void printRespError(ResultDart<dynamic, dynamic> result) {
  print('\x1B[31m${result.exceptionOrNull()}\x1B[0m');
}

void printError(String text, [Object error = '']) {
  print('${text.split('\n').map((t) => '\x1B[31m$t\x1B[0m').join('\n')}$error');
}

void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}
