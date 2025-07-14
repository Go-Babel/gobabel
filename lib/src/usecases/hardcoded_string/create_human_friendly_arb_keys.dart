// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/core/utils/cripto.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/models/extract_hardcode_string/hardcoded_string_entity.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:path/path.dart' as p;
import 'package:result_dart/result_dart.dart';

@override
AsyncBabelResult<HumanFriendlyResponse>
createHumanFriendlyArbKeysWithAiOnServer({
  required Client client,
  required List<HardcodedStringEntity> strings,
  required String projectApiToken,
  required BigInt projectShaIdentifier,
  required Map<HardCodedString, TranslationKey> projectHardcodedStringKeyCache,
}) async {
  if (strings.isEmpty) {
    return HumanFriendlyResponse(
      newHardcodedStringKeyCache: {},
      humanFriendlyArbKeys: [],
    ).toSuccess();
  }

  final List<HumanFriendlyArbKeyResponse> keyMap = [];

  // Separate strings that are already in cache vs need to be generated
  final List<HardcodedStringEntity> stringsNeedingGeneration = [];

  for (final string in strings) {
    final cachedKey =
        projectHardcodedStringKeyCache[string.value.trimHardcodedString];
    if (cachedKey != null) {
      // Use cached key
      keyMap.add(HumanFriendlyArbKeyResponse(key: cachedKey, value: string));
    } else {
      // Need to generate key
      stringsNeedingGeneration.add(string);
    }
  }

  final Map<HardCodedString, TranslationKey> newHardcodedStringKeyCache = {};

  // Only generate keys for strings not in cache
  if (stringsNeedingGeneration.isNotEmpty) {
    // Create a map of SHA1 keys to string values for strings needing generation
    final Map<L10nValue, Sha1> shaMap = {};
    final Map<Sha1, L10nValue> extractedStrings = {};
    for (final HardcodedStringEntity string in stringsNeedingGeneration) {
      final sha1Result = await generateSha1(string.value);
      if (sha1Result.isError()) {
        return sha1Result.asBabelResultErrorAsync();
      }
      final key = sha1Result.getOrNull()!;
      extractedStrings[key] = string.value.trimHardcodedString;
      shaMap[string.value] = key;
    }

    // Split the strings into manageable groups for API requests
    final groups = splitIntoManageableGroupsForApi(extractedStrings);

    // Process each group and combine results
    final Map<Sha1, TranslationKey> combinedResults = {};
    final bool isSmallAmountOfStrings = groups.length <= 2;
    final bool willHaveProgressBar = !isSmallAmountOfStrings;

    // Progress bar will be shown for larger datasets

    Future<void> function() async {
      for (int i = 0; i < groups.length; i++) {
        final group = groups[i];
        if (willHaveProgressBar) {
          LoadingIndicator.instance.setLoadingProgressBar(
            message: 'Creating human-friendly ARB keys...',
            barProgressInfo: BarProgressInfo(
              message: 'Replacing hardcoded strings...',
              totalSteps: groups.length,
              currentStep: i + 1,
            ),
          );
        }
        // Call the server endpoint to generate ARB keys
        final Map<Sha1, TranslationKey> result = await client.publicArbHelpers
            .createArbKeyNames(
              projectApiToken: projectApiToken,
              projectShaIdentifier: projectShaIdentifier,
              translationContents: group,
            );

        // Add results to the combined results map
        combinedResults.addAll({
          for (final entry in result.entries) entry.key: entry.value,
        });
      }
    }

    if (willHaveProgressBar) {
      await function();
    }

    // Process the generated keys
    for (final string in stringsNeedingGeneration) {
      final sha1 = shaMap[string.value]!;
      final key = combinedResults[sha1]!;

      // Ensure the key is unique and follows the camelCase format
      final garantedKeyIntegrityResponse = await garanteeKeyIntegrity(
        key: key.trim(),
        value: string.value.trimHardcodedString,
      );
      if (garantedKeyIntegrityResponse.isError()) {
        return garantedKeyIntegrityResponse.asBabelResultErrorAsync();
      }
      final ProcessedKeyIntegrity garantedKeyIntegrity =
          garantedKeyIntegrityResponse.getOrThrow();

      final camelCaseKey = garantedKeyIntegrity;
      if (camelCaseKey.isEmpty) {
        return BabelFailureResponse.onlyBabelException(
          exception: BabelException(
            title: 'Empty ARB key generated',
            description:
                'The AI generated an empty key for the string "${string.value}". '
                'This might happen with strings that contain only special characters or numbers. '
                'Please check the string content and try again.',
          ),
        ).toFailure();
      }
      keyMap.add(HumanFriendlyArbKeyResponse(key: camelCaseKey, value: string));
      newHardcodedStringKeyCache[string.value] = camelCaseKey;
    }
  }

  return HumanFriendlyResponse(
    newHardcodedStringKeyCache: newHardcodedStringKeyCache,
    humanFriendlyArbKeys: keyMap,
  ).toSuccess();
}

