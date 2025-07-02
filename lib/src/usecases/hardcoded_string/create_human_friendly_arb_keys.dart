// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/core/extensions/result.dart';
import 'package:gobabel/src/core/utils/cripto.dart';
import 'package:gobabel/src/core/utils/loading_indicator.dart';
import 'package:gobabel/src/models/extract_hardcode_string/hardcoded_string_entity.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

@override
AsyncBabelResult<HumanFriendlyResponse>
createHumanFriendlyArbKeysWithAiOnServerUsecaseImpl({
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
          LoadingIndicator.instance.setLoadingState(
            message: 'Creating human-friendly ARB keys...',
            totalCount: groups.length,
            step: i + 1,
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
      LoadingIndicator.instance.dispose();
    } else {
      LoadingIndicator.instance.setLoadingState(
        message: 'Creating human-friendly ARB keys...',
        totalCount: 1,
        step: 1,
        barProgressInfo: null,
      );
      await function();
      LoadingIndicator.instance.dispose();
    }

    // await saveStringData(combinedResults, 'combinedresults.json');

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

  String toJson() => json.encode(toMap());
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
}
