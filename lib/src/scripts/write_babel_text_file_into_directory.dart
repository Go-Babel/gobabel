import 'dart:io';
import 'package:gobabel/src/core/constants.dart';
import 'package:gobabel/src/core/dependencies.dart';
import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/generated_files_reference/babel_text.dart';

class WriteBabelTextFileIntoDirectory {
  Future<void> call() async {
    final String version = Dependencies.codeBaseYamlInfo.version;
    final String projectShaIdentifier =
        Dependencies.gitVariables.projectShaIdentifier;
    final Directory curr = Directory.current;
    FileSystemEntity? libDirectory;

    await for (final FileSystemEntity fileEntity in curr.list()) {
      if (fileEntity is File) continue;
      final f = (fileEntity as Directory);
      if (!f.path.endsWith('lib')) continue;
      libDirectory = f;
    }

    if (libDirectory == null) {
      throw Exception('No lib/ directory found');
    }

    final Directory libDir = libDirectory as Directory;

    final String path = '${libDir.path}/$kBabelFileName';
    final file = await File(path).create();

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
    fileContent.write('\n}');

    await file.writeAsString(fileContent.toString(), mode: FileMode.write);
  }
}
