import 'package:gobabel/src/usecases/key_integrity/garantee_key_integrity.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

Result<ProcessedKeyIntegrity> garanteeKeyUniqueness({
  required TranslationKey key,
  required TranslationContent value,
}) {
  final TranslationKey? existingKey = _valueToValue[value];
  final isNewKey = existingKey == null;
  if (!isNewKey) {
    // If the value already exists, we can return the existing key.
    return existingKey.toSuccess();
  }

  // Is brand new value
  // Let's check if the key is available for use.
  TranslationKey integrityEnsureKey = key;
  int integrityEnsureIndex = 1;
  while (_valueToValue.keys.contains(integrityEnsureKey)) {
    integrityEnsureIndex++;
    final bool alreadyEndsWithUnderline = integrityEnsureKey.endsWith('_');
    if (alreadyEndsWithUnderline) {
      integrityEnsureKey = '$integrityEnsureKey$integrityEnsureIndex';
    } else {
      integrityEnsureKey = '${integrityEnsureKey}_$integrityEnsureIndex';
    }
  }

  // Now we have a unique key, let's add it to the map.
  _valueToValue[value] = integrityEnsureKey;
  return integrityEnsureKey.toSuccess();
}

// final Map<TranslationKey, AppearencesCount> _alreadyCreatedUniqueKeys = {};
// final Map<TranslationKey, TranslationContent> _keyToMapValue = {};
final Map<TranslationContent, TranslationKey> _valueToValue = {};
