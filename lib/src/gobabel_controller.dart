import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/extensions/string_extensions.dart';
import 'package:gobabel/src/models/files_verification.dart';
import 'package:gobabel/src/scripts/analyse_already_used_babel_labels/resolve_already_existing_key.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/move_hardcoded_string_in_funtion_param.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/move_hardcoded_string_param_case.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/remove_const_keyword_usecase.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/resolve_all_hardcoded_strings_usecase.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/resolve_enum_hardcoded_strings.dart';
import 'package:gobabel/src/scripts/arb_migration_related/find_arb_data.dart';
import 'package:gobabel/src/scripts/arb_migration_related/resolve_all_arb_keys.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/analyse_codebase_issue_integrity.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/extract_project_code_base.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/get_codebase_yaml_info.dart';
import 'package:gobabel/src/scripts/git_related/commit_all_changes.dart';
import 'package:gobabel/src/scripts/git_related/ensure_git_directory_is_configured.dart';
import 'package:gobabel/src/scripts/git_related/get_last_local_commit_in_current_branch.dart';
import 'package:gobabel/src/scripts/git_related/get_project_git_dependencies.dart';
import 'package:gobabel/src/scripts/git_related/reset_all_changes_done.dart';
import 'package:gobabel/src/scripts/git_related/set_target_files.dart';
import 'package:gobabel/src/scripts/other/dart_fix_format_usecase.dart';
import 'package:gobabel/src/scripts/translation_related/get_app_languages.dart';
import 'package:gobabel/src/scripts/translation_related/get_hardcoded_string_key_cache.dart';
import 'package:gobabel/src/scripts/translation_related/translate_new_strings_arb.dart';
import 'package:gobabel/src/scripts/other/write_babel_text_file_into_directory.dart';
import 'package:gobabel/src/scripts/other/add_babel_initialization_to_main_usecase.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:path/path.dart' as p;
import 'package:gobabel/src/scripts/analyse_codebase_related/remove_multiline_string_concatenation.dart';

bool isInTest = true;

class GobabelController {
  final ResolveEnumHardcodedStringsUsecase _resolveEnumHardcodedStringsUsecase;
  final RemoveConstKeywordUsecase _removeConstKeywordUsecase;
  final DartFixFormatUsecase _dartFixFormatUsecase;
  final FindArbDataUsecase _findArbDataUsecase;
  final ResolveAlreadyExistingKey _resolveAlreadyExistingKey;
  final CommitAllChangesUsecase _commitAllChangesUsecase;
  final AnalyseCodebaseIssueIntegrityUsecase
  _analyseCodebaseIssueIntegrityUsecase;
  final EnsureGitDirectoryIsConfiguredUsecase _ensureGitDirectoryIsConfigured;
  final GetCodeBaseYamlInfoUsecase _getCodeBaseYamlInfo;
  final WriteBabelTextFileIntoDirectory _writeBabelTextFileIntoDirectory;
  final AddBabelInitializationToMainUsecase
  _addBabelInitializationToMainUsecase;
  final MoveHardcodedStringInFuntionParamUsecase
  _moveHardcodedStringInFuntionParamUsecase;
  final GetProjectGitDependenciesUsecase _getProjectGitDependenciesUsecase;
  final ResetAllChangesDoneUsecase _resetAllChangesDoneUsecase;
  final ExtractProjectCodeBaseUsecase _extractProjectCodeBaseUsecase;
  final GetAppLanguagesUsecase _getAppLanguagesUsecase;
  final GetHardcodedStringKeyCacheUsecase _getHardcodedStringKeyCacheUsecase;
  final SetTargetFilesUsecase _setTargetFilesUsecase;
  final GetLastLocalCommitInCurrentBranchUsecase
  _getLastLocalCommitInCurrentBranch;
  final TranslateNewStringsArbUsecase _translateNewStringsArbUsecase;
  final ResolveAllHardcodedStringsUsecase _resolveAllHardcodedStringsUsecase;
  final ResolveAllArbKeysUsecase _resolveAllArbKeysUsecase;
  final MoveHardCodedStringParamUseCase _moveHardCodedStringParamUseCase;
  final RemoveAdjacentStringLiteralConcatenationUsecase
  _removeStringConcatenationUsecase;

