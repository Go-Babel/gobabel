import 'dart:io';
import 'package:gobabel/src/core/type_defs.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:collection/collection.dart';
import 'package:result_dart/result_dart.dart';

class GetCodeBaseYamlInfoUsecase {
  const GetCodeBaseYamlInfoUsecase();
  AsyncBabelResult<CodeBaseYamlInfo> call() async {
    final currentDirectory = Directory.current;

    const String targetFile = 'pubspec.yaml';

    final List<FileSystemEntity> items = currentDirectory.listSync(
      recursive: false,
      followLinks: false,
    );

    final yamlFile = items.firstWhereOrNull(
      (element) => element.path.endsWith(targetFile),
    );
    if (yamlFile == null) {
      return Failure(
        'No "pubspec.yaml" file found.\nPlease ensure you are in a flutter/dart project directory.',
      );
    }

    final String yamlContent = await File(yamlFile.path).readAsString();

    final String? projectName = yamlContent.getYamlLineContent('name');
    final String? projectDescription = yamlContent.getYamlLineContent(
      'description',
    );
    final String? projectVersion = yamlContent.getYamlLineContent('version');

    final ProjectType projectType = switch (yamlContent.contains(
      'sdk: flutter',
    )) {
      true => ProjectType.flutter,
      false => ProjectType.dart,
    };

    if (projectName == null) {
      return Failure(
        'No "name" field found in "pubspec.yaml".\n'
        'Please ensure you are running the code in '
        'a flutter/dart directory and you have the "name" '
        'field in your "pubspec.yaml" file.\n'
        'That project name is used as identifier of the '
        'project in AiBabel Dashboard.',
      );
    }

    if (projectVersion == null) {
      return Failure(
        'No "version" field found in "pubspec.yaml".\n'
        'Please ensure you are running the code in '
        'a flutter/dart directory and you have the "version" '
        'field in your "pubspec.yaml" file.\n'
        'That project version is used as identifier of the '
        'project in AiBabel Dashboard.',
      );
    }

    return Success(
      CodeBaseYamlInfo(
        projectName: projectName,
        version: projectVersion,
        projectDescription: projectDescription,
        type: projectType,
      ),
    );
  }
}

extension on String {
  String? getYamlLineContent(String name) {
    return RegExp('^$name: (.+)\$').firstMatch(this)?.group(1)?.trim();
  }
}
