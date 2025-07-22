import 'dart:io';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel/src/usecases/babel_dependencies_setup/file_utils.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<Unit> writeBabelTextFileIntoDirectory({
  required String babelClass,
  required Directory directory,
}) async {
  final babelPathResult = await getBabelTextFile(curr: directory);
  if (babelPathResult.isError()) {
    return babelPathResult.asBabelResultErrorAsync();
  }
  final String babelPath = babelPathResult.getOrThrow();
  try {
    final file = File(babelPath);
    await file.writeAsString(babelClass, mode: FileMode.write);
    return Success(unit);
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Failed to write Babel text file',
        description: 'Error writing Babel text file at $babelPath',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }
}

AsyncBabelResult<GenerateFlowWrittedBabelClassInDartFile>
generate_writeBabelTextFileIntoDirectory(
  GenerateFlowGeneratedBabelClass payload,
) async {
  return writeBabelTextFileIntoDirectory(
    babelClass: payload.babelClass,
    directory: payload.directory,
  ).flatMap((_) {
    return GenerateFlowWrittedBabelClassInDartFile(
      willLog: payload.willLog,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      inputedByUserLocale: payload.inputedByUserLocale,
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

AsyncBabelResult<SyncFlowWrittedBabelTextFileIntoDirectory>
sync_writeBabelTextFileIntoDirectory(
  SyncFlowGeneratedBabelClass payload,
) async {
  return writeBabelTextFileIntoDirectory(
    babelClass: payload.babelClass,
    directory: payload.directory,
  ).flatMap((_) {
    return SyncFlowWrittedBabelTextFileIntoDirectory(
      willLog: payload.willLog,
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: payload.client,
      yamlInfo: payload.yamlInfo,
      gitVariables: payload.gitVariables,
      contextPaths: payload.contextPaths,
      declarationFunctions: payload.declarationFunctions,
    ).toSuccess();
  });
}
