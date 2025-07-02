import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gobabel/src/core/babel_failure_response.dart';
import 'package:gobabel/src/entities/api_client_entity.dart';
import 'package:gobabel/src/flows_state/flow_interface.dart';
import 'package:gobabel/src/models/code_base_yaml_info.dart';
import 'package:gobabel/src/models/git_variables.dart';
import 'package:gobabel_client/gobabel_client.dart';
import 'package:gobabel_core/gobabel_core.dart';
import 'package:result_dart/result_dart.dart';

part 'create_flow_state.freezed.dart';
part 'create_flow_state.g.dart';

@freezed
abstract class CreateFlowState
    with _$CreateFlowState
    implements FlowInterface<CreateFlowState> {
  CreateFlowState._();

  /// Step 1
  factory CreateFlowState.initial({
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
  }) = CreateFlowInitial;

  /// Step 2
  factory CreateFlowState.createdClient({
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
  }) = CreateFlowCreatedClient;

  /// Step 3
  factory CreateFlowState.ensuredGit({
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
  }) = CreateFlowEnsureGit;

  /// Step 4
  factory CreateFlowState.gotCodeBaseYaml({
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
  }) = CreateFlowGotCodeBaseYaml;

  /// Step 5
  factory CreateFlowState.gotGitUser({
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitUser gitUser,
  }) = CreateFlowGotGitUser;

  /// Step 6
  factory CreateFlowState.gotLastLocalCommit({
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitUser gitUser,
    required GitCommit previousCommit,
  }) = CreateFlowGotLastLocalCommit;

  /// Step 7
  factory CreateFlowState.gotProjectOriginUrl({
    required bool willLog,
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
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
  }) = CreateFlowGotGitVariables;

  /// Step 9
  factory CreateFlowState.extractedProjectCodebase({
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required Set<ContextPath> contextPaths,
  }) = CreateFlowExtractedProjectCodebase;

  /// Step 10
  factory CreateFlowState.createdProjectInGobabelServer({
    required bool willLog,
    required String accountApiKey,
    required String directoryPath,
    required ApiClientEntity client,
    required CodeBaseYamlInfo yamlInfo,
    required GitVariables gitVariables,
    required Set<ContextPath> contextPaths,
  }) = CreateFlowCreatedProjectInGobabelServer;

  @override
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
    extractedProjectCodebase: (_) => 'Creating project in Gobabel server...',
    createdProjectInGobabelServer: (_) => 'Flow completed!',
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

  factory CreateFlowState.fromJson(Map<String, dynamic> json) =>
      _$CreateFlowStateFromJson(json);

  @override
  CreateFlowState fromJson(Map<String, dynamic> json) =>
      CreateFlowState.fromJson(json);

  @override
  bool get shouldLog => willLog;

  @override
  bool get shouldReset => stepCount > 29;
}

AsyncBabelResult<CreateFlowInitial> create_initFlowState({
  required bool willLog,
  required String accountApiKey,
  required String directoryPath,
}) async {
  final createFlowInitial = CreateFlowInitial(
    willLog: willLog,
    accountApiKey: accountApiKey,
    directoryPath: directoryPath,
  );
  final existsDirectory = await createFlowInitial.directory.exists();
  if (!existsDirectory) {
    return Failure(
      BabelFailureResponse.onlyBabelException(
        exception: BabelException(
          title: 'Directory does not exist',
          description:
              'The directory at ${createFlowInitial.directoryPath} does not exist.',
        ),
      ),
    );
  }

  return createFlowInitial.toSuccess();
}
