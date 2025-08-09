import 'dart:io';

import 'package:enchanted_collection/enchanted_collection.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/utils/console_manager.dart';
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

/// Extracts the import alias from the file content for the given import string.
/// Returns empty string if no alias is found.
@visibleForTesting
String extractImportAlias({
  required String fileContent,
  required String importString,
}) {
  // Pattern to match import with alias
  final aliasPattern = RegExp(
    "import\\s+['\"]${RegExp.escape(importString)}['\"]\\s+as\\s+(\\w+)",
    multiLine: true,
  );

  final match = aliasPattern.firstMatch(fileContent);
  if (match != null) {
    return match.group(1) ?? '';
  }

  return '';
}

/// Removes localizationsDelegates entries for the project's outputClass.
/// Returns a tuple of (modifiedContent, hasChanges).
@visibleForTesting
(String content, bool hasChanges) removeLocalizationsDelegatesIfNeeded({
  required String fileContent,
  required L10nProjectConfigWithData projectConfig,
  required String projectName,
}) {
  // Quick check if file contains localizationsDelegates
  if (!fileContent.contains('localizationsDelegates')) {
    return (fileContent, false);
  }

  // Get the import string and extract alias if any
  final importString = projectConfig.getImportString(projectName);
  final alias = extractImportAlias(
    fileContent: fileContent,
    importString: importString,
  );

  // Build the delegate reference pattern
  String delegateReference;
  if (alias.isNotEmpty) {
    // With alias: alias.OutputClass.delegate or alias.OutputClass.localizationsDelegates
    delegateReference =
        RegExp.escape(alias) +
        r'\.' +
        RegExp.escape(projectConfig.outputClass) +
        r'\.(localizationsDelegates|delegates?)';
  } else {
    // Without alias: OutputClass.delegate or OutputClass.localizationsDelegates
    // Make sure it's not prefixed by another identifier (negative lookbehind)
    delegateReference =
        r'(?<![a-zA-Z_]\.)' +
        RegExp.escape(projectConfig.outputClass) +
        r'\.(localizationsDelegates|delegates?)';
  }

  // Use regex-based approach directly as it's more reliable
  return _removeWithRegex(
    fileContent: fileContent,
    delegateReference: delegateReference,
    projectConfig: projectConfig,
  );
}

/// Regex-based approach for removing delegates
(String content, bool hasChanges) _removeWithRegex({
  required String fileContent,
  required String delegateReference,
  required L10nProjectConfigWithData projectConfig,
}) {
  String result = fileContent;
  bool hasChanges = false;

  // Pattern for spread operator with delegates including comma and whitespace
  final spreadPattern = RegExp(
    r'\.\.\.(' + delegateReference + r')(\s*,)?(\s*\n)?',
    multiLine: true,
  );

  // Pattern for direct reference including comma and whitespace
  final directPattern = RegExp(
    r'(' + delegateReference + r')(\s*,)?(\s*\n)?',
    multiLine: true,
  );

  // First handle spread operator references
  if (spreadPattern.hasMatch(result)) {
    result = result.replaceAllMapped(spreadPattern, (match) {
      hasChanges = true;
      // Keep newline if it exists to preserve formatting
      return match.group(3) ?? '';
    });
  }

  // Then handle direct references (but not those that are part of spread)
  if (!delegateReference.contains('...') && directPattern.hasMatch(result)) {
    result = result.replaceAllMapped(directPattern, (match) {
      // Check this isn't part of a spread operator we missed
      final fullMatch = match.group(0)!;
      final startIndex = match.start;
      if (startIndex >= 3 &&
          result.substring(startIndex - 3, startIndex) == '...') {
        return fullMatch; // Don't remove, it's part of spread
      }
      hasChanges = true;
      // Keep newline if it exists
      return match.group(3) ?? '';
    });
  }

  if (hasChanges) {
    result = _cleanupEmptyArraysAndCommas(result);
  }

  return (result, hasChanges);
}

/// Cleans up empty arrays and trailing commas after removal
String _cleanupEmptyArraysAndCommas(String content) {
  // Remove empty arrays
  content = content.replaceAll(
    RegExp(r'localizationsDelegates\s*:\s*\[\s*\]'),
    '',
  );
  content = content.replaceAll(
    RegExp(r'localizationsDelegates\s*:\s*const\s*\[\s*\]'),
    '',
  );

  // Clean up double commas
  content = content.replaceAll(RegExp(r',\s*,'), ',');

  // Clean up trailing commas before closing brackets
  content = content.replaceAll(RegExp(r',\s*\]'), ']');
  content = content.replaceAll(RegExp(r',\s*\)'), ')');

  // Clean up multiple newlines
  content = content.replaceAll(RegExp(r'\n\s*\n\s*\n+'), '\n\n');

  return content;
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
    30,
  );
  print('biggestOne: ${ordoredKeysByBiggestLenghtFirst.first}');
  print('smallestOne: ${ordoredKeysByBiggestLenghtFirst.last}');

  final String projectName = codeBaseYamlInfo.projectName;

  for (final file in targetFiles) {
    try {
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
        caseSensitive: false,
        multiLine: true,
      );
      bool hasChanges = hasImportChanges || hasDelegateChanges;
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
          kBabelClass + r'\s*\.\s*' + '($variableNamesIdentifiers)\b',
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

        // Calculate relative path from directoryPath to the file
        final relativePath = file.path.startsWith(directoryPath)
            ? file.path.substring(directoryPath.length).replaceFirst(RegExp(r'^[/\\]'), '')
            : file.path;

        final fixResultAsync = await runBabelProcess(
          command: 'dart fix --apply "$relativePath"',
          dirrPath: directoryPath,
        );

        if (fixResultAsync.isError()) {
          return Failure(fixResultAsync.exceptionOrNull()!);
        }
      }
    } catch (e) {
      // Log error but continue processing other files
      ConsoleManager.instance.error('Error processing file ${file.path}: $e');
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
