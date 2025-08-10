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
  final cleanValue = value.trimHardcodedString.toCamelCaseOrEmpty;
  final validKeyNameResponse = await garanteeKeyIsValidFunctionName(
    key: cleanValue,
  );
  if (validKeyNameResponse.isError()) {
    return validKeyNameResponse;
  }
  final validKeyName = validKeyNameResponse.getOrThrow();
  final uniqueKeyGaranteedResponse = await garanteeKeyUniqueness(
    key: validKeyName,
    value: cleanValue,
  );
  if (uniqueKeyGaranteedResponse.isError()) return uniqueKeyGaranteedResponse;

  final processedKey = uniqueKeyGaranteedResponse.getOrThrow().trim();
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
