import 'dart:io';

import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/usecases/babel_dependencies_setup/file_utils.dart';
import 'package:gobabel/src/usecases/babel_dependencies_setup/generate_babel_class.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Unit> writeBabelTextFileIntoDirectory({
  required BigInt projectShaIdentifier,
  required Directory directory,
  required TranslationPayloadInfo currentPayloadInfo,
}) async {
  final babelPathResult = await getBabelTextFile(curr: directory);
  if (babelPathResult.isError()) {
    return babelPathResult.asError();
  }
  final String babelPath = babelPathResult.getOrThrow();
  try {
    final file = File(babelPath);

    final babelClassResult = await generateBabelClassUsecase(
      projectShaIdentifier: projectShaIdentifier,
      declarationFunctions: currentPayloadInfo.keyToDeclaration.values.toSet(),
    );
    if (babelClassResult.isError()) {
      return babelClassResult.asError();
    }
    final String babelClass = babelClassResult.getOrThrow();

    await file.writeAsString(babelClass, mode: FileMode.write);

    return Success(unit);
  } catch (e, s) {
    return BabelException(
      title: 'Failed to write Babel text file',
      description: 'Error writing Babel text file at $babelPath.\n\n$e\n\n$s',
    ).toFailure();
  }
}

AsyncResult<GenerateFlowWrittedBabelClassInDartFile>
generate_writeBabelTextFileIntoDirectory(
  GenerateFlowAppliedCodebaseGeneralDartFixes payload,
) async {
  return writeBabelTextFileIntoDirectory(
    currentPayloadInfo: payload.hardcodedStringsPayloadInfo,
    projectShaIdentifier: payload.gitVariables.projectShaIdentifier,
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
