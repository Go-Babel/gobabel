import 'dart:io';

import 'package:chalkdart/chalkstrings.dart';
import 'package:collection/collection.dart';
import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<CodeBaseYamlInfo> getCodeBaseYamlInfoUsecase({
  required Directory currentDirectory,
}) async {
  const String targetFile = 'pubspec.yaml';

  final List<FileSystemEntity> items = currentDirectory.listSync(
    recursive: false,
    followLinks: false,
  );

  final yamlFile = items.firstWhereOrNull(
    (element) => element.path.endsWith(targetFile),
  );
  if (yamlFile == null) {
    return Exception(
      '❌ No "pubspec.yaml" file found.\nPlease ensure you are in a flutter/dart project directory.'
          .red,
    ).toFailure();
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
    return Exception(
      '❌ No "name" field found in "pubspec.yaml".\n'
              'Please ensure you are running the code in '
              'a flutter/dart directory and you have the "name" '
              'field in your "pubspec.yaml" file.\n'
              'That project name is used as identifier of the '
              'project in GoBabel Dashboard.'
          .red,
    ).toFailure();
  }

  if (projectVersion == null) {
    return Exception(
      '❌ No "version" field found in "pubspec.yaml".\n'
              'Please ensure you are running the code in '
              'a flutter/dart directory and you have the "version" '
              'field in your "pubspec.yaml" file.\n'
              'That project version is used as identifier of the '
              'project in GoBabel Dashboard.'
          .red,
    ).toFailure();
  }
  final isDartProject =
      projectType == ProjectType.dart; // Dart project is not supported yet
  if (isDartProject) {
    return Exception(
      '❌ Dart projects are not supported yet.\n'
              'Please ensure you are running the code in a Flutter project directory.'
          .red,
    ).toFailure();
  }

  return CodeBaseYamlInfo(
    projectName: projectName,
    version: projectVersion,
    projectDescription: projectDescription,
    type: projectType,
  ).toSuccess();
}

extension on String {
  String? getYamlLineContent(String name) {
    return RegExp(
      '^$name: (.+)\$',
      multiLine: true,
    ).firstMatch(this)?.group(1)?.trim();
  }
}

AsyncResult<CreateFlowGotCodeBaseYaml> create_getCodeBaseYamlInfo(
  CreateFlowEnsureGit payload,
) async {
  final ensureGitResult = await getCodeBaseYamlInfoUsecase(
    currentDirectory: payload.directory,
  );

  return ensureGitResult.flatMap((_) {
    return CreateFlowGotCodeBaseYaml(
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: payload.client,
    ).toSuccess();
  });
}
