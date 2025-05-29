import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel_core/gobabel_core.dart';

class ResolveAlreadyExistingKey {
  final InferDeclarationFunctionByArbValueUsecase
  _inferDeclarationFunctionByArbValueUsecase;

  const ResolveAlreadyExistingKey({
    required InferDeclarationFunctionByArbValueUsecase
    inferDeclarationFunctionByArbValueUsecase,
  }) : _inferDeclarationFunctionByArbValueUsecase =
           inferDeclarationFunctionByArbValueUsecase;

  void call() {
    for (final entry in Dependencies.referenceLanguageJson.entries) {
      final BabelFunctionDeclaration declarationFunction =
          _inferDeclarationFunctionByArbValueUsecase(
            key: entry.key,
            value: entry.value,
          );

      Dependencies.allDeclarationFunctions.add(declarationFunction);
    }
  }
}
