import 'dart:io';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/usecases/set_target_files_usecase/add_import_if_needed.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

String _addFlutterImport(String fileContent) {
  const flutterImport = "import 'package:flutter/widgets.dart';";

  // Try to find existing imports to insert after
  final importGroup =
      RegExp(
        r'''^import ['"].*['"];$''',
        multiLine: true,
      ).allMatches(fileContent).lastOrNull;

  if (importGroup != null) {
    final int end = importGroup.end;
    return fileContent.replaceRange(end, end, '\n$flutterImport');
  }

  // No imports found, add at the beginning
  return '$flutterImport\n\n$fileContent';
}

AsyncBabelResult<Unit> addBabelInitializationToMainUsecase({
  required Directory directory,
  required CodeBaseYamlInfo codeBaseYamlInfo,
}) async {
  File mainFile;
  final ProjectType type = codeBaseYamlInfo.type;
  final String projectName = codeBaseYamlInfo.projectName;
  if (type == ProjectType.flutter) {
    mainFile = File('${directory.path}/lib/main.dart');
  } else {
    mainFile = File('${directory.path}/bin/$projectName.dart');
    if (!await mainFile.exists()) {
      mainFile = File('${directory.path}/bin/main.dart');
    }
  }

  if (!await mainFile.exists()) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Main file not found',
        description:
            'Could not locate the main.dart file in the expected location. '
            'For Flutter projects, it should be at lib/main.dart. '
            'For Dart projects, it should be at bin/$projectName.dart or bin/main.dart.',
      ),
    ).toFailure();
  }

  String fileContent;
  try {
    fileContent = await mainFile.readAsString();
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Failed to read main file',
        description:
            'Could not read the main.dart file. '
            'Please check that the file exists and you have read permissions',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }

  fileContent = addImportIfNeededUsecase(
    fileContent: fileContent,
    codeBaseYamlInfo: codeBaseYamlInfo,
  );

  // Add Flutter import if needed for Flutter projects
  if (type == ProjectType.flutter &&
      !fileContent.contains('WidgetsFlutterBinding') &&
      !fileContent.contains("import 'package:flutter/widgets.dart'") &&
      !fileContent.contains('import "package:flutter/widgets.dart"') &&
      !fileContent.contains("import 'package:flutter/material.dart'") &&
      !fileContent.contains('import "package:flutter/material.dart"')) {
    // Add the Flutter widgets import
    fileContent = _addFlutterImport(fileContent);
  }

  final mainRegex = RegExp(
    r'(Future<void>|void)\s+main\s*\([^)]*\)\s*(async\s*)?{',
  );
  final match = mainRegex.firstMatch(fileContent);
  if (match == null) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'No main() function found',
        description:
            'Could not find a main() function in the main.dart file. '
            'Please ensure your main.dart file contains a valid main() function declaration.',
      ),
    ).toFailure();
  }

  final bool hasAsync = match.group(2) != null;
  final int braceIndex = fileContent.indexOf('{', match.start);
  if (!hasAsync) {
    fileContent = fileContent.replaceRange(braceIndex, braceIndex, ' async');
  }

  // Check if WidgetsFlutterBinding.ensureInitialized() exists
  final bindingRegex = RegExp(
    r'WidgetsFlutterBinding\.ensureInitialized\(\s*\)\s*;',
  );
  final bindingMatch = bindingRegex.firstMatch(fileContent);

  if (!fileContent.contains('Babel.instance.initialize(')) {
    if (bindingMatch != null) {
      // Insert Babel initialization after WidgetsFlutterBinding.ensureInitialized()
      final insertionIndex = bindingMatch.end;
      fileContent = fileContent.replaceRange(
        insertionIndex,
        insertionIndex,
        '\n  await Babel.instance.initialize();',
      );
    } else if (type == ProjectType.flutter) {
      // For Flutter projects, add WidgetsFlutterBinding.ensureInitialized() first
      final insertionIndex = fileContent.indexOf('{', match.start) + 1;
      fileContent = fileContent.replaceRange(
        insertionIndex,
        insertionIndex,
        '\n  WidgetsFlutterBinding.ensureInitialized();\n  await Babel.instance.initialize();',
      );
    } else {
      // For Dart projects, just add Babel initialization
      final insertionIndex = fileContent.indexOf('{', match.start) + 1;
      fileContent = fileContent.replaceRange(
        insertionIndex,
        insertionIndex,
        '\n  await Babel.instance.initialize();',
      );
    }
  }

  try {
    await mainFile.writeAsString(fileContent);
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Failed to write to main file',
        description:
            'Could not write the Babel initialization to the main.dart file. '
            'Please check that you have write permissions to the file.',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }

  return Success(unit);
}

AsyncBabelResult<GenerateFlowAddedBabelClassInitializationInMain>
generate_addBabelInitializationToMainUsecase(
  GenerateFlowWrittedBabelClassInDartFile payload,
) {
  return addBabelInitializationToMainUsecase(
    codeBaseYamlInfo: payload.yamlInfo,
    directory: payload.directory,
  ).flatMap((_) {
    return GenerateFlowAddedBabelClassInitializationInMain(
      willLog: payload.willLog,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      inputedByUserLocale: payload.inputedByUserLocale,
      dangerouslyAutoDetectUserFacingHardcodedStrings:
          payload.dangerouslyAutoDetectUserFacingHardcodedStrings,
      runForAllFiles: payload.runForAllFiles,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitVariables: payload.gitVariables,
      maxLanguageCount: payload.maxLanguageCount,
      languages: payload.languages,
      projectCacheMap: payload.projectCacheMap,
      cacheMapTranslationPayloadInfo: payload.cacheMapTranslationPayloadInfo,
      filesVerificationState: payload.filesVerificationState,
      projectArbData: payload.projectArbData,
      codebaseArbTranslationPayloadInfo:
          payload.codebaseArbTranslationPayloadInfo,
      remapedArbKeys: payload.remapedArbKeys,
      hardcodedStringsPayloadInfo: payload.hardcodedStringsPayloadInfo,
      hardcodedStringsPerFile: payload.hardcodedStringsPerFile,
    ).toSuccess();
  });
}
