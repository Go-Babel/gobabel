import 'dart:async';
import 'dart:io';
import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/extensions/string_extensions.dart';
import 'package:gobabel/src/core/utils/spinner_loading.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/analyse_codebase_issue_integrity.dart';
import 'package:gobabel/src/scripts/arb_migration_related/find_arb_data.dart';
import 'package:gobabel/src/scripts/arb_migration_related/replace_arb_output_class_to_babel_text.dart';
import 'package:gobabel/src/scripts/extract_project_code_base.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/get_harcoded_strings.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/map_strings.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/update_dart_file_content_strings.dart';
import 'package:gobabel/src/scripts/get_codebase_yaml_info.dart';
import 'package:gobabel/src/scripts/edit_each_file_content.dart';
import 'package:gobabel/src/scripts/git_related/commit_all_changes.dart';
import 'package:gobabel/src/scripts/git_related/ensure_git_directory_is_configured.dart';
import 'package:gobabel/src/scripts/git_related/get_last_local_commit_in_current_branch.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';
import 'package:gobabel/src/scripts/git_related/reset_all_changes_done.dart';
import 'package:gobabel/src/scripts/git_related/set_target_files.dart';
import 'package:gobabel/src/scripts/translation_related/get_app_languages.dart';
import 'package:gobabel/src/scripts/translation_related/translate_new_strings_arb.dart';
import 'package:gobabel/src/scripts/write_babel_text_file_into_directory.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';

bool isInTest = true;

class GobabelController {
  final CommitAllChangesUsecase _commitAllChangesUsecase;
  final AnalyseCodebaseIssueIntegrityUsecase
  _analyseCodebaseIssueIntegrityUsecase;
  final EnsureGitDirectoryIsConfiguredUsecase _ensureGitDirectoryIsConfigured;
  final GetCodeBaseYamlInfoUsecase _getCodeBaseYamlInfo;
  final RunForEachFileTextUsecase _runForEachFileTextUsecase;
  final ReplaceHardCodedStringsForBabelTextUsecase
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
  final GetLastLocalCommitInCurrentBranchUsecase
  _getLastLocalCommitInCurrentBranch;
  final TranslateNewStringsArbUsecase _translateNewStringsArbUsecase;

  const GobabelController({
    required EnsureGitDirectoryIsConfiguredUsecase
    ensureGitDirectoryIsConfigured,
    required GetCodeBaseYamlInfoUsecase getCodeBaseYamlInfo,
    required GetHarcodedStringsUsecase getHarcodedStringsUsecase,
    required RunForEachFileTextUsecase runForEachFileTextUsecase,
    required MapStringsUsecase mapStringsUsecase,
    required ReplaceArbOutputClassToBabelTextUsecase
    replaceArbOutputClassToBabelTextUsecase,
    required ReplaceHardCodedStringsForBabelTextUsecase
    updateDartFileContentStringsUsecase,
    required FindArbDataUsecase findArbDataUsecase,
    required WriteBabelTextFileIntoDirectory writeBabelTextFileIntoDirectory,
    required ResetAllChangesDoneUsecase resetAllChangesDoneUsecase,
    required GetProjectGitDependenciesUsecase getProjectGitDependenciesUsecase,
    required ExtractProjectCodeBaseUsecase extractProjectCodeBaseUsecase,
    required GetAppLanguagesUsecase getAppLanguagesUsecase,
    required SetTargetFilesUsecase setTargetFilesUsecase,
    required AnalyseCodebaseIssueIntegrityUsecase
    analyseCodebaseIssueIntegrityUsecase,
    required CommitAllChangesUsecase commitAllChangesUsecase,
    required GetLastLocalCommitInCurrentBranchUsecase
    getLastLocalCommitInCurrentBranch,
    required TranslateNewStringsArbUsecase translateNewStringsArbUsecase,
  }) : _ensureGitDirectoryIsConfigured = ensureGitDirectoryIsConfigured,
       _getCodeBaseYamlInfo = getCodeBaseYamlInfo,
       _runForEachFileTextUsecase = runForEachFileTextUsecase,
       _updateDartFileContentStringsUsecase =
           updateDartFileContentStringsUsecase,
       _writeBabelTextFileIntoDirectory = writeBabelTextFileIntoDirectory,
       _resetAllChangesDoneUsecase = resetAllChangesDoneUsecase,
       _getProjectGitDependenciesUsecase = getProjectGitDependenciesUsecase,
       _findArbDataUsecase = findArbDataUsecase,
       _replaceArbOutputClassToBabelTextUsecase =
           replaceArbOutputClassToBabelTextUsecase,
       _extractProjectCodeBaseUsecase = extractProjectCodeBaseUsecase,
       _getAppLanguagesUsecase = getAppLanguagesUsecase,
       _setTargetFilesUsecase = setTargetFilesUsecase,
       _analyseCodebaseIssueIntegrityUsecase =
           analyseCodebaseIssueIntegrityUsecase,
       _commitAllChangesUsecase = commitAllChangesUsecase,
       _getLastLocalCommitInCurrentBranch = getLastLocalCommitInCurrentBranch,
       _translateNewStringsArbUsecase = translateNewStringsArbUsecase;

