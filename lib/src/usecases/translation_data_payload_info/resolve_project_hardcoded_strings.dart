// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:gobabel/src/core/legacy_spinner_loading.dart';
import 'package:gobabel/src/entities/translation_payload_info.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/extract_hardcode_string/babel_label_entity.dart';
import 'package:gobabel/src/models/extract_hardcode_string/hardcoded_string_entity.dart';
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

AsyncResult<ResolveProjectHardcodedStrings>
// AsyncResult<Map<FilePath, List<BabelLabelEntityRootLabel>>>
resolveCodebaseProject({
  required Client client,
  required bool generateLogs,
  required String projectApiToken,
  required BigInt projectShaIdentifier,
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

    // 1. Extract all strings from the files
    final List<HardcodedStringEntity> allStrings;
    final extractResult = await legacyRunWithSpinner(
      successMessage: 'Extracted strings from ${targetFiles.length} files',
      message: 'Extracting strings from ${targetFiles.length} files...',
      () async {
        return await extractAllStringsInDartUsecaseImpl(files: targetFiles);
      },
    );
    if (extractResult.isError()) {
      return extractResult.asError();
    }
    allStrings = extractResult.getOrThrow();

    if (generateLogs) {
      await saveStringListData(
        allStrings.map((s) => s.toMap()).toList(),
        'step_1.json',
      );
    }

    // 2. Define which strings are labels
    final labelStringsResult = await defineWhichStringLabelUsecase(
      client: client,
      strings: allStrings,
      projectApiToken: projectApiToken,
      projectShaIdentifier: projectShaIdentifier,
    );
    if (labelStringsResult.isError()) {
      return labelStringsResult.asError();
    }
    final labelStrings = labelStringsResult.getOrThrow();

    if (generateLogs) {
      await saveStringListData(
        labelStrings.map((s) => s.toMap()).toList(),
        'step_2.json',
      );
    }

    // 3. Create human-friendly ARB keys
    final humanFriendlyResult =
        await createHumanFriendlyArbKeysWithAiOnServerUsecaseImpl(
          client: client,
          strings: labelStrings,
          projectApiToken: projectApiToken,
          projectShaIdentifier: projectShaIdentifier,
          projectHardcodedStringKeyCache: hardcodedStringToKeyCache,
        );
    if (humanFriendlyResult.isError()) {
      return humanFriendlyResult.asError();
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
      return labelEntitiesResult.asError();
    }
    final labelEntities = labelEntitiesResult.getOrThrow();
    if (generateLogs) {
      print('Created hierarchy with ${labelEntities.length} root labels');
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
      return babelLabelsResult.asError();
    }
    final babelLabels = babelLabelsResult.getOrThrow();

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

    // 6. Add all declarations and implementations to the payload info
    for (final babelLabel in babelLabels) {
      final translationKey = babelLabel.l10nKey;
      keyToDeclaration[translationKey] = babelLabel.babelFunctionDeclaration;
      keyToImplementation[translationKey] =
          babelLabel.babelFunctionImplementation;

      if (keyToContextsPaths.containsKey(translationKey)) {
        keyToContextsPaths[translationKey]!.add(babelLabel.filePath);
      } else {
        keyToContextsPaths[translationKey] = {babelLabel.filePath};
      }
    }

    return Success(
      ResolveProjectHardcodedStrings(
        hardcodedStringsPerFile: allHardcodedStrings,
        hardcodedStringsPayloadInfo: TranslationPayloadInfo(
          hardcodedStringToKeyCache: hardcodedStringToKeyCache,
          keyToDeclaration: keyToDeclaration,
          keyToImplementation: keyToImplementation,
          keyToContextsPaths: keyToContextsPaths,
        ),
      ),
    );
  } catch (e) {
    return Exception('Error resolving codebase project: $e').toFailure();
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

AsyncResult<GenerateFlowResolvedHardcodedStrings>
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
      downloadLink: payload.downloadLink,
      referenceArbMap: payload.referenceArbMap,
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
