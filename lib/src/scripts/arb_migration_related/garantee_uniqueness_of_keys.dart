import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/scripts/extract_strings_related/map_strings.dart';

typedef NewL10nKey = L10nKey;

class GaranteeUniquenessOfKeysUsecase {
  Map<NewL10nKey, NewL10nKey> call(Map<L10nKey, L10nValue> allKeyValues) {
    final Map<NewL10nKey, NewL10nKey> response = {};

    for (final key in allKeyValues.keys) {
      final uniqueKey = garanteeIsNewKey(key, []);
      response[key] = uniqueKey;
    }

    return response;
  }
}
