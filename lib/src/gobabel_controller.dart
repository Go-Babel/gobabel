import 'dart:async';
import 'dart:io';
import 'package:console_bars/console_bars.dart';
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
import 'package:gobabel/src/scripts/git_related/reset_all_changes_done.dart';
import 'package:gobabel/src/scripts/git_related/set_target_files.dart';
import 'package:gobabel/src/scripts/translation_related/get_app_languages.dart';
import 'package:gobabel/src/scripts/translation_related/upload_new_version.dart';
import 'package:gobabel/src/scripts/write_babel_text_file_into_directory.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/go_babel_core.dart';

class GobabelController {
  final EnsureGitDirectoryIsConfiguredUsecase _ensureGitDirectoryIsConfigured;
  final GetCodeBaseYamlInfoUsecase _getCodeBaseYamlInfo;
  final RunForEachFileTextUsecase _runForEachFileTextUsecase;
  final UploadNewVersionUsecase _notifyGobabelApiAboutNewVersionUseCase;
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

  const GobabelController({
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

    required SetTargetFilesUsecase setTargetFilesUsecase,
  }) : _ensureGitDirectoryIsConfigured = ensureGitDirectoryIsConfigured,
       _getCodeBaseYamlInfo = getCodeBaseYamlInfo,
       _runForEachFileTextUsecase = runForEachFileTextUsecase,
       _updateDartFileContentStringsUsecase =
           updateDartFileContentStringsUsecase,
       _notifyGobabelApiAboutNewVersionUseCase =
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

    final desc = "Initializing project dependencies";
    final p = FillingBar(desc: desc, total: 4, time: true, percentage: true);
    p.increment();
    // Ensure the current directory is a git directory
    await _ensureGitDirectoryIsConfigured();
    p.increment();
    await _getCodeBaseYamlInfo();
    p.increment();
    await _getProjectGitDependenciesUsecase();
    p.increment();

    final CodeBaseFolder codeBase = await runWithSpinner(
      () async {
        return await _extractProjectCodeBaseUsecase();
      },
      message: 'Mapping codebase file structure',
      interval: Duration(milliseconds: 100),
    );

    final GitVariables gitVariables = Dependencies.gitVariables;
    final CodeBaseYamlInfo yamlInfo = Dependencies.codeBaseYamlInfo;

    await runWithSpinner(
      () async {
        await Dependencies.client.syncProject.sincronize(
          name: yamlInfo.projectName,
          description: yamlInfo.projectDescription ?? '',
          projectCodeBase: codeBase,
          projectShaIdentifier: gitVariables.projectShaIdentifier,
          token: token,
        );
      },
      message: 'Syncing project ${yamlInfo.projectName}',
      interval: Duration(milliseconds: 120),
    );
  }

  Future<void> createNewVersion({
    required String token,
    required BabelSupportedLocales labelLocale,
    Directory? directory,
  }) async {
    try {
      Dependencies.resetAll();
      final desc = "Initializing project dependencies";
      final p = FillingBar(desc: desc, total: 5, time: true, percentage: true);
      p.increment();
      // Ensure the current directory is a git directory
      await _ensureGitDirectoryIsConfigured();
      p.increment();
      await _getCodeBaseYamlInfo();
      p.increment();
      await _getProjectGitDependenciesUsecase();
      p.increment();
      await _getAppLanguagesUsecase(token: token);
      p.increment();

      await _setTargetFilesUsecase(token: token);
      Dependencies.setTargetDirectory(directory);

      await runWithSpinner(() async {
        await _findArbDataUsecase();
      }, message: 'Mapping arb data if exists');

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

      await runWithSpinner(() async {
        await _notifyGobabelApiAboutNewVersionUseCase(
          token: token,
          projectCodeBase: codeBase,
        );
      }, message: 'Uploading new version to Gobabel server');
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

void printError(String text, [Object error = '']) {
  print('${text.split('\n').map((t) => '\x1B[31m$t\x1B[0m').join('\n')}$error');
}

void printWarning(String text) {
  print('\x1B[33m$text\x1B[0m');
}

/// Runs [action], showing a spinner plus [message] in the terminal until it
/// completes. Returns whatever [action] returns (or rethrows its error).
Future<T> runWithSpinner<T>(
  Future<T> Function() action, {
  String message = 'Loading',
  Duration interval = const Duration(milliseconds: 100),
}) async {
  const spinnerChars = ['|', '/', '-', '\\'];
  int idx = 0;

  // Start a periodic timer to update the spinner
  final timer = Timer.periodic(interval, (_) {
    stdout.write('\r${spinnerChars[idx % spinnerChars.length]} $message...');
    idx++;
  });

  try {
    // Await the user-provided action
    final result = await action();
    return result;
  } catch (e) {
    // Rethrow after cleaning up spinner
    rethrow;
  } finally {
    // Stop spinner and clear line
    timer.cancel();
    stdout
      ..write('\r') // Move to line start
      ..write(' ' * (message.length + 4)) // Overwrite spinner+message
      ..write('\r'); // Move back again
  }
}

// /// Displays a spinning loading indicator while [task] is running.
// /// [message] is the custom text to display with the spinner (default: 'Loading').
// /// Returns the result of the [task].
// Future<T> showSpinner<T>({
//   required Future<T> Function() task,
//   String message = 'Loading',
// }) async {
//   const spinner = ['|', '/', '-', '\\'];
//   const spinDelay = Duration(milliseconds: 100);
//   int i = 0;
//   bool isRunning = true;

//   // Hide cursor for cleaner output
//   stdout.write('\x1B[?25l');

//   // Run the task in the background
//   final taskFuture = task();

//   // Display spinner while task is running
//   while (isRunning) {
//     stdout.write('\r$message ${spinner[i % spinner.length]}'.white);
//     i++;
//     await Future.delayed(spinDelay);

//     // Check if task is complete
//     if (await Future.any([taskFuture.then((_) => true), Future.value(false)])) {
//       isRunning = false;
//     }
//   }

//   // Wait for the task result
//   final result = await taskFuture;

//   // Clear the line, show cursor, and indicate completion
//   stdout.write('\r\x1B[K');
//   stdout.write('\x1B[?25h');

//   return result;
// }
