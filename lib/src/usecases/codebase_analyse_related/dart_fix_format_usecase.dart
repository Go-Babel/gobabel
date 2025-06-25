import 'dart:io';

import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<Unit> multiDartFixFormatUsecase({
  required String dirrPath,
  required List<File> targetFiles,
}) async {
  if (targetFiles.isEmpty) {
    return Success(unit);
  }

  final Iterable<String> paths = targetFiles.map((e) => e.path);
  try {
    await BabelProcessRunner.run(
      command: 'dart format $paths',
      dirrPath: dirrPath,
    );
    for (final String path in paths) {
      await BabelProcessRunner.run(
        command: 'dart fix --apply $path',
        dirrPath: dirrPath,
      );
    }
    return Success(unit);
  } catch (e, s) {
    return Failure(
      BabelException(
        title: 'Dart Fix Format Error',
        description: 'Failed to apply dart fix and format.\n\n$e\n\n$s',
      ),
    );
  }
}

AsyncResult<GenerateFlowAppliedCodebaseGeneralDartFixes>
generate_multiDartFixFormatUsecase(
  GenerateFlowReplacedHardcodedStringsForBabelText payload,
) async {
  final List<File> targetFiles = await payload.filesToBeAnalysed;
  return multiDartFixFormatUsecase(
    dirrPath: payload.directoryPath,
    targetFiles: targetFiles,
  ).flatMap((_) {
    return GenerateFlowAppliedCodebaseGeneralDartFixes(
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
