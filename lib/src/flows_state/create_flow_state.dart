import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/entities/api_client_entity.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

part 'create_flow_state.freezed.dart';
part 'create_flow_state.g.dart';

@freezed
abstract class CreateFlowState with _$CreateFlowState {
  const CreateFlowState._();

  /// Step 1
  factory CreateFlowState.initial({
    required String accountApiKey,
    required String directoryPath,
  }) = CreateFlowInitial;

  /// Step 2
  factory CreateFlowState.createdClient({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
  }) = CreateFlowCreatedClient;

  /// Step 3
  factory CreateFlowState.ensuredGit({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
  }) = CreateFlowEnsureGit;

  /// Step 4
  factory CreateFlowState.gotCodeBaseYaml({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
  }) = CreateFlowGotCodeBaseYaml;

  /// Step 5
  factory CreateFlowState.gotGitUser({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitUser gitUser,
  }) = CreateFlowGotGitUser;

  /// Step 6
  factory CreateFlowState.gotLastLocalCommit({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitUser gitUser,
    required GitCommit previousCommit,
  }) = CreateFlowGotLastLocalCommit;

  /// Step 7
  factory CreateFlowState.gotProjectOriginUrl({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitUser gitUser,
    required GitCommit previousCommit,
    required String projectOriginUrl,
  }) = CreateFlowGotProjectOriginUrl;

  /// Step 8
  factory CreateFlowState.gotGitVariables({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
  }) = CreateFlowGotGitVariables;

  /// Step 9
  factory CreateFlowState.extractedProjectCodebase({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required Set<ContextPath> contextPaths,
  }) = CreateFlowExtractedProjectCodebase;

  /// Step 10
  factory CreateFlowState.createdProjectInGobabelServer({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required Set<ContextPath> contextPaths,
  }) = CreateFlowCreatedProjectInGobabelServer;

  Directory get directory {
    return Directory(directoryPath);
  }

  factory CreateFlowState.fromJson(Map<String, dynamic> json) =>
      _$CreateFlowStateFromJson(json);
}

AsyncResult<CreateFlowInitial> create_initFlowState({
  required String accountApiKey,
  required String directoryPath,
}) async {
  final createFlowInitial = CreateFlowInitial(
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
