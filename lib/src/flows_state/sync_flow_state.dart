import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/entities/api_client_entity.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

part 'sync_flow_state.freezed.dart';
part 'sync_flow_state.g.dart';

@freezed
abstract class SyncFlowState with _$SyncFlowState {
  const SyncFlowState._();

  /// Step 1
  factory SyncFlowState.initial({
    required String accountApiKey,
    required String directoryPath,
  }) = SyncFlowInitial;

  /// Step 2
  factory SyncFlowState.createdClient({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
  }) = SyncFlowCreatedClient;

  /// Step 3
  factory SyncFlowState.ensuredGit({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
  }) = SyncFlowEnsureGit;

  /// Step 4
  factory SyncFlowState.gotCodeBaseYaml({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
  }) = SyncFlowGotCodeBaseYaml;

  /// Step 5
  factory SyncFlowState.gotGitUser({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitUser gitUser,
  }) = SyncFlowGotGitUser;

  /// Step 6
  factory SyncFlowState.gotLastLocalCommit({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitUser gitUser,
    required GitCommit previousCommit,
  }) = SyncFlowGotLastLocalCommit;

  /// Step 7
  factory SyncFlowState.gotProjectOriginUrl({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitUser gitUser,
    required GitCommit previousCommit,
    required String projectOriginUrl,
  }) = SyncFlowGotProjectOriginUrl;

  /// Step 8
  factory SyncFlowState.gotGitVariables({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
  }) = SyncFlowGotGitVariables;

  /// Step 9
  factory SyncFlowState.extractedProjectCodebase({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required Set<ContextPath> contextPaths,
  }) = SyncFlowExtractedProjectCodebase;

  /// Step 10
  factory SyncFlowState.createdProjectInGobabelServer({
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required Set<ContextPath> contextPaths,
  }) = SyncFlowCreatedProjectInGobabelServer;

  Directory get directory {
    return Directory(directoryPath);
  }

  factory SyncFlowState.fromJson(Map<String, dynamic> json) =>
      _$SyncFlowStateFromJson(json);
}

AsyncResult<SyncFlowInitial> syncFlowState({
  required String accountApiKey,
  required String directoryPath,
}) async {
  final syncFlowInitial = SyncFlowInitial(
    accountApiKey: accountApiKey,
    directoryPath: directoryPath,
  );
  final existsDirectory = await syncFlowInitial.directory.exists();
  if (!existsDirectory) {
    return Failure(
      BabelException(
        title: 'Directory does not exist',
        description:
            'The directory at ${syncFlowInitial.directoryPath} does not exist.',
      ),
    );
  }

  return syncFlowInitial.toSuccess();
}
