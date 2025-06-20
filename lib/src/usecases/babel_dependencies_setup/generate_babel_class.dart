import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<String> generateBabelClassUsecase({
  required BigInt projectShaIdentifier,
  required Set<BabelFunctionDeclaration> declarationFunctions,
}) async {
  final StringBuffer fileContent = StringBuffer(babelText);
  for (final BabelFunctionDeclaration d in declarationFunctions) {
    fileContent.write('$d\n');
  }

  fileContent.write('}');

  return fileContent
      .toString()
      .replaceAll(
        r"const String _gobabelRoute = 'http://localhost:8080';",
        "const String _gobabelRoute = 'http://gobabel.dev';",
      )
      .replaceAll(
        r"const String _projectIdentifier = '';",
        "const String _projectIdentifier = '$projectShaIdentifier';",
      )
      .toSuccess();
}
