import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<BabelFunctionDeclaration> inferImplementationFunctionFromArbKeys({
  required TranslationKey l10nKey,
  required Set<VariableName> variablesPlaceholders,
}) async {
  BabelFunctionImplementation gobabelFunctionImplementationString =
      '$kBabelClass.$l10nKey(${variablesPlaceholders.map((e) => e).join(', ')})';

  return gobabelFunctionImplementationString.toSuccess();
}
