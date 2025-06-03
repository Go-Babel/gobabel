import 'dart:io';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/utils/file_utils.dart';
import 'package:gobabel_core/gobabel_core.dart';

class WriteBabelTextFileIntoDirectory {
  final GenerateBabelClassUsecase _generateBabelClassUsecase;
  WriteBabelTextFileIntoDirectory({
    GenerateBabelClassUsecase? generateBabelClassUsecase,
  }) : _generateBabelClassUsecase =
           generateBabelClassUsecase ?? GenerateBabelClassUsecase();
  Future<void> call() async {
    final BigInt projectShaIdentifier =
        Dependencies.gitVariables.projectShaIdentifier;

    final Map<L10nKey, BabelFunctionDeclaration> allArbDeclarationFunctions =
        Dependencies.arbData?.allDeclarationFunctions ?? {};

    final String babelPath = await FileUtils.getBabelTextFile;
    final file = File(babelPath);
    if (await file.exists()) {
      await file.delete();
    }
    await file.create(recursive: true);

    await file.writeAsString(
      _generateBabelClassUsecase(
        projectShaIdentifier: projectShaIdentifier,
        declarationFunctions: {
          ...Dependencies.allDeclarationFunctions,
          ...allArbDeclarationFunctions.values,
        },
      ),
      mode: FileMode.write,
    );
  }
}