  const GobabelController({
    required ResolveEnumHardcodedStringsUsecase
    resolveEnumHardcodedStringsUsecase,
    required FindArbDataUsecase findArbDataUsecase,
    required ResolveAlreadyExistingKey resolveAlreadyExistingKey,
    required EnsureGitDirectoryIsConfiguredUsecase
    ensureGitDirectoryIsConfigured,
    required MoveHardcodedStringInFuntionParamUsecase
    moveHardcodedStringInFuntionParamUsecase,
    required ResolveAllHardcodedStringsUsecase
    resolveAllHardcodedStringsUsecase,
    required WriteBabelTextFileIntoDirectory writeBabelTextFileIntoDirectory,
    required AddBabelInitializationToMainUsecase
    addBabelInitializationToMainUsecase,
    required ResetAllChangesDoneUsecase resetAllChangesDoneUsecase,
    required GetProjectGitDependenciesUsecase getProjectGitDependenciesUsecase,
    required ExtractProjectCodeBaseUsecase extractProjectCodeBaseUsecase,
    required GetAppLanguagesUsecase getAppLanguagesUsecase,
    required GetHardcodedStringKeyCacheUsecase
    getHardcodedStringKeyCacheUsecase,
    required SetTargetFilesUsecase setTargetFilesUsecase,
    required AnalyseCodebaseIssueIntegrityUsecase
    analyseCodebaseIssueIntegrityUsecase,
    required CommitAllChangesUsecase commitAllChangesUsecase,
    required GetLastLocalCommitInCurrentBranchUsecase
    getLastLocalCommitInCurrentBranch,
    required GetCodeBaseYamlInfoUsecase getCodeBaseYamlInfo,
    required TranslateNewStringsArbUsecase translateNewStringsArbUsecase,
    required ResolveAllArbKeysUsecase resolveAllArbKeysUsecase,
    required MoveHardCodedStringParamUseCase moveHardCodedStringParamUseCase,
    required RemoveConstKeywordUsecase removeConstKeywordUsecase,
    required DartFixFormatUsecase dartFixFormatUsecase,
    required RemoveAdjacentStringLiteralConcatenationUsecase
    removeStringConcatenationUsecase,
  }) : _resolveEnumHardcodedStringsUsecase = resolveEnumHardcodedStringsUsecase,
       _removeConstKeywordUsecase = removeConstKeywordUsecase,
       _dartFixFormatUsecase = dartFixFormatUsecase,
       _findArbDataUsecase = findArbDataUsecase,
       _moveHardcodedStringInFuntionParamUsecase =
           moveHardcodedStringInFuntionParamUsecase,
       _resolveAlreadyExistingKey = resolveAlreadyExistingKey,
       _ensureGitDirectoryIsConfigured = ensureGitDirectoryIsConfigured,
       _resolveAllHardcodedStringsUsecase = resolveAllHardcodedStringsUsecase,
       _getCodeBaseYamlInfo = getCodeBaseYamlInfo,
       _writeBabelTextFileIntoDirectory = writeBabelTextFileIntoDirectory,
       _addBabelInitializationToMainUsecase =
           addBabelInitializationToMainUsecase,
       _resetAllChangesDoneUsecase = resetAllChangesDoneUsecase,
       _getProjectGitDependenciesUsecase = getProjectGitDependenciesUsecase,
       _extractProjectCodeBaseUsecase = extractProjectCodeBaseUsecase,
       _getAppLanguagesUsecase = getAppLanguagesUsecase,
       _getHardcodedStringKeyCacheUsecase = getHardcodedStringKeyCacheUsecase,
       _setTargetFilesUsecase = setTargetFilesUsecase,
       _analyseCodebaseIssueIntegrityUsecase =
           analyseCodebaseIssueIntegrityUsecase,
       _commitAllChangesUsecase = commitAllChangesUsecase,
       _getLastLocalCommitInCurrentBranch = getLastLocalCommitInCurrentBranch,
       _translateNewStringsArbUsecase = translateNewStringsArbUsecase,
       _resolveAllArbKeysUsecase = resolveAllArbKeysUsecase,
       _moveHardCodedStringParamUseCase = moveHardCodedStringParamUseCase,
       _removeStringConcatenationUsecase = removeStringConcatenationUsecase;

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
    bool generateLogs = true,
  }) async {
    final GenerateHistory? generatedVersion;

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
          await _getHardcodedStringKeyCacheUsecase(
            projectApiToken: projectApiToken,
          );
        },
      );

      await runWithSpinner(
        message:
            'Garanteeing integrity of codebase (static analysis issues)...',
        successMessage:
            'Codebase integrity guaranteed. No static analysis issues found',
        () async {
          await _analyseCodebaseIssueIntegrityUsecase();
          await _setTargetFilesUsecase(projectApiToken: projectApiToken);
          Dependencies.filesVerificationState = FilesVerification.fromZero();
          await _findArbDataUsecase();
          await _removeStringConcatenationUsecase();
          await _resolveEnumHardcodedStringsUsecase();
          await _dartFixFormatUsecase();
          await _moveHardcodedStringInFuntionParamUsecase();
          await _moveHardCodedStringParamUseCase();
          await _removeConstKeywordUsecase();
        },
      );

      _resolveAlreadyExistingKey();
      await _resolveAllArbKeysUsecase();
      await _resolveAllHardcodedStringsUsecase(
        projectApiToken: projectApiToken,
        generateLogs: generateLogs,
      );

      if (Dependencies.allDeclarationFunctions.isEmpty) {
        try {
          await _resetAllChangesDoneUsecase();
        } catch (_) {}
        throw BabelException(
          title: 'No labels found to be uploaded to Gobabel server',
          description:
              'Repository seems to be already up-to-date or there are no '
              'hardcoded strings in the codebase. Please check your codebase '
              'for hardcoded strings or try to run Gobabel in another branch.',
        );
      }

      await runWithSpinner(
        successMessage: 'BabelText file written and main updated',
        message: 'Writting "BabelText" file and updating main()...',
        () async {
          await Future.delayed(Duration(milliseconds: 800));
          await _dartFixFormatUsecase();
          await _writeBabelTextFileIntoDirectory();
          await _addBabelInitializationToMainUsecase();
        },
      );

      final Set<String> codeBase = await _extractProjectCodeBaseUsecase();
      final GitVariables gitVariables = Dependencies.gitVariables;

      // See if after changes the codebase is still without any issue
      // await _analyseCodebaseIssueIntegrityUsecase();

      if (generateLogs) {
        final pathApp = Dependencies.pathAppearancesPerKey.map(
          (key, value) => MapEntry(key, value.map((e) => e).toList()),
        );
        await _saveStringData({
          "madeTranslations": Dependencies.madeTranslations,
          "pathAppearancesPerKey": pathApp,
          "referenceLanguageJson": Dependencies.referenceLanguageJson,
          "newLabelsKeys": Dependencies.newLabelsKeys,
          "allDeclarationFunctions":
              Dependencies.allDeclarationFunctions.toList(),
        }, 'data.json');
      }

      await _translateNewStringsArbUsecase(projectApiToken: projectApiToken);

      generatedVersion = await runWithSpinner(
        successMessage: 'Version uploaded successfully!',
        message: 'Uploading new version to Gobabel server...',
        () async {
          return await Dependencies.client.publicGenerate(
            gitCommit: gitVariables.previousCommit,
            gitUser: gitVariables.user,
            projectApiToken: projectApiToken,
            projectCodeBaseFolders: codeBase,
            originUrl: gitVariables.originUrl,
            // Create stream of translation chunks
            madeTranslations: _createTranslationStream(
              Dependencies.madeTranslations,
            ),
            projectShaIdentifier: gitVariables.projectShaIdentifier,
            currentCommitSha: gitVariables.latestShaIdentifier,
            pathsOfKeys: ArbKeysAppearancesPath(
              pathAppearancesPerKey: Dependencies.pathAppearancesPerKey,
            ),
            hardcodedStringMap: Dependencies.newAddedHardcodedStringKeyCache,
          );
        },
      );
    } catch (e) {
      stdout.writeln(
        'Error creating new version, '.red +
            'all changes in code base will be reverted.\n'.deepPink,
      );
      await _resetAllChangesDoneUsecase();
      rethrow;
    }

    try {
      if (generatedVersion != null) {
        await runWithSpinner(
          successMessage: 'Changes commited and synced with Gobabel server',
          message: 'Committing changes...',
          () async {
            await _commitAllChangesUsecase();
            final currentCommit = await _getLastLocalCommitInCurrentBranch();
            await Dependencies.client.publicHistory.setCommit(
              projectShaIdentifier:
                  Dependencies.gitVariables.projectShaIdentifier,
              commit: currentCommit,
              generateHistoryId: generatedVersion!.id!,
            );
          },
        );

        stdout.writeln(
          'New version created successfully!\n${endText.trim()}'.green,
        );
      }
    } catch (e) {
      stdout.writeln(
        'Error creating new version, '.red +
            'all changes in code base will be reverted.\n'.deepPink,
      );
      rethrow;
    }
  }

  /// Creates a stream of translation chunks that are within API limits
  Stream<
    Map<LanguageCode, Map<CountryCode, Map<TranslationKey, TranslationContent>>>
  >
  _createTranslationStream(
    Map<LanguageCode, Map<CountryCode, Map<TranslationKey, TranslationContent>>>
    madeTranslations,
  ) async* {
    for (final entry1 in madeTranslations.entries) {
      final LanguageCode languageCode = entry1.key;
      final Map<CountryCode, Map<TranslationKey, TranslationContent>>
      countryMap = entry1.value;

      for (final entry2 in countryMap.entries) {
        final CountryCode countryCode = entry2.key;
        final Map<TranslationKey, TranslationContent> translations =
            entry2.value;

        // Split translations into manageable chunks
        final chunks = splitIntoManageableGroupsForApi(translations);

        for (final chunk in chunks) {
          yield {
            languageCode: {countryCode: chunk},
          };

          // Wait 100ms between each chunk to avoid overwhelming the server
          await Future.delayed(Duration(milliseconds: 100));
        }
      }
    }
  }
}

final String endText =
    ' ${' Refresh '.highlightOnSuccessColor} gobabel dashboard to see changes.';

/// Saves data to a JSON file
Future<void> _saveStringData(Map<String, dynamic> data, String fileName) async {
  final outFile = File(p.join(Directory.current.path, fileName));
  await outFile.writeAsString(JsonEncoder.withIndent('  ').convert(data));
}
