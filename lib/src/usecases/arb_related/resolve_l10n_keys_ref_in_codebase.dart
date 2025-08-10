import 'dart:io';

import 'package:enchanted_collection/enchanted_collection.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/utils/console_manager.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/core/utils/process_runner.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/l10n_project_config.dart';
import 'package:gobabel/src/models/project_arb_data.dart';
import 'package:gobabel/src/usecases/arb_related/remove_localizations_delegates.dart';
import 'package:gobabel/src/usecases/arb_related/replace_l10n_imports.dart';
import 'package:gobabel/src/usecases/arb_related/replace_l10n_references_with_babel.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
import 'package:gobabel/src/usecases/key_integrity/generate_log_if_requested.dart';
import 'package:gobabel/src/usecases/set_target_files_usecase/add_import_if_needed.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<Map<TranslationKey, Set<ContextPath>>>
replaceAllL10nKeyReferencesInCodebaseForBabelFunctions({
  required L10nProjectConfig projectConfig,
  required String projectName,
  required Map<L10nKey, ProcessedKeyIntegrity> remapedArbKeys,
  required List<File> targetFiles,
  required Map<TranslationKey, BabelFunctionImplementation>
  curentKeyToImplementation,
  required Map<TranslationKey, Set<ContextPath>> currentKeyToContextsPaths,
  required String directoryPath,
  required Map<TranslationKey, Set<VariableName>> variablesPlaceholdersPerKey,
}) async {
  final L10nProjectConfigWithData? projectConfigWithData = projectConfig
      .mapOrNull(withData: (value) => value);
  if (projectConfigWithData == null) {
    return currentKeyToContextsPaths.toSuccess();
  }
  final Map<TranslationKey, Set<ContextPath>> keyToContextsPaths = {
    ...currentKeyToContextsPaths,
  };
  final String outputClass = projectConfigWithData.outputClass;

  // The index 0 will be the one with the biggest length
  final ordoredKeysByBiggestLenghtFirst = remapedArbKeys.keys.toList()
    ..sort((a, b) => b.length.compareTo(a.length));
  // Split into groups of 20 to avoid overwhelming the regex engine
  // This is a heuristic to balance performance and complexity
  final clusteredRemapedArbs = ordoredKeysByBiggestLenghtFirst.splitIntoGroups(
    20,
  );

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
      final bool hadFlutterGenDependencyChange =
          hasImportChanges || hasDelegateChanges;

      // Clean up any multiple consecutive newlines left after removal
      if (hadFlutterGenDependencyChange) {
        fileContent = fileContent.replaceAll(RegExp(r'\n\n\n+'), '\n\n');
      }
      bool hasChanges = hadFlutterGenDependencyChange;

      // Replace L10n references with Babel implementations
      final replacementResult = replaceL10nReferencesWithBabel(
        fileContent: fileContent,
        outputClass: outputClass,
        clusteredRemapedArbs: clusteredRemapedArbs,
        remapedArbKeys: remapedArbKeys,
        variablesPlaceholdersPerKey: variablesPlaceholdersPerKey,
      );

      fileContent = replacementResult.content;
      hasChanges = hasChanges || replacementResult.hasChanges;

      if (hasChanges) {
        final fileContentWithImport = addImportIfNeededUsecase(
          projectName: projectName,
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
      ConsoleManager.instance.error('Error processing file "${file.path}": $e', id: 'error_processing_file');
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

  return keyToContextsPaths.toSuccess();
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
  final ArbDataStateWithData? arbData = payload.projectArbData.mapOrNull(
    withData: (value) => value,
  );
  if (projectConfig == null || arbData == null) {
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
    projectName: payload.yamlInfo.projectName,
    remapedArbKeys: payload.remapedArbKeys,
    targetFiles: await payload.filesToBeAnalysed,
    currentKeyToContextsPaths:
        payload.hardcodedStringsPayloadInfo.keyToContextsPaths,
    curentKeyToImplementation:
        payload.hardcodedStringsPayloadInfo.keyToImplementation,
    directoryPath: payload.directoryPath,
    variablesPlaceholdersPerKey: arbData.variablesPlaceholdersPerKey,
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
      codebaseArbTranslationPayloadInfo: payload.hardcodedStringsPayloadInfo
          .copyWith(keyToContextsPaths: response),
      remapedArbKeys: payload.remapedArbKeys,
      hardcodedStringsPayloadInfo: payload.hardcodedStringsPayloadInfo,
      hardcodedStringsPerFile: payload.hardcodedStringsPerFile,
    ).toSuccess();
  });
}
