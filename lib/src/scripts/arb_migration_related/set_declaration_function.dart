import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/scripts/arb_migration_related/find_arb_data.dart';
import 'package:gobabel/src/scripts/arb_migration_related/infer_declaration_function_from_arb_json.dart';
import 'package:gobabel_core/gobabel_core.dart';

class SetDeclarationFunctionUsecase {
  final InferDeclarationFunctionFromArbJsonUsecase
  _inferDeclarationFunctionFromArbJson;

  const SetDeclarationFunctionUsecase({
    required InferDeclarationFunctionFromArbJsonUsecase
    inferDeclarationFunctionFromArbJson,
  }) : _inferDeclarationFunctionFromArbJson =
           inferDeclarationFunctionFromArbJson;

  void call() {
    final ArbData? arbData = Dependencies.arbData;
    if (arbData == null) return;

    final Map<L10nKey, BabelFunctionDeclaration> declarationFunctions = {};

    final BabelSupportedLocales referenceArbFile =
        Dependencies.referenceLanguage;
    final Map<L10nKey, L10nValue> referenceArbJson =
        arbData.preMadeTranslationArb
            .firstWhere((e) => e.locale == referenceArbFile)
            .allKeyValues;

    declarationFunctions.addAll(
      _inferDeclarationFunctionFromArbJson(referenceArbJson),
    );

    Dependencies.allDeclarationFunctions.addAll(declarationFunctions.values);
  }
}
