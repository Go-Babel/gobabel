import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_is_valid_function_name.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_uniqueness.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncBabelResult<ProcessedKeyIntegrity> garanteeKeyIntegrity({
  required TranslationKey key,
  required HardCodedString value,
}) async {
  key = key.trimHardcodedString.toCamelCaseOrEmpty;
  final validKeyNameResponse = await garanteeKeyIsValidFunctionName(key: key);
  if (validKeyNameResponse.isError()) {
    return validKeyNameResponse;
  }
  final validKeyName = validKeyNameResponse.getOrThrow();
  final cleanValue = value.trimHardcodedString;
  final uniqueKeyGaranteedResponse = await garanteeKeyUniqueness(
    key: validKeyName,
    value: cleanValue,
  );
  if (uniqueKeyGaranteedResponse.isError()) {
    return uniqueKeyGaranteedResponse;
  }
  final uniqueKey = uniqueKeyGaranteedResponse.getOrThrow();
  final processedKey = uniqueKey.toCamelCaseOrEmpty;
  if (processedKey.isEmpty) {
    return BabelFailureResponse.onlyBabelException(
      exception: BabelException(
        title: 'Invalid Translation Key',
        description:
            'The processed key is empty after ensuring uniqueness and validity. This can happen when the original key contains only special characters or whitespace that get removed during processing.',
      ),
    ).toFailure();
  }

  return processedKey.toSuccess();
}

typedef ProcessedKeyIntegrity = String;

extension StringCamelCaseExtension on String {
  /// Transforms the string to camelCase.
  ///
  /// - Trims leading/trailing whitespace.
  /// - Splits by spaces, hyphens, or underscores.
  /// - The first word is converted to lowercase.
  /// - Subsequent words have their first letter capitalized and the rest lowercased.
  ///
  /// If the original string (after trimming) or the resulting camelCase string
  /// is empty, it returns "emptyVariable".
  String get toCamelCaseOrEmpty {
    if (CaseIdentifyRegex.isCamelCase(trim())) {
      final trimmed = trim();
      // Verify it only contains letters and numbers and doesn't start with number
      if (RegExp(r'^[a-zA-Z][a-zA-Z0-9]*$').hasMatch(trimmed)) {
        return trimmed;
      }
    }
    // 1. Check if the original string is "empty" (after trimming)
    final trimmedOriginal = trim();
    if (trimmedOriginal.isEmpty) {
      return "emptyVariable";
    }

    // 2. Split into words using any non-alphanumeric characters as delimiters
    //    This will split on spaces, special characters, etc.
    List<String> words =
        trimmedOriginal
            .split(RegExp(r'[^a-zA-Z0-9]+'))
            .where((part) => part.isNotEmpty)
            .toList();

    // 3. If no valid words are found after splitting
    if (words.isEmpty) {
      return "emptyVariable";
    }

    // 4. Clean each word to only contain alphanumeric characters
    //    (this is redundant given our split regex, but kept for safety)
    List<String> cleanedWords =
        words
            .map((word) => word.replaceAll(RegExp(r'[^a-zA-Z0-9]'), ''))
            .where((word) => word.isNotEmpty)
            .toList();

    if (cleanedWords.isEmpty) {
      return "emptyVariable";
    }

    // 5. Construct the camelCase string
    String camelCaseResult = cleanedWords.first.toLowerCase();

    for (int i = 1; i < cleanedWords.length; i++) {
      String word = cleanedWords[i];
      if (word.isNotEmpty) {
        camelCaseResult +=
            word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
    }

    // 6. Check if result starts with a number
    if (camelCaseResult.isNotEmpty &&
        RegExp(r'^[0-9]').hasMatch(camelCaseResult)) {
      // Prefix with 'var' if it starts with a number
      camelCaseResult =
          'var${camelCaseResult[0].toUpperCase()}${camelCaseResult.substring(1)}';
    }

    // 7. Final validation - ensure only letters and numbers
    if (!RegExp(r'^[a-zA-Z][a-zA-Z0-9]*$').hasMatch(camelCaseResult)) {
      return "emptyVariable";
    }

    if (camelCaseResult.isEmpty) {
      return "emptyVariable";
    }

    return camelCaseResult;
  }
}
