import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/analyse_codebase_related/map_strings.dart';
import 'package:gobabel_core/gobabel_core.dart';

typedef NewL10nKey = L10nKey;

class GaranteeUniquenessOfKeysUsecase {
  Map<NewL10nKey, NewL10nKey> call(Map<L10nKey, L10nValue> allKeyValues) {
    final Map<NewL10nKey, NewL10nKey> response = {};

    for (final key in allKeyValues.keys) {
      final uniqueKey = garanteeIsNewKey(key);
      response[key] = uniqueKey;
    }

    return response;
  }
}

String garanteeIsNewKey(String input) {
  int version = 0;
  String getUniqueInput() {
    return '$input${Dependencies.versionId}${version == 0 ? '' : 'v$version'}';
    // With underline:
    // return '${input}_${Dependencies.versionId}${version == 0 ? '' : 'v$version'}';
  }

  String uniqueInput = getUniqueInput();

  // Get a version that is not already calculated
  while (Dependencies.uniqueKeys.contains(uniqueInput)) {
    // while (Dependencies.newLabelsKeys.keys.contains(uniqueInput)) {
    version++;
    uniqueInput = getUniqueInput();
  }
  Dependencies.uniqueKeys.add(uniqueInput);

  return uniqueInput;
}
