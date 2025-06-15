import 'package:gobabel/src/usecases/key_integrity/garantee_key_is_valid_function_name.dart';
import 'package:gobabel/src/usecases/key_integrity/garantee_key_uniqueness.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

Result<ProcessedKeyIntegrity> garanteeKeyIntegrity({
  required TranslationKey key,
  required HardCodedString value,
}) {
  final validKeyNameResponse = garanteeKeyIsValidFunctionName(key: key);
  if (validKeyNameResponse.isError()) {
    return validKeyNameResponse;
  }
  final validKeyName = validKeyNameResponse.getOrThrow();
  final cleanValue = value.trimHardcodedString;
  final uniqueKeyGaranteed = garanteeKeyUniqueness(
    key: validKeyName,
    value: cleanValue,
  );
  return uniqueKeyGaranteed;
}

typedef ProcessedKeyIntegrity = String;
