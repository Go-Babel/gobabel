import 'package:gobabel_core/gobabel_core.dart';

class InferDeclarationFunctionFromArbJsonUsecase {
  final _inferDeclaration = InferDeclarationFunctionByArbValueUsecase();

  Map<L10nKey, BabelFunctionDeclaration> call(
    Map<L10nKey, L10nValue> allKeyValues,
  ) {
    final Map<L10nKey, BabelFunctionDeclaration> allDeclarationFunctions = {};

    allKeyValues.forEach((L10nKey key, L10nValue l10nValue) {
      final declaration = _inferDeclaration(key: key, value: l10nValue);
      allDeclarationFunctions[key] = declaration;
    });

    return allDeclarationFunctions;
  }
}
