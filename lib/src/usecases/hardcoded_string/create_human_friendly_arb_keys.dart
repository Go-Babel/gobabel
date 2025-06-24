// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:console_bars/console_bars.dart';
import 'package:gobabel/src/core/legacy_spinner_loading.dart';
import 'package:gobabel/src/core/utils/cripto.dart';
import 'package:gobabel/src/models/extract_hardcode_string/hardcoded_string_entity.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

@override
AsyncResult<HumanFriendlyResponse>
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
      final key = generateSha1(string.value);
      extractedStrings[key] = string.value.trimHardcodedString;
      shaMap[string.value] = key;
    }

    // Split the strings into manageable groups for API requests
    final groups = splitIntoManageableGroupsForApi(extractedStrings);

    // Process each group and combine results
    final Map<Sha1, TranslationKey> combinedResults = {};
    final bool isSmallAmountOfStrings = groups.length <= 2;
    final bool willHaveProgressBar = !isSmallAmountOfStrings;

    final FillingBar? p =
        willHaveProgressBar
            ? FillingBar(
              desc: 'Replacing hardcoded strings...',
              total: groups.length,
              time: true,
              percentage: true,
            )
            : null;

    Future<void> function() async {
      for (final group in groups) {
        p?.increment();
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
    } else {
      await legacyRunWithSpinner(
        successMessage: 'Created human-friendly ARB keys',
        message: 'Creating human-friendly ARB keys...',
        function,
      );
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
        return garantedKeyIntegrityResponse.asError();
      }
      final ProcessedKeyIntegrity garantedKeyIntegrity =
          garantedKeyIntegrityResponse.getOrThrow();

      final camelCaseKey = garantedKeyIntegrity;
      if (camelCaseKey.isEmpty) {
        throw Exception(
          'Generated key for "${string.value}" is empty. Please check the string content.',
        );
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
