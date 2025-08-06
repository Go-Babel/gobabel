// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/extract_hardcode_string/babel_label_entity.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:path/path.dart' as p;
import 'package:result_dart/result_dart.dart';

class ResolveProjectHardcodedStrings {
  final TranslationPayloadInfo hardcodedStringsPayloadInfo;
  final Map<FilePath, List<BabelLabelEntityRootLabel>> hardcodedStringsPerFile;
  const ResolveProjectHardcodedStrings({
    required this.hardcodedStringsPayloadInfo,
    required this.hardcodedStringsPerFile,
  });
}

AsyncBabelResult<GenerateFlowResolvedHardcodedStrings>
generate_resolveCodebaseHardcodedStringsProject(
  GenerateFlowMappedBabelLabels payload,
) async {
  try {
    // Step 6: Final aggregation of all processed data
    final Map<HardCodedString, TranslationKey> hardcodedStringToKeyCache = {
      ...payload.codebaseArbTranslationPayloadInfo.hardcodedStringToKeyCache,
    };
    final Map<TranslationKey, BabelFunctionDeclaration> keyToDeclaration = {
      ...payload.codebaseArbTranslationPayloadInfo.keyToDeclaration,
    };
    final Map<TranslationKey, BabelFunctionImplementation> keyToImplementation =
        {...payload.codebaseArbTranslationPayloadInfo.keyToImplementation};
    final Map<TranslationKey, Set<ContextPath>> keyToContextsPaths = {
      ...payload.codebaseArbTranslationPayloadInfo.keyToContextsPaths,
    };
    final Map<BabelSupportedLocales, Map<L10nKey, L10nValue>> referenceMap = {};
    for (final Translatables element
        in payload.codebaseArbTranslationPayloadInfo.referenceMap) {
      // Create a mutable copy of the reference map to avoid unmodifiable map errors
      referenceMap[element.locale] = Map<L10nKey, L10nValue>.from(
        element.referenceMap,
      );
    }

    // Add the new hardcoded string key cache from human friendly response
    for (final entry
        in payload.humanFriendlyResponse.newHardcodedStringKeyCache.entries) {
      hardcodedStringToKeyCache[entry.key] = entry.value;
    }

    // Initialize reference map for input locale if not exists
    if (referenceMap[payload.inputedByUserLocale] == null) {
      referenceMap[payload.inputedByUserLocale] = {};
    }

    // Map the babel labels to file paths
    Map<FilePath, List<BabelLabelEntityRootLabel>> allHardcodedStrings =
        <FilePath, List<BabelLabelEntityRootLabel>>{};

    for (final babelLabel in payload.babelLabels) {
      final filePath = babelLabel.filePath;
      if (allHardcodedStrings[filePath] == null) {
        allHardcodedStrings[filePath] = [];
      }
      allHardcodedStrings[filePath]!.add(babelLabel);
    }

    // Sort the entries by startIndex. The first should be the biggest index,
    // the last should be the smallest index
    allHardcodedStrings.forEach((key, value) {
      value.sort((a, b) => b.fileStartIndex.compareTo(a.fileStartIndex));
    });

    // Add all declarations and implementations to the payload info
    for (final babelLabel in payload.babelLabels) {
      final translationKey = babelLabel.l10nKey;
      final translationValue = babelLabel.l10nValue;
      keyToDeclaration[translationKey] = babelLabel.babelFunctionDeclaration;
      keyToImplementation[translationKey] =
          babelLabel.babelFunctionImplementation;

      // Convert absolute path to relative path from project root
      final relativePath = p.relative(
        babelLabel.filePath,
        from: payload.directoryPath,
      );

      if (keyToContextsPaths.containsKey(translationKey)) {
        keyToContextsPaths[translationKey]!.add(relativePath);
      } else {
        keyToContextsPaths[translationKey] = {relativePath};
      }

      referenceMap[payload.inputedByUserLocale]!.addAll({
        translationKey: translationValue,
      });
    }

    return GenerateFlowResolvedHardcodedStrings(
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
      remapedArbKeys: payload.remapedArbKeys,
      codebaseArbTranslationPayloadInfo:
          payload.codebaseArbTranslationPayloadInfo,
      hardcodedStringsPayloadInfo: TranslationPayloadInfo(
        hardcodedStringToKeyCache: hardcodedStringToKeyCache,
        keyToDeclaration: keyToDeclaration,
        keyToImplementation: keyToImplementation,
        keyToContextsPaths: keyToContextsPaths,
        referenceMap:
            referenceMap.entries.map(Translatables.fromEntries).toList(),
      ),
      hardcodedStringsPerFile: allHardcodedStrings,
    ).toSuccess();
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Failed to resolve codebase project',
        description:
            'An error occurred while aggregating hardcoded strings data. Please check your project files and try again',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }
}
