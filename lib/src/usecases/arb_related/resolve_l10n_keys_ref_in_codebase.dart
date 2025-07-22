import 'dart:io';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
import 'package:gobabel/src/usecases/set_target_files_usecase/add_import_if_needed.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<TranslationPayloadInfo>
replaceAllL10nKeyReferencesInCodebaseForBabelFunctions({
  required L10nProjectConfig projectConfig,
  required CodeBaseYamlInfo codeBaseYamlInfo,
  required Map<TranslationKey, ProcessedKeyIntegrity> remapedArbKeys,
  required List<File> targetFiles,
  required TranslationPayloadInfo currentPayloadInfo,
  required String directoryPath,
}) async {
  final L10nProjectConfigWithData? projectConfigWithData = projectConfig
      .mapOrNull(withData: (value) => value);
  if (projectConfigWithData == null) {
    return currentPayloadInfo.toSuccess();
  }
  final Map<TranslationKey, Set<ContextPath>> keyToContextsPaths = {
    ...currentPayloadInfo.keyToContextsPaths,
  };
  final String outputClass = projectConfigWithData.outputClass;
  final String defaultPattern =
      '$outputClass'
      r'\s*\.of\(\s*(?:[a-zA-Z]|\r|\n|\t|\f|\v)+\s*,?\s*\)';
  // Based on "final localizations = Localizations.of<S>(context, S);"
  final String directDelegate =
      '$outputClass'
      r'\s*.of\(\s*(?:[a-zA-Z])+,\s*S\s*,?\s*\)';

  for (final file in targetFiles) {
    try {
      String fileContent = await file.readAsString();

      final regex = RegExp(
        '($defaultPattern|$directDelegate)',
        caseSensitive: false,
        multiLine: true,
      );
      bool hasChanges = false;

      fileContent.replaceAllMapped(regex, (match) {
        hasChanges = true;
        return outputClass;
      });

      if (hasChanges) {
        final fileContentWithImport = addImportIfNeededUsecase(
          codeBaseYamlInfo: codeBaseYamlInfo,
          fileContent: fileContent,
        );
        await file.writeAsString(fileContentWithImport);
      }
    } catch (e) {
      // Log error but continue processing other files
      print('Error processing file ${file.path}: $e');
      continue;
    }
  }

  return currentPayloadInfo
      .copyWith(keyToContextsPaths: keyToContextsPaths)
      .toSuccess();
}

AsyncBabelResult<
  GenerateFlowReplacedAllL10nKeyReferencesInCodebaseForBabelFunctions
>
generate_replaceAllL10nKeyReferencesInCodebaseForBabelFunctions(
  GenerateFlowResolvedProjectArbTranslationPayload payload,
) async {
  final projectConfig = payload.projectArbData.mapOrNull(
    withData: (value) => value.config,
  );
  if (projectConfig == null) {
    return GenerateFlowReplacedAllL10nKeyReferencesInCodebaseForBabelFunctions(
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
    ).toSuccess();
  }

  return replaceAllL10nKeyReferencesInCodebaseForBabelFunctions(
    projectConfig: projectConfig,
    codeBaseYamlInfo: payload.yamlInfo,
    remapedArbKeys: payload.remapedArbKeys,
    targetFiles: await payload.filesToBeAnalysed,
    currentPayloadInfo: payload.codebaseArbTranslationPayloadInfo,
    directoryPath: payload.directoryPath,
  ).flatMap((response) {
    return GenerateFlowReplacedAllL10nKeyReferencesInCodebaseForBabelFunctions(
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
      codebaseArbTranslationPayloadInfo: response,
      remapedArbKeys: payload.remapedArbKeys,
    ).toSuccess();
  });
}
