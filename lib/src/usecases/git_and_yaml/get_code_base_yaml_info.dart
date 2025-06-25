import 'dart:io';

import 'package:gobabel/src/flows_state/create_flow_state.dart';
import 'package:gobabel/src/flows_state/generate_flow_state.dart';
import 'package:gobabel/src/flows_state/sync_flow_state.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/usecases/git_and_yaml/get_project_yaml.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

AsyncResult<CodeBaseYamlInfo> getCodeBaseYamlInfoUsecase({
  required Directory currentDirectory,
}) async {
  final yamlResponse = await getProjectYaml(currentDirectory: currentDirectory);
  if (yamlResponse.isError()) return yamlResponse.asError();
  final String yamlContent = yamlResponse.getOrThrow();

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
    return BabelException(
      title: 'Missing name field in pubspec.yaml',
      description: 'No "name" field found in pubspec.yaml. '
          'Please add a "name" field to your pubspec.yaml file. '
          'This project name is used as an identifier in the GoBabel Dashboard. '
          'Example: name: my_flutter_app',
    ).toFailure();
  }

  if (projectVersion == null) {
    return BabelException(
      title: 'Missing version field in pubspec.yaml',
      description: 'No "version" field found in pubspec.yaml. '
          'Please add a "version" field to your pubspec.yaml file. '
          'This version is used to track changes in the GoBabel Dashboard. '
          'Example: version: 1.0.0+1',
    ).toFailure();
  }
  final isDartProject =
      projectType == ProjectType.dart; // Dart project is not supported yet
  if (isDartProject) {
    return BabelException(
      title: 'Dart projects not supported',
      description: 'Pure Dart projects are not supported yet. '
          'GoBabel currently only supports Flutter projects. '
          'Please ensure you are running this command in a Flutter project directory '
          'with "sdk: flutter" in your pubspec.yaml dependencies.',
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

  return ensureGitResult.flatMap((yamlInfo) {
    return CreateFlowGotCodeBaseYaml(
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: payload.client,
      yamlInfo: yamlInfo,
    ).toSuccess();
  });
}

AsyncResult<SyncFlowGotCodeBaseYaml> sync_getCodeBaseYamlInfo(
  SyncFlowEnsureGit payload,
) async {
  final ensureGitResult = await getCodeBaseYamlInfoUsecase(
    currentDirectory: payload.directory,
  );

  return ensureGitResult.flatMap((yamlInfo) {
    return SyncFlowGotCodeBaseYaml(
      accountApiKey: payload.accountApiKey,
      directoryPath: payload.directoryPath,
      client: payload.client,
      yamlInfo: yamlInfo,
    ).toSuccess();
  });
}

AsyncResult<GenerateFlowGotCodeBaseYaml> generate_getCodeBaseYamlInfo(
  GenerateFlowEnsureGit payload,
) async {
  final ensureGitResult = await getCodeBaseYamlInfoUsecase(
    currentDirectory: payload.directory,
  );

  return ensureGitResult.flatMap((yamlInfo) {
    return GenerateFlowGotCodeBaseYaml(
      willLog: payload.willLog,
      inputedByUserLocale: payload.inputedByUserLocale,
      projectApiToken: payload.projectApiToken,
      directoryPath: payload.directoryPath,
      client: payload.client,
      yamlInfo: yamlInfo,
    ).toSuccess();
  });
}
