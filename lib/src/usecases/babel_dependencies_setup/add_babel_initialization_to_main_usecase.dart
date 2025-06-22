import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/usecases/set_target_files_usecase/add_import_if_needed.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Unit> addBabelInitializationToMainUsecase({
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
    return Exception(
      '❌ Main file not found in the target project'.red,
    ).toFailure();
  }

  String fileContent;
  try {
    fileContent = await mainFile.readAsString();
  } catch (e, stackTrace) {
    return Exception(
      'Failed to read main file: ${e.toString()}\n$stackTrace',
    ).toFailure();
  }

  fileContent = addImportIfNeededUsecase(
    fileContent: fileContent,
    codeBaseYamlInfo: codeBaseYamlInfo,
  );

  final mainRegex = RegExp(
    r'(Future<void>|void)\s+main\s*\([^)]*\)\s*(async\s*)?{',
  );
  final match = mainRegex.firstMatch(fileContent);
  if (match == null) {
    return Exception('❌ No main() function found.'.red).toFailure();
  }

  final bool hasAsync = match.group(2) != null;
  final int braceIndex = fileContent.indexOf('{', match.start);
  if (!hasAsync) {
    fileContent = fileContent.replaceRange(braceIndex, braceIndex, ' async');
  }

  final insertionIndex = fileContent.indexOf('{', match.start) + 1;
  if (!fileContent.contains('Babel.instance.initialize(')) {
    fileContent = fileContent.replaceRange(
      insertionIndex,
      insertionIndex,
      '\n  await Babel.instance.initialize();',
    );
  }

  try {
    await mainFile.writeAsString(fileContent);
  } catch (e, stackTrace) {
    return Exception(
      'Failed to write to main file: ${e.toString()}\n$stackTrace',
    ).toFailure();
  }

  return Success(unit);
}

AsyncResult<GenerateFlowAddedBabelClassInitializationInMain>
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
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitVariables: payload.gitVariables,
      maxLanguageCount: payload.maxLanguageCount,
      languages: payload.languages,
      downloadLink: payload.downloadLink,
      referenceArbMap: payload.referenceArbMap,
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
