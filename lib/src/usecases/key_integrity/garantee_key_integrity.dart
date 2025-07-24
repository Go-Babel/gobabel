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
  key = key.trimHardcodedString;
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
      return trim();
    }
    // 1. Check if the original string is "empty" (after trimming)
    final trimmedOriginal = trim();
    if (trimmedOriginal.isEmpty) {
      return "emptyVariable";
    }

    // 2. Split into words using common delimiters (space, hyphen, underscore)
    //    The regex r'[\s_-]+' matches one or more whitespace characters, underscores, or hyphens.
    //    Filter out empty strings that might result from multiple delimiters together (e.g., "hello--world").
    List<String> words =
        trimmedOriginal
            .split(RegExp(r'[\s_-]+'))
            .where((part) => part.isNotEmpty)
            .toList();

    // 3. If no valid words are found after splitting (e.g., input was "---" or "_ _")
    //    This means the potential camelCase result would be empty.
    if (words.isEmpty) {
      return "emptyVariable";
    }

    // 4. Construct the camelCase string
    //    The first word is all lowercase.
    String camelCaseResult = words.first.toLowerCase();

    //    For subsequent words, capitalize the first letter and lowercase the rest.
    for (int i = 1; i < words.length; i++) {
      String word = words[i];
      // This check is technically redundant due to the .where((part) => part.isNotEmpty) above,
      // but good for clarity if logic changes.
      if (word.isNotEmpty) {
        camelCaseResult +=
            word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
    }

    // 5. Final check on the result (though `words.isEmpty` should cover this)
    //    This ensures that if somehow the camelCaseResult ended up empty (highly unlikely
    //    if `words` was not empty), it still returns "emptyVariable".
    if (camelCaseResult.isEmpty) {
      return "emptyVariable";
    }

    return camelCaseResult;
  }
}