  Future<void> create({
    required String accountApiKey,
    required Directory directory,
  }) async {
    Dependencies.resetAll();
    Dependencies.setTargetDirectory(directory);

    await runWithSpinner(
      successMessage: 'Project dependencies initialized',
      message: 'Initializing project dependencies...',
      () async {
        await Future<void>.delayed(Duration(milliseconds: 200));
        // Ensure the current directory is a git directory
        await _ensureGitDirectoryIsConfigured();
        await _getCodeBaseYamlInfo();
        await _getProjectGitDependenciesUsecase();
      },
    );

    final Set<String> codeBase = await runWithSpinner(
      () async {
        await Future.delayed(Duration(milliseconds: 1200));
        return await _extractProjectCodeBaseUsecase();
      },
      successMessage: 'Codebase file structure mapped',
      message: 'Mapping codebase file structure...',
      interval: Duration(milliseconds: 100),
    );

    final GitVariables gitVariables = Dependencies.gitVariables;
    final CodeBaseYamlInfo yamlInfo = Dependencies.codeBaseYamlInfo;

    await runWithSpinner(
      successMessage: 'Project ${yamlInfo.projectName} created!$endText',
      message: 'Creating project ${yamlInfo.projectName}...',
      () async {
        await Future.delayed(Duration(milliseconds: 1200));
        await Dependencies.client.publicCreateProject(
          name: yamlInfo.projectName,
          description: yamlInfo.projectDescription ?? '',
          projectCodeBaseFolders: codeBase,
          originUrl: Dependencies.gitVariables.originUrl,
          projectShaIdentifier: gitVariables.projectShaIdentifier,
          accountApiKey: accountApiKey,
        );
      },
    );
  }

  Future<void> sync({
    required String projectApiToken,
    required Directory directory,
  }) async {
    Dependencies.resetAll();
    Dependencies.setTargetDirectory(directory);

    await runWithSpinner(
      successMessage: 'Project dependencies initialized',
      message: 'Initializing project dependencies...',
      () async {
        await Future<void>.delayed(Duration(milliseconds: 200));
        // Ensure the current directory is a git directory
        await _ensureGitDirectoryIsConfigured();
        await _getCodeBaseYamlInfo();
        await _getProjectGitDependenciesUsecase();
      },
    );

    final Set<String> codeBase = await runWithSpinner(
      successMessage: 'Codebase file structure mapped',
      message: 'Mapping codebase file structure...',
      () async {
        await Future.delayed(Duration(milliseconds: 1200));
        return await _extractProjectCodeBaseUsecase();
      },
      interval: Duration(milliseconds: 100),
    );

    final GitVariables gitVariables = Dependencies.gitVariables;
    final CodeBaseYamlInfo yamlInfo = Dependencies.codeBaseYamlInfo;

    await runWithSpinner(
      successMessage: 'Project ${yamlInfo.projectName} synced!$endText',
      message: 'Syncing project ${yamlInfo.projectName}...',
      () async {
        await Future.delayed(Duration(milliseconds: 1200));
        await Dependencies.client.publicSync(
          name: yamlInfo.projectName,
          description: yamlInfo.projectDescription ?? '',
          projectCodeBaseFolders: codeBase,
          originUrl: Dependencies.gitVariables.originUrl,
          projectShaIdentifier: gitVariables.projectShaIdentifier,
          projectApiToken: projectApiToken,
        );
      },
    );
  }

