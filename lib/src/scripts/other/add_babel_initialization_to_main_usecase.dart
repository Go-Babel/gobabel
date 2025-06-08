import 'dart:io';
import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/utils/git_process_runner.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/scripts/other/add_import_if_needed.dart';

class AddBabelInitializationToMainUsecase {
  final AddImportIfNeededUsecase _addImportIfNeededUsecase;

  AddBabelInitializationToMainUsecase({
    AddImportIfNeededUsecase? addImportIfNeededUsecase,
  }) : _addImportIfNeededUsecase =
           addImportIfNeededUsecase ?? AddImportIfNeededUsecase();

  Future<void> call() async {
    final Directory directory = Dependencies.targetDirectory;
    final ProjectType type = Dependencies.codeBaseYamlInfo.type;
    final String projectName = Dependencies.codeBaseYamlInfo.projectName;

    File mainFile;
    if (type == ProjectType.flutter) {
      mainFile = File('${directory.path}/lib/main.dart');
    } else {
      mainFile = File('${directory.path}/bin/$projectName.dart');
      if (!await mainFile.exists()) {
        mainFile = File('${directory.path}/bin/main.dart');
      }
    }

    if (!await mainFile.exists()) {
      throw Exception('❌ Main file not found in the target project'.red);
    }

    String fileContent = await mainFile.readAsString();

    fileContent = _addImportIfNeededUsecase.call(fileContent: fileContent);

    final mainRegex = RegExp(
      r'(Future<void>|void)\s+main\s*\([^)]*\)\s*(async\s*)?{',
    );
    final match = mainRegex.firstMatch(fileContent);
    if (match == null) {
      throw Exception('❌ No main() function found.'.red);
    }

    final bool hasAsync = match.group(2) != null;
    final int braceIndex = fileContent.indexOf('{', match.start);
    if (!hasAsync) {
      fileContent = fileContent.replaceRange(braceIndex, braceIndex, ' async');
    }

    final insertionIndex = fileContent.indexOf('{', match.start) + 1;
    if (!fileContent.contains('Babel.initialize(')) {
      fileContent = fileContent.replaceRange(
        insertionIndex,
        insertionIndex,
        '\n  await Babel.initialize();',
      );
    }

    await mainFile.writeAsString(fileContent);

    await _ensureSharedPrefs();
  }

  Future<void> _ensureSharedPrefs() async {
    final Directory dir = Dependencies.targetDirectory;
    final File yamlFile = File('${dir.path}/pubspec.yaml');
    if (!await yamlFile.exists()) return;

    final String yamlContent = await yamlFile.readAsString();
    final hasDependency = RegExp(
      r'^\s*shared_preferences\s*:',
      multiLine: true,
    ).hasMatch(yamlContent);

    if (!hasDependency) {
      final String runner =
          Dependencies.codeBaseYamlInfo.type == ProjectType.flutter
              ? 'flutter'
              : 'dart';
      final result = await BabelProcessRunner.run(
        '$runner pub add shared_preferences',
      );
      if (result.exitCode != 0) {
        throw Exception('Failed to add shared_preferences dependency');
      }
    }
  }
}
