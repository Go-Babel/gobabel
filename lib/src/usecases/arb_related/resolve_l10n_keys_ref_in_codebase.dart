import 'dart:io';

import 'package:enchanted_collection/enchanted_collection.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
import 'package:gobabel/src/usecases/set_target_files_usecase/add_import_if_needed.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:meta/meta.dart';
import 'package:result_dart/result_dart.dart';

/// Removes l10n import statements from file content.
/// Returns a tuple of (modifiedContent, hasChanges).
@visibleForTesting
(String content, bool hasChanges) replaceImportsIfNeeded({
  required String fileContent,
  required L10nProjectConfigWithData projectConfig,
  required String projectName,
}) {
  final importToRemove = projectConfig.getImportString(projectName);
  
  // Create regex patterns to match different import styles
  // This matches imports with or without aliases (as, show, hide)
  final patterns = [
    // Standard import: import 'package:...'
    RegExp(
      "^import\\s+['\"]${RegExp.escape(importToRemove)}['\"];?.*\$",
      multiLine: true,
    ),
    // Import with alias: import 'package:...' as alias;
    RegExp(
      "^import\\s+['\"]${RegExp.escape(importToRemove)}['\"]\\s+as\\s+\\w+;?.*\$",
      multiLine: true,
    ),
    // Import with show/hide: import 'package:...' show/hide ...;
    RegExp(
      "^import\\s+['\"]${RegExp.escape(importToRemove)}['\"]\\s+(show|hide)\\s+[^;]+;?.*\$",
      multiLine: true,
    ),
    // Also check for flutter_gen imports if switching from synthetic
    if (!projectConfig.syntheticPackage)
      RegExp(
        "^import\\s+['\"]package:flutter_gen/gen_l10n/${projectConfig.outputClass.toLowerCase()}\\.dart['\"].*\$",
        multiLine: true,
      ),
    // Also check for project package imports if switching to synthetic
    if (projectConfig.syntheticPackage)
      RegExp(
        "^import\\s+['\"]package:$projectName/[^'\"]*/${projectConfig.outputClass.toLowerCase()}\\.dart['\"].*\$",
        multiLine: true,
      ),
  ];
  
  bool hasChanges = false;
  String result = fileContent;
  
  for (final pattern in patterns) {
    if (pattern.hasMatch(result)) {
      hasChanges = true;
      // Replace the entire line including the newline character
      result = result.replaceAll(pattern, '');
    }
  }
  
  return (result, hasChanges);
}

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

  // The index 0 will be the one with the biggest length
  final ordoredKeysByBiggestLenghtFirst = remapedArbKeys.keys.toList()
    ..sort((a, b) => b.length.compareTo(a.length));
  // Split into groups of 30 to avoid overwhelming the regex engine
  // This is a heuristic to balance performance and complexity
  final clusteredRemapedArbs =
      ordoredKeysByBiggestLenghtFirst.splitIntoGroups(30);

  final String projectName = codeBaseYamlInfo.projectName;

  for (final file in targetFiles) {
    try {
      String fileContent = await file.readAsString();

      // Remove l10n imports if needed
      final (modifiedContent, hasImportChanges) = replaceImportsIfNeeded(
        fileContent: fileContent,
        projectConfig: projectConfigWithData,
        projectName: projectName,
      );
      
      fileContent = modifiedContent;

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

      for (final group in clusteredRemapedArbs) {
        String variableNamesIdentifiers = '';

        for (final L10nKey originalKey in group) {
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

          final BabelFunctionImplementation implementation =
              currentPayloadInfo.keyToImplementation[newProcessedKey]!;

          return implementation;
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

  final fixResultAsync = await runBabelProcess(
    command: 'dart fix --apply',
    dirrPath: directoryPath,
  );

  if (fixResultAsync.isError()) {
    return Failure(fixResultAsync.exceptionOrNull()!);
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
      dangerouslyAutoAcceptAllHardcodedStringsAsUserFacing:
          payload.dangerouslyAutoAcceptAllHardcodedStringsAsUserFacing,
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
      dangerouslyAutoAcceptAllHardcodedStringsAsUserFacing:
          payload.dangerouslyAutoAcceptAllHardcodedStringsAsUserFacing,
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
      codebaseArbTranslationPayloadInfo: response,
      remapedArbKeys: payload.remapedArbKeys,
      hardcodedStringsPayloadInfo: payload.hardcodedStringsPayloadInfo,
      hardcodedStringsPerFile: payload.hardcodedStringsPerFile,
    ).toSuccess();
  });
}
