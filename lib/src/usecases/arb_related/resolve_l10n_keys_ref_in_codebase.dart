import 'dart:io';

import 'package:enchanted_collection/enchanted_collection.dart';
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
  required Map<L10nKey, ProcessedKeyIntegrity> remapedArbKeys,
  required List<File> targetFiles,
  required TranslationPayloadInfo currentPayloadInfo,
  required String directoryPath,
}) async {
  final L10nProjectConfigWithData? projectConfigWithData =
      projectConfig.mapOrNull(withData: (value) => value);
  if (projectConfigWithData == null) {
    return currentPayloadInfo.toSuccess();
  }
  final Map<TranslationKey, Set<ContextPath>> keyToContextsPaths = {
    ...currentPayloadInfo.keyToContextsPaths,
  };
  final String outputClass = projectConfigWithData.outputClass;
  final String defaultPattern = '$outputClass'
      r'\s*\.of\(\s*(?:[a-zA-Z]|\r|\n|\t|\f|\v)+\s*,?\s*\)\s*!?';
  final String directDelegate = '$outputClass'
      r'\s*.of\(\s*(?:[a-zA-Z])+,\s*S\s*,?\s*\)\s*!?';

  for (final file in targetFiles) {
    try {
      String fileContent = await file.readAsString();

      // Remove l10n-related imports based on outputDir
      final escapedOutputDir = RegExp.escape(projectConfigWithData.outputDir);
      // Also escape the output class filename (usually 's.dart' from class S)
      final outputClassFileName = projectConfigWithData.outputClass.toLowerCase();
      
      // Match both relative and package imports that contain the outputDir
      // This will match patterns like:
      // - import 'package:myapp/gen_l10n/s.dart';
      // - import '../gen_l10n/app_localizations.dart';
      // - import 'package:scoutbox/gen_l10n/s.dart';
      final importPattern = RegExp(
        "import\\s+['\"][^'\"]*/$escapedOutputDir/[^'\"]+\\.dart['\"];?\\s*",
        multiLine: true,
      );
      
      // Additional pattern to catch imports with just the output class file
      final outputClassImportPattern = RegExp(
        "import\\s+['\"][^'\"]*/$outputClassFileName\\.dart['\"];?\\s*",
        multiLine: true,
      );
      
      bool hasImportChanges = false;
      
      // Remove imports containing the output directory
      if (importPattern.hasMatch(fileContent)) {
        fileContent = fileContent.replaceAll(importPattern, '');
        hasImportChanges = true;
      }
      
      // Remove imports containing just the output class file (e.g., s.dart)
      if (outputClassImportPattern.hasMatch(fileContent)) {
        fileContent = fileContent.replaceAll(outputClassImportPattern, '');
        hasImportChanges = true;
      }
      
      // Clean up any multiple consecutive newlines left after import removal
      if (hasImportChanges) {
        fileContent = fileContent.replaceAll(RegExp(r'\n\n\n+'), '\n\n');
      }

      final regex = RegExp(
        '($defaultPattern|$directDelegate)',
        caseSensitive: false,
        multiLine: true,
      );
      bool hasChanges = hasImportChanges;
      fileContent = fileContent.replaceAllMapped(regex, (match) {
        hasChanges = true;
        return kBabelClass;
      });
      // Let's group the entries so we won't overhelm the regex engine
      final clusteredRemapedArbs = remapedArbKeys.entries.splitIntoGroups(30);
      for (final group in clusteredRemapedArbs) {
        String variableNamesIdentifiers = '';

        for (final entry in group) {
          final L10nKey originalKey = entry.key;
          variableNamesIdentifiers = variableNamesIdentifiers.isEmpty
              ? originalKey
              : '$variableNamesIdentifiers|$originalKey';
        }

        final groupRegex = RegExp(
          kBabelClass + r'\s*\.\s*' + '($variableNamesIdentifiers)',
          caseSensitive: false,
          multiLine: true,
        );

        fileContent = fileContent.replaceAllMapped(groupRegex, (match) {
          final L10nKey? originalKey = match.group(1);
          if (originalKey == null) {
            return match.group(0) ?? '';
          }

          final ProcessedKeyIntegrity? newProcessedKey =
              remapedArbKeys[originalKey];
          if (newProcessedKey == null) {
            return match.group(0) ?? '';
          }

          return '$kBabelClass.$newProcessedKey';
        });
      }

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
        GenerateFlowReplacedAllL10nKeyReferencesInCodebaseForBabelFunctions>
    generate_replaceAllL10nKeyReferencesInCodebaseForBabelFunctions(
  GenerateFlowAppliedCodebaseGeneralDartFixes payload,
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
      dangerouslyAutoDetectUserFacingHardcodedStrings:
          payload.dangerouslyAutoDetectUserFacingHardcodedStrings,
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
      dangerouslyAutoDetectUserFacingHardcodedStrings:
          payload.dangerouslyAutoDetectUserFacingHardcodedStrings,
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
      hardcodedStringsPayloadInfo: payload.hardcodedStringsPayloadInfo,
      hardcodedStringsPerFile: payload.hardcodedStringsPerFile,
    ).toSuccess();
  });
}
