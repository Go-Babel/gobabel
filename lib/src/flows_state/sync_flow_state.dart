import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/entities/api_client_entity.dart';
import 'package:gobabel/src/flows_state/flow_interface.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

part 'sync_flow_state.freezed.dart';
part 'sync_flow_state.g.dart';

@freezed
abstract class SyncFlowState
    with _$SyncFlowState
    implements Loadable, Loggable {
  const SyncFlowState._();

  /// Step 1
  factory SyncFlowState.initial({
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
  }) = SyncFlowInitial;

  /// Step 2
  factory SyncFlowState.createdClient({
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
  }) = SyncFlowCreatedClient;

  /// Step 3
  factory SyncFlowState.ensuredGit({
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
  }) = SyncFlowEnsureGit;

  /// Step 4
  factory SyncFlowState.gotCodeBaseYaml({
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
  }) = SyncFlowGotCodeBaseYaml;

  /// Step 5
  factory SyncFlowState.gotGitUser({
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitUser gitUser,
  }) = SyncFlowGotGitUser;

  /// Step 6
  factory SyncFlowState.gotLastLocalCommit({
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitUser gitUser,
    required GitCommit previousCommit,
  }) = SyncFlowGotLastLocalCommit;

  /// Step 7
  factory SyncFlowState.gotProjectOriginUrl({
    required bool willLog,
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
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
  }) = SyncFlowGotGitVariables;

  /// Step 9
  factory SyncFlowState.extractedProjectCodebase({
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required Set<ContextPath> contextPaths,
  }) = SyncFlowExtractedProjectCodebase;

  /// Step 10
  factory SyncFlowState.createdProjectInGobabelServer({
    required bool willLog,
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

  @override
  int get maxAmountOfSteps => 10;

  @override
  String get message => map(
    initial: (_) => 'Creating client...',
    createdClient: (_) => 'Ensuring git dependencies...',
    ensuredGit: (_) => 'Reading codebase YAML...',
    gotCodeBaseYaml: (_) => 'Getting git user...',
    gotGitUser: (_) => 'Getting last local commit...',
    gotLastLocalCommit: (_) => 'Getting project origin URL...',
    gotProjectOriginUrl: (_) => 'Collecting git variables...',
    gotGitVariables: (_) => 'Extracting project codebase...',
    extractedProjectCodebase: (_) => 'Syncing project with Gobabel server...',
    createdProjectInGobabelServer: (_) => 'Sync completed!',
  );

  @override
  int get stepCount => map(
    initial: (_) => 1,
    createdClient: (_) => 2,
    ensuredGit: (_) => 3,
    gotCodeBaseYaml: (_) => 4,
    gotGitUser: (_) => 5,
    gotLastLocalCommit: (_) => 6,
    gotProjectOriginUrl: (_) => 7,
    gotGitVariables: (_) => 8,
    extractedProjectCodebase: (_) => 9,
    createdProjectInGobabelServer: (_) => 10,
  );

  factory SyncFlowState.fromJson(Map<String, dynamic> json) =>
      _$SyncFlowStateFromJson(json);

  @override
  bool get shouldLog => willLog;
}

AsyncResult<SyncFlowInitial> sync_initFlowState({
  required bool willLog,
  required String accountApiKey,
  required String directoryPath,
}) async {
  final syncFlowInitial = SyncFlowInitial(
    willLog: willLog,
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
