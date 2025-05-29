import 'dart:io';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/utils/file_utils.dart';
import 'package:gobabel/src/generated_files_reference/babel_text.dart';
import 'package:gobabel_core/gobabel_core.dart';

class WriteBabelTextFileIntoDirectory {
  Future<void> call() async {
    final String version = Dependencies.codeBaseYamlInfo.version;
    final String projectShaIdentifier =
        Dependencies.gitVariables.projectShaIdentifier.toString();

    final Map<L10nKey, BabelFunctionDeclaration> allArbDeclarationFunctions =
        Dependencies.arbData?.allDeclarationFunctions ?? {};

    final String babelPath = await FileUtils.getBabelTextFile;
    final file = File(babelPath);
    if (await file.exists()) {
      await file.delete();
    }
    await file.create(recursive: true);

    final StringBuffer fileContent = StringBuffer(
      babelText
          .replaceAll(
            r"const String _gobabelRoute = 'http://localhost:8080';",
            "const String _gobabelRoute = 'http://gobabel.dev';",
          )
          .replaceAll(
            r"const String _projectVersion = '';",
            "const String _projectVersion = '$version';",
          )
          .replaceAll(
            r"const String _projectShaIdentifier = '';",
            "const String _projectShaIdentifier = '$projectShaIdentifier';",
          ),
    );

    for (final BabelFunctionDeclaration d
        in Dependencies.allDeclarationFunctions) {
      fileContent.write('$d\n');
    }
    for (final BabelFunctionDeclaration d
        in allArbDeclarationFunctions.values) {
      fileContent.write('$d\n');
    }
    fileContent.write('\n}');

    await file.writeAsString(fileContent.toString(), mode: FileMode.write);
  }
}
