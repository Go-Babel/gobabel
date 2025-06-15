import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

Result<Map<TranslationKey, BabelFunctionDeclaration>>
inferImplementationFunctionFromArbKeys({
  required Map<TranslationKey, Set<VariableName>> variablesPlaceholdersPerKey,
}) {
  final Map<TranslationKey, BabelFunctionDeclaration> keyToDeclaration = {};

  variablesPlaceholdersPerKey.forEach((l10nKey, variables) {
    BabelFunctionImplementation gobabelFunctionImplementationString =
        '$kBabelClass.$l10nKey(${variables.map((e) => e).join(', ')})';

    keyToDeclaration[l10nKey] = gobabelFunctionImplementationString;
  });

  return keyToDeclaration.toSuccess();
}
