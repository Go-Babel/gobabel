import 'dart:io';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<Unit> multiDartFixFormatUsecase({
  required String dirrPath,
  required List<File> targetFiles,
}) async {
  if (targetFiles.isEmpty) {
    return Success(unit);
  }

  final Iterable<String> paths = targetFiles.map((e) => e.path);

  // Format all files at once
  final formatResultAsync = await runBabelProcess(
    command: 'dart format ${paths.join(' ')}',
    dirrPath: dirrPath,
  );

  if (formatResultAsync.isError()) {
    return formatResultAsync.asBabelResultErrorAsync();
  }

  // Apply dart fix to each file
  for (final String path in paths) {
    final fixResultAsync = await runBabelProcess(
      command: 'dart fix --apply $path',
      dirrPath: dirrPath,
    );

    if (fixResultAsync.isError()) {
      return Failure(fixResultAsync.exceptionOrNull()!);
    }
  }

  return Success(unit);
}

AsyncBabelResult<GenerateFlowAppliedCodebaseGeneralDartFixes>
generate_multiDartFixFormatUsecase(
  GenerateFlowAddedSharedPrefsInFlutterProjects payload,
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

AsyncBabelResult<GenerateFlowAppliedInitialDartFixes>
generate_multiDartFixFormatUsecaseForNormalize(
  GenerateFlowResolvedEnumHardcodedStrings payload,
) async {
  final targetFiles = await payload.filesToBeAnalysed;

  final result = await multiDartFixFormatUsecase(
    dirrPath: payload.directoryPath,
    targetFiles: targetFiles,
  );

  if (result.isError()) {
    return result.asBabelResultErrorAsync();
  }

  return GenerateFlowAppliedInitialDartFixes(
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
    remapedArbKeys: payload.remapedArbKeys,
    codebaseArbTranslationPayloadInfo:
        payload.codebaseArbTranslationPayloadInfo,
  ).toSuccess();
}