class HumanFriendlyArbKeyResponse {
  final TranslationKey key;
  final HardcodedStringEntity value;

  const HumanFriendlyArbKeyResponse({required this.key, required this.value});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'key': key, 'value': value.toMap()};
  }

  factory HumanFriendlyArbKeyResponse.fromMap(Map<String, dynamic> map) {
    return HumanFriendlyArbKeyResponse(
      key: map['key'] as String,
      value: HardcodedStringEntity.fromMap(
        map['value'] as Map<String, dynamic>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory HumanFriendlyArbKeyResponse.fromJson(Map<String, dynamic> json) =>
      HumanFriendlyArbKeyResponse.fromMap(json);
}

class HumanFriendlyResponse {
  final Map<HardCodedString, TranslationKey> newHardcodedStringKeyCache;
  final List<HumanFriendlyArbKeyResponse> humanFriendlyArbKeys;
  const HumanFriendlyResponse({
    required this.newHardcodedStringKeyCache,
    required this.humanFriendlyArbKeys,
  });

  @override
  bool operator ==(covariant HumanFriendlyResponse other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return collectionEquals(
          other.newHardcodedStringKeyCache,
          newHardcodedStringKeyCache,
        ) &&
        collectionEquals(other.humanFriendlyArbKeys, humanFriendlyArbKeys);
  }

  @override
  int get hashCode =>
      newHardcodedStringKeyCache.hashCode ^ humanFriendlyArbKeys.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'newHardcodedStringKeyCache': newHardcodedStringKeyCache,
      'humanFriendlyArbKeys':
          humanFriendlyArbKeys.map((e) => e.toMap()).toList(),
    };
  }

  factory HumanFriendlyResponse.fromMap(Map<String, dynamic> map) {
    return HumanFriendlyResponse(
      newHardcodedStringKeyCache: Map<String, String>.from(
        map['newHardcodedStringKeyCache'] as Map<dynamic, dynamic>,
      ),
      humanFriendlyArbKeys:
          (map['humanFriendlyArbKeys'] as List<dynamic>)
              .map(
                (e) => HumanFriendlyArbKeyResponse.fromMap(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory HumanFriendlyResponse.fromJson(Map<String, dynamic> json) =>
      HumanFriendlyResponse.fromMap(json);
}

AsyncBabelResult<GenerateFlowCreatedHumanFriendlyArbKeys>
generate_createHumanFriendlyArbKeysWithAiOnServer(
  GenerateFlowDefinedStringLabels payload,
) async {
  final hardcodedStringKeyCache =
      payload.codebaseArbTranslationPayloadInfo.hardcodedStringToKeyCache;

  final humanFriendlyResult = await createHumanFriendlyArbKeysWithAiOnServer(
    client: payload.client.server,
    strings: payload.labelStrings,
    projectApiToken: payload.projectApiToken,
    projectShaIdentifier: payload.gitVariables.projectShaIdentifier,
    projectHardcodedStringKeyCache: hardcodedStringKeyCache,
  );

  if (humanFriendlyResult.isError()) {
    return humanFriendlyResult.asBabelResultErrorAsync();
  }

  final humanFriendlyResponse = humanFriendlyResult.getOrThrow();

  // Save logs if requested
  if (payload.willLog) {
    await _saveStringListData(
      humanFriendlyResponse.humanFriendlyArbKeys.map((k) => k.toMap()).toList(),
      'step_3.json',
    );
  }

  return GenerateFlowCreatedHumanFriendlyArbKeys(
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
    remapedArbKeys: payload.remapedArbKeys,
    codebaseArbTranslationPayloadInfo:
        payload.codebaseArbTranslationPayloadInfo,
    allExtractedStrings: payload.allExtractedStrings,
    labelStrings: payload.labelStrings,
    humanFriendlyResponse: humanFriendlyResponse,
  ).toSuccess();
}

/// Saves data to a JSON file
Future<void> _saveStringListData(
  List<Map<String, dynamic>> data,
  String fileName,
) async {
  final outFile = File(p.join(Directory.current.path, fileName));
  await outFile.writeAsString(JsonEncoder.withIndent('  ').convert(data));
}