  Future<void> generateNewVersion({
    required String projectApiToken,
    required BabelSupportedLocales targetLanguage,
    required Directory directory,
  }) async {
    try {
      Dependencies.referenceLanguage = targetLanguage;

      Dependencies.resetAll();
      Dependencies.setTargetDirectory(directory);

      await runWithSpinner(
        successMessage: 'Project dependencies initialized',
        message: 'Initializing project dependencies...',
        () async {
          await _ensureGitDirectoryIsConfigured();
          await _getCodeBaseYamlInfo();
          await _getProjectGitDependenciesUsecase();
          await _getAppLanguagesUsecase(token: projectApiToken);
        },
      );

      throw Exception('test');

      await runWithSpinner(
        message:
            'Garanteeing integrity of codebase (static analysis issues)...',
        successMessage:
            'Codebase integrity guaranteed. No static analysis issues found',
        () async {
          await _analyseCodebaseIssueIntegrityUsecase();
        },
      );

      await runWithSpinner(
        successMessage: 'Mapping target files',
        message: 'Mapping target files...',
        () async {
          await _setTargetFilesUsecase(projectApiToken: projectApiToken);
        },
      );

      await runWithSpinner(
        successMessage: 'Data migration analysis completed',
        message: 'Checking for potential pending data migration...',
        () async {
          await _findArbDataUsecase();
        },
      );

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

      final Set<String> codeBase = await _extractProjectCodeBaseUsecase();
      final GitVariables gitVariables = Dependencies.gitVariables;

      await _translateNewStringsArbUsecase(projectApiToken: projectApiToken);

      final GenerateHistory generatedVersion = await runWithSpinner(
        successMessage: 'Version uploaded successfully!',
        message: 'Uploading new version to Gobabel server...',
        () async {
          return await Dependencies.client.publicGenerate(
            gitCommit: Dependencies.gitVariables.previousCommit,
            gitUser: Dependencies.gitVariables.user,
            projectApiToken: projectApiToken,
            projectCodeBaseFolders: codeBase,
            originUrl: Dependencies.gitVariables.originUrl,
            madeTranslations: Dependencies.madeTranslations,
            projectShaIdentifier: gitVariables.projectShaIdentifier,
            currentCommitSha: gitVariables.latestShaIdentifier,
            pathsOfKeys: ArbKeysAppearancesPath(
              pathAppearancesPerKey: Dependencies.pathAppearancesPerKey,
            ),
          );
        },
      );

      await runWithSpinner(
        successMessage: 'Changes commited',
        message: 'Committing changes...',
        () async {
          await _commitAllChangesUsecase();
        },
      );

      await runWithSpinner(
        message: 'Mapping bot commit message to gobabel system...',
        successMessage: 'Bot commit message mapped',
        () async {
          final currentCommit = await _getLastLocalCommitInCurrentBranch();
          await Dependencies.client.publicHistory.setCommit(
            projectShaIdentifier: gitVariables.projectShaIdentifier,
            commit: currentCommit,
            generateHistoryId: generatedVersion.id!,
          );
        },
      );

      stdout.writeln('New version created successfully!\n${endText.trim()}');
    } catch (e, s) {
      stdout.writeln(
        'Error creating new version, '.red +
            'all changes in code base will be reverted.\n'.deepPink,
      );
      // TODO(igor): remove this, just for testing
      print('\n\n$e\n\n$s'.pink);
      await _resetAllChangesDoneUsecase();
    }
  }
}

final String endText =
    ' ${'Refresh'.highlightOnSuccessColor} gobabel dashboard to see changes.';
