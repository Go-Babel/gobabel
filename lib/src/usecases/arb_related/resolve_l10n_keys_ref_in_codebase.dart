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

      // Remove l10n-related imports based on outputDir and project name
      final escapedOutputDir = RegExp.escape(projectConfigWithData.outputDir);
      final projectName = codeBaseYamlInfo.projectName;

      // Pattern to match package imports from the current project only
      // This will match patterns like:
      // - import 'package:scoutbox/gen_l10n/s.dart';
      // - import 'package:scoutbox/gen_l10n/s.dart' as arb;
      // - import 'package:scoutbox/gen_l10n/app_localizations.dart' show AppLocalizations;
      // But NOT: import 'package:other_package/gen_l10n/s.dart';
      final packageImportPattern = RegExp(
        "import\\s+['\"]package:$projectName/$escapedOutputDir/[^'\"]+\\.dart['\"][^;\\n]*;?\\s*\\n?",
        multiLine: true,
      );

      // Pattern for relative imports (these are always from the current project)
      // This will match patterns like:
      // - import '../gen_l10n/s.dart';
      // - import './gen_l10n/s.dart' as arb;
      // - import '../../gen_l10n/app_localizations.dart' show AppLocalizations;
      final relativeImportPattern = RegExp(
        "import\\s+['\"]\\.\\.?/[^'\"]*$escapedOutputDir/[^'\"]+\\.dart['\"][^;\\n]*;?\\s*\\n?",
        multiLine: true,
      );

      bool hasImportChanges = false;

      // Remove package imports from the current project only
      if (packageImportPattern.hasMatch(fileContent)) {
        fileContent = fileContent.replaceAll(packageImportPattern, '');
        hasImportChanges = true;
      }

      // Remove relative imports
      if (relativeImportPattern.hasMatch(fileContent)) {
        fileContent = fileContent.replaceAll(relativeImportPattern, '');
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
