// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/extract_hardcode_string/babel_label_entity.dart';
import 'package:gobabel/src/models/extract_hardcode_string/hardcoded_string_entity.dart';
import 'package:gobabel/src/models/extract_hardcode_string/labels_entity.dart';
import 'package:gobabel/src/usecases/hardcoded_string/create_human_friendly_arb_keys.dart';
import 'package:gobabel/src/usecases/hardcoded_string/define_which_string_label.dart';
import 'package:gobabel/src/usecases/hardcoded_string/extract_all_hardcoded_strings.dart';
import 'package:gobabel/src/usecases/hardcoded_string/map_babel_labels.dart';
import 'package:gobabel/src/usecases/hardcoded_string/map_strings_hierarchy.dart';
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

AsyncBabelResult<ResolveProjectHardcodedStrings> resolveCodebaseProject({
  required Client client,
  required bool generateLogs,
  required String projectApiToken,
  required BigInt projectShaIdentifier,
  required BabelSupportedLocales inputedByUserLocale,
  required List<File> targetFiles,
  required TranslationPayloadInfo currentPayloadInfo,
}) async {
  try {
    final Map<HardCodedString, TranslationKey> hardcodedStringToKeyCache = {
      ...currentPayloadInfo.hardcodedStringToKeyCache,
    };
    final Map<TranslationKey, BabelFunctionDeclaration> keyToDeclaration = {
      ...currentPayloadInfo.keyToDeclaration,
    };
    final Map<TranslationKey, BabelFunctionImplementation> keyToImplementation =
        {...currentPayloadInfo.keyToImplementation};
    final Map<TranslationKey, Set<ContextPath>> keyToContextsPaths = {
      ...currentPayloadInfo.keyToContextsPaths,
    };
    final Map<BabelSupportedLocales, Map<L10nKey, L10nValue>> referenceMap = {};
    for (final Translatables element in currentPayloadInfo.referenceMap) {
      referenceMap[element.locale] = element.referenceMap;
    }

    // 1. Extract all strings from the files
    final extractResult = await extractAllStringsInDart(files: targetFiles);
    LoadingIndicator.instance.dispose();
    if (extractResult.isError()) {
      return extractResult.asBabelResultErrorAsync();
    }
    final List<HardcodedStringEntity> allStrings = extractResult.getOrThrow();
    final bool noneOrResolverResolvedAnyString =
        allStrings.isEmpty && hardcodedStringToKeyCache.isEmpty;

    // Everything is empty, there is no point in running the cli since there is nothing to resolve.
    // No string to work on, not from arb or from hardcoded strings.
    if (noneOrResolverResolvedAnyString) {
      return BabelFailureResponse.onlyBabelException(
        exception: BabelException(
          title: 'No hardcoded strings found',
          description:
              'No hardcoded strings were found in the provided files. Please check your codebase and try again.',
        ),
      ).toFailure();
    }

    if (allStrings.isEmpty) {
      return Success(
        ResolveProjectHardcodedStrings(
          hardcodedStringsPerFile: {},
          hardcodedStringsPayloadInfo: TranslationPayloadInfo(
            hardcodedStringToKeyCache: hardcodedStringToKeyCache,
            keyToDeclaration: keyToDeclaration,
            keyToImplementation: keyToImplementation,
            keyToContextsPaths: keyToContextsPaths,
            referenceMap:
                referenceMap.entries.map(Translatables.fromEntries).toList(),
          ),
        ),
      );
    }

    if (generateLogs) {
      await saveStringListData(
        allStrings.map((s) => s.toMap()).toList(),
        'step_1.json',
      );
    }

    // 2. Define which strings are labels
    final labelStringsResult = await defineWhichStringLabel(
      client: client,
      strings: allStrings,
      projectApiToken: projectApiToken,
      projectShaIdentifier: projectShaIdentifier,
    );
    if (labelStringsResult.isError()) {
      return labelStringsResult.asBabelResultErrorAsync();
    }
    final labelStrings = labelStringsResult.getOrThrow();

    if (generateLogs) {
      await saveStringListData(
        labelStrings.map((s) => s.toMap()).toList(),
        'step_2.json',
      );
    }

    // 3. Create human-friendly ARB keys
    final humanFriendlyResult = await createHumanFriendlyArbKeysWithAiOnServer(
      client: client,
      strings: labelStrings,
      projectApiToken: projectApiToken,
      projectShaIdentifier: projectShaIdentifier,
      projectHardcodedStringKeyCache: hardcodedStringToKeyCache,
    );
    if (humanFriendlyResult.isError()) {
      return humanFriendlyResult.asBabelResultErrorAsync();
    }
    final humanFriendlyResponse = humanFriendlyResult.getOrThrow();

    final keyedStrings = humanFriendlyResponse.humanFriendlyArbKeys;
    final Map<HardCodedString, TranslationKey> newHardcodedStringKeyCache =
        humanFriendlyResponse.newHardcodedStringKeyCache;

    for (final entry in newHardcodedStringKeyCache.entries) {
      hardcodedStringToKeyCache[entry.key] = entry.value;
    }

    if (generateLogs) {
      await saveStringListData(
        keyedStrings.map((k) => k.toMap()).toList(),
        'step_3.json',
      );
    }

    // 4. Map strings hierarchy
    final labelEntitiesResult = await mapStringsHierarchy(
      strings: keyedStrings,
    );
    if (labelEntitiesResult.isError()) {
      return labelEntitiesResult.asBabelResultErrorAsync();
    }
    final List<LabelsEntityRootLabel> labelEntities =
        labelEntitiesResult.getOrThrow();
    if (generateLogs) {
      await saveStringListData(
        labelEntities.map((e) => e.toJson()).toList(),
        'step_4.json',
      );
    }

    // 5. Map to babel labels models
    final babelLabelsResult = await mapBabelLabels(
      strings: labelEntities,
      keyToDeclaration: keyToDeclaration,
      keyToImplementation: keyToImplementation,
    );
    if (babelLabelsResult.isError()) {
      return babelLabelsResult.asBabelResultErrorAsync();
    }
    final List<BabelLabelEntityRootLabel> babelLabels =
        babelLabelsResult.getOrThrow();

    Map<FilePath, List<BabelLabelEntityRootLabel>> allHardcodedStrings =
        <FilePath, List<BabelLabelEntityRootLabel>>{};

    for (final babelLabel in babelLabels) {
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

    if (generateLogs) {
      await saveStringListData(
        babelLabels.map((label) => label.toJson()).toList(),
        'step_5.json',
      );
    }

    if (referenceMap[inputedByUserLocale] == null) {
      referenceMap[inputedByUserLocale] = {};
    }

    // 6. Add all declarations and implementations to the payload info
    for (final babelLabel in babelLabels) {
      final translationKey = babelLabel.l10nKey;
      final translationValue = babelLabel.l10nValue;
      keyToDeclaration[translationKey] = babelLabel.babelFunctionDeclaration;
      keyToImplementation[translationKey] =
          babelLabel.babelFunctionImplementation;

      if (keyToContextsPaths.containsKey(translationKey)) {
        keyToContextsPaths[translationKey]!.add(babelLabel.filePath);
      } else {
        keyToContextsPaths[translationKey] = {babelLabel.filePath};
      }

      referenceMap[inputedByUserLocale]!.addAll({
        translationKey: translationValue,
      });
    }

    return Success(
      ResolveProjectHardcodedStrings(
        hardcodedStringsPerFile: allHardcodedStrings,
        hardcodedStringsPayloadInfo: TranslationPayloadInfo(
          hardcodedStringToKeyCache: hardcodedStringToKeyCache,
          keyToDeclaration: keyToDeclaration,
          keyToImplementation: keyToImplementation,
          keyToContextsPaths: keyToContextsPaths,

          referenceMap:
              referenceMap.entries.map(Translatables.fromEntries).toList(),
        ),
      ),
    );
  } catch (error, stackTrace) {
    return BabelFailureResponse.withErrorAndStackTrace(
      exception: BabelException(
        title: 'Failed to resolve codebase project',
        description:
            'An error occurred while analyzing and extracting hardcoded strings from your codebase. Please check your project files and try again',
      ),
      error: error,
      stackTrace: stackTrace,
    ).toFailure();
  }
}

/// Saves data to a JSON file
Future<void> saveStringListData(
  List<Map<String, dynamic>> data,
  String fileName,
) async {
  final outFile = File(p.join(Directory.current.path, fileName));
  await outFile.writeAsString(JsonEncoder.withIndent('  ').convert(data));
}

/// Saves data to a JSON file
Future<void> saveStringData(Map<String, dynamic> data, String fileName) async {
  final outFile = File(p.join(Directory.current.path, fileName));
  await outFile.writeAsString(JsonEncoder.withIndent('  ').convert(data));
}

AsyncBabelResult<GenerateFlowResolvedHardcodedStrings>
generate_resolveCodebaseHardcodedStringsProject(
  GenerateFlowCodebaseNormalized payload,
) async {
  final client = payload.client.server;
  final generateLogs = payload.willLog;
  final projectApiToken = payload.projectApiToken;
  final projectShaIdentifier = payload.gitVariables.projectShaIdentifier;
  final targetFiles = await payload.filesToBeAnalysed;
  final currentPayloadInfo = payload.codebaseArbTranslationPayloadInfo;

  return resolveCodebaseProject(
    client: client,
    generateLogs: generateLogs,
    projectApiToken: projectApiToken,
    projectShaIdentifier: projectShaIdentifier,
    inputedByUserLocale: payload.inputedByUserLocale,
    targetFiles: targetFiles,
    currentPayloadInfo: currentPayloadInfo,
  ).flatMap((hardcodedStringsPayloadInfo) {
    return GenerateFlowResolvedHardcodedStrings(
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
      hardcodedStringsPayloadInfo:
          hardcodedStringsPayloadInfo.hardcodedStringsPayloadInfo,
      hardcodedStringsPerFile:
          hardcodedStringsPayloadInfo.hardcodedStringsPerFile,
    ).toSuccess();
  });
}
