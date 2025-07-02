import 'dart:io';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/dart_fix_format_usecase.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/move_hardcoded_string_in_funtion_param.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/move_hardcoded_string_param_case.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/remove_adjacent_string_concatenation.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/remove_const_of_constructors_with_default_string_in_parameter.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/remove_const_of_lists_that_contain_hardcoded_strings.dart';
import 'package:gobabel/src/usecases/codebase_analyse_related/resolve_enum_hardcoded_string_variables.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<Unit> normalizeCodeBase({
  required String dirPath,
  required List<File> targetFiles,
}) async {
  return multiRemoveAdjacentStringLiteralConcatenationUsecase(
        targetFiles: targetFiles,
      )
      .flatMap(
        (_) =>
            multiResolveEnumHardcodedStringsUsecase(targetFiles: targetFiles),
      )
      .flatMap(
        (_) => multiDartFixFormatUsecase(
          dirrPath: dirPath,
          targetFiles: targetFiles,
        ),
      )
      .flatMap(
        (_) => multiMoveHardcodedStringInFuntionParamUsecase(
          targetFiles: targetFiles,
        ),
      )
      .flatMap(
        (_) => multiMoveHardCodedStringParamUseCase(targetFiles: targetFiles),
      )
      .flatMap(
        (_) =>
            multiRemoveConstOfListsSetsAndMapThatContainHardcodedStringsInside(
              targetFiles: targetFiles,
            ),
      )
      .flatMap(
        (_) => multiFileRemoveConstOfConstructorsWithDefaultStringInParameter(
          targetFiles: targetFiles,
        ),
      );
}

AsyncBabelResult<GenerateFlowCodebaseNormalized> generate_normalizeCodeBase(
  GenerateFlowReplacedAllL10nKeyReferencesInCodebaseForBabelFunctions payload,
) async {
  final dirPath = payload.directoryPath;
  final targetFiles = await payload.filesToBeAnalysed;

  return normalizeCodeBase(dirPath: dirPath, targetFiles: targetFiles).flatMap((
    _,
  ) {
    return GenerateFlowCodebaseNormalized(
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
    ).toSuccess();
  });
}
