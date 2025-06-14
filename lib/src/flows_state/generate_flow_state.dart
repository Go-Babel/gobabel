import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/entities/api_client_entity.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:result_dart/result_dart.dart';

part 'generate_flow_state.freezed.dart';
part 'generate_flow_state.g.dart';

@freezed
abstract class GenerateFlowState with _$GenerateFlowState {
  const GenerateFlowState._();

  /// Step 1
  factory GenerateFlowState.initial({
    required String accountApiKey,
    required String directoryPath,
  }) = GenerateFlowInitial;

  /// Step 2
  factory GenerateFlowState.createdClient({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
  }) = GenerateFlowCreatedClient;

  /// Step 3
  factory GenerateFlowState.ensuredGit({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
  }) = GenerateFlowEnsureGit;

  /// Step 4
  factory GenerateFlowState.gotCodeBaseYaml({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
  }) = GenerateFlowGotCodeBaseYaml;

  /// Step 5
  factory GenerateFlowState.gotGitUser({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitUser gitUser,
  }) = GenerateFlowGotGitUser;

  /// Step 6
  factory GenerateFlowState.gotLastLocalCommit({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitUser gitUser,
    required GitCommit previousCommit,
  }) = GenerateFlowGotLastLocalCommit;

  /// Step 7
  factory GenerateFlowState.gotProjectOriginUrl({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitUser gitUser,
    required GitCommit previousCommit,
    required String projectOriginUrl,
  }) = GenerateFlowGotProjectOriginUrl;

  /// Step 8
  factory GenerateFlowState.gotGitVariables({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
  }) = GenerateFlowGotGitVariables;

  Directory get directory {
    return Directory(directoryPath);
  }

  factory GenerateFlowState.fromJson(Map<String, dynamic> json) =>
      _$GenerateFlowStateFromJson(json);
}

AsyncResult<GenerateFlowInitial> generate_initFlowState({
  required String accountApiKey,
  required String directoryPath,
}) async {
  final createFlowInitial = GenerateFlowInitial(
    accountApiKey: accountApiKey,
    directoryPath: directoryPath,
  );
  final existsDirectory = await createFlowInitial.directory.exists();
  if (!existsDirectory) {
    return Failure(
      BabelException(
        title: 'Directory does not exist',
        description:
            'The directory at ${createFlowInitial.directoryPath} does not exist.',
      ),
    );
  }

  return createFlowInitial.toSuccess();
}
