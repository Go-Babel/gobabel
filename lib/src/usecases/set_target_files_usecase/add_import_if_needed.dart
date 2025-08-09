import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel_core/gobabel_core.dart';

NewFileContent addImportIfNeededUsecase({
  required String fileContent,
  required CodeBaseYamlInfo codeBaseYamlInfo,
}) {
  final String projectName = codeBaseYamlInfo.projectName;
  final importText = "import 'package:$projectName/$kBabelFileName';";

  if (!fileContent.contains(importText)) {
    final importGroup = RegExp(
      '^import (\'|").+(\\1);\$',
      multiLine: true,
    ).allMatches(fileContent).lastOrNull;
    if (importGroup != null) {
      final int start = importGroup.start;
      final int end = importGroup.end;

      fileContent = fileContent.replaceRange(
        start,
        end,
        '${fileContent.substring(start, end)}\n$importText\n',
      );
      return fileContent;
    }

    final ignoreRef = RegExp(
      r'ignore_for_file: .*$',
      multiLine: true,
    ).allMatches(fileContent).lastOrNull;

    if (ignoreRef != null) {
      final int start = ignoreRef.start;
      final int end = ignoreRef.end;

      fileContent = fileContent.replaceRange(
        start,
        end,
        '${fileContent.substring(start, end)}\n$importText\n',
      );
      return fileContent;
    }

    fileContent = '$importText\n$fileContent';
    return fileContent;
  } else {
    return fileContent;
  }
}

typedef NewFileContent = String;
