import 'dart:io';

import 'package:enchanted_collection/enchanted_collection.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/utils/console_manager.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
import 'package:gobabel/src/usecases/key_integrity/generate_log_if_requested.dart';
import 'package:gobabel/src/usecases/arb_related/remove_localizations_delegates.dart';
import 'package:gobabel/src/usecases/arb_related/replace_l10n_imports.dart';
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
      r'\s*\.of\(\s*(?:[a-zA-Z]|\r|\n|\t|\f|\v)+\s*,?\s*\)\s*!?';
  final String directDelegate =
      '$outputClass'
      r'\s*.of\(\s*(?:[a-zA-Z])+,\s*S\s*,?\s*\)\s*!?';

  // The index 0 will be the one with the biggest length
  final ordoredKeysByBiggestLenghtFirst = remapedArbKeys.keys.toList()
    ..sort((a, b) => b.length.compareTo(a.length));
  // Split into groups of 30 to avoid overwhelming the regex engine
  // This is a heuristic to balance performance and complexity
  final clusteredRemapedArbs = ordoredKeysByBiggestLenghtFirst.splitIntoGroups(
    20,
  );

  final String projectName = codeBaseYamlInfo.projectName;
  
  // Track progress for the progress bar
  int processedFiles = 0;
  final totalFiles = targetFiles.length;

  for (final file in targetFiles) {
    try {
      // Update progress bar
      processedFiles++;
      LoadingIndicator.instance.setLoadingProgressBar(
        message: 'Replacing L10n references in codebase',
        barProgressInfo: BarProgressInfo(
          message: 'Processing: ${file.path.split('/').last}',
          totalSteps: totalFiles,
          currentStep: processedFiles,
        ),
      );
      
      String fileContent = await file.readAsString();

      // Remove localizationsDelegates if needed
      final (
        delegatesRemovedContent,
        hasDelegateChanges,
      ) = removeLocalizationsDelegatesIfNeeded(
        fileContent: fileContent,
        projectConfig: projectConfigWithData,
        projectName: projectName,
      );

      fileContent = delegatesRemovedContent;

      // Remove l10n imports if needed
      final (modifiedContent, hasImportChanges) = replaceImportsIfNeeded(
        fileContent: fileContent,
        projectConfig: projectConfigWithData,
        projectName: projectName,
      );

      fileContent = modifiedContent;

      // Clean up any multiple consecutive newlines left after removal
      if (hasImportChanges || hasDelegateChanges) {
        fileContent = fileContent.replaceAll(RegExp(r'\n\n\n+'), '\n\n');
      }

      final regex = RegExp(
        '($defaultPattern|$directDelegate)',
        multiLine: true,
      );
      bool hasChanges = hasImportChanges || hasDelegateChanges;
      fileContent = fileContent.replaceAllMapped(regex, (match) {
        hasChanges = true;
        return kBabelClass;
      });
      // Let's group the entries so we won't overhelm the regex engine
      
      // Track progress for key groups
      int processedGroups = 0;
      final totalGroups = clusteredRemapedArbs.length;

      for (final group in clusteredRemapedArbs) {
        processedGroups++;
        
        // Update progress bar with detailed file and group progress
        LoadingIndicator.instance.setLoadingProgressBar(
          message: 'Replacing L10n references in codebase',
          barProgressInfo: BarProgressInfo(
            message: 'File ${file.path.split('/').last} - Key group $processedGroups/$totalGroups',
            totalSteps: totalFiles,
            currentStep: processedFiles,
          ),
        );
        
        String variableNamesIdentifiers = '';

        for (final L10nKey originalKey in group) {
          variableNamesIdentifiers = variableNamesIdentifiers.isEmpty
              ? originalKey
              : '$variableNamesIdentifiers|$originalKey';
        }
        final regex =
            kBabelClass + r'\s*\.\s*' + '($variableNamesIdentifiers)\b';

        final groupRegex = RegExp(regex, multiLine: true);

        fileContent = fileContent.replaceAllMapped(groupRegex, (match) {
          final L10nKey? originalKey = match.group(1);
          if (originalKey == null) {
            logMessages.add(
              '''No original key found for "$regex" in match: $match''',
            );
            return match.group(0) ?? '';
          }

          final ProcessedKeyIntegrity? newProcessedKey =
              remapedArbKeys[originalKey];
          if (newProcessedKey == null) {
            logMessages.add(
              '''No processedKey key found for "$regex" in match: $match''',
            );
            return match.group(0) ?? '';
          }

          final BabelFunctionImplementation? implementation =
              currentPayloadInfo.keyToImplementation[newProcessedKey];
          if (implementation == null) {
            logMessages.add(
              '''No implementation found for key: $originalKey''',
            );
          }

          return implementation!;
        });
      }

      if (hasChanges) {
        final fileContentWithImport = addImportIfNeededUsecase(
          codeBaseYamlInfo: codeBaseYamlInfo,
          fileContent: fileContent,
        );

        await file.writeAsString(fileContentWithImport);

        // Calculate relative path from directoryPath to the file
        final relativePath = file.path.startsWith(directoryPath)
            ? file.path
                  .substring(directoryPath.length)
                  .replaceFirst(RegExp(r'^[/\\]'), '')
            : file.path;

        final fixResultAsync = await runBabelProcess(
          command: 'dart fix --apply "$relativePath"',
          dirrPath: directoryPath,
        );

        if (fixResultAsync.isError()) {
          return Failure(fixResultAsync.exceptionOrNull()!);
        }
      }
    } catch (e, s) {
      // Log error but continue processing other files
      logMessages.add('Error processing file "${file.path}": $e\n$s');
      ConsoleManager.instance.error('Error processing file "${file.path}": $e');
      rethrow;
      // continue;
    }
  }
  
  // Clear the progress bar after completion
  LoadingIndicator.instance.setLoadingState(
    message: 'Completed L10n reference replacement',
    totalCount: totalFiles,
    step: totalFiles,
  );

  return currentPayloadInfo
      .copyWith(keyToContextsPaths: keyToContextsPaths)
      .toSuccess();
}

AsyncBabelResult<
  GenerateFlowReplacedAllL10nKeyReferencesInCodebaseForBabelFunctions
>
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
    currentPayloadInfo: payload.hardcodedStringsPayloadInfo,
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
