// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_flow_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateFlowInitialImpl _$$CreateFlowInitialImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateFlowInitialImpl(
      willLog: json['willLog'] as bool,
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CreateFlowInitialImplToJson(
        _$CreateFlowInitialImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'runtimeType': instance.$type,
    };

_$CreateFlowCreatedClientImpl _$$CreateFlowCreatedClientImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateFlowCreatedClientImpl(
      willLog: json['willLog'] as bool,
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CreateFlowCreatedClientImplToJson(
        _$CreateFlowCreatedClientImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'runtimeType': instance.$type,
    };

_$CreateFlowEnsureGitImpl _$$CreateFlowEnsureGitImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateFlowEnsureGitImpl(
      willLog: json['willLog'] as bool,
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CreateFlowEnsureGitImplToJson(
        _$CreateFlowEnsureGitImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'runtimeType': instance.$type,
    };

_$CreateFlowGotCodeBaseYamlImpl _$$CreateFlowGotCodeBaseYamlImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateFlowGotCodeBaseYamlImpl(
      willLog: json['willLog'] as bool,
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      yamlInfo:
          CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CreateFlowGotCodeBaseYamlImplToJson(
        _$CreateFlowGotCodeBaseYamlImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'yamlInfo': instance.yamlInfo,
      'runtimeType': instance.$type,
    };

_$CreateFlowGotGitUserImpl _$$CreateFlowGotGitUserImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateFlowGotGitUserImpl(
      willLog: json['willLog'] as bool,
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      yamlInfo:
          CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
      gitUser: GitUser.fromJson(json['gitUser'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CreateFlowGotGitUserImplToJson(
        _$CreateFlowGotGitUserImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'yamlInfo': instance.yamlInfo,
      'gitUser': instance.gitUser,
      'runtimeType': instance.$type,
    };

_$CreateFlowGotLastLocalCommitImpl _$$CreateFlowGotLastLocalCommitImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateFlowGotLastLocalCommitImpl(
      willLog: json['willLog'] as bool,
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      yamlInfo:
          CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
      gitUser: GitUser.fromJson(json['gitUser'] as Map<String, dynamic>),
      previousCommit:
          GitCommit.fromJson(json['previousCommit'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CreateFlowGotLastLocalCommitImplToJson(
        _$CreateFlowGotLastLocalCommitImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'yamlInfo': instance.yamlInfo,
      'gitUser': instance.gitUser,
      'previousCommit': instance.previousCommit,
      'runtimeType': instance.$type,
    };

_$CreateFlowGotProjectOriginUrlImpl
    _$$CreateFlowGotProjectOriginUrlImplFromJson(Map<String, dynamic> json) =>
        _$CreateFlowGotProjectOriginUrlImpl(
          willLog: json['willLog'] as bool,
          accountApiKey: json['accountApiKey'] as String,
          directoryPath: json['directoryPath'] as String,
          client:
              ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
          yamlInfo: CodeBaseYamlInfo.fromJson(
              json['yamlInfo'] as Map<String, dynamic>),
          gitUser: GitUser.fromJson(json['gitUser'] as Map<String, dynamic>),
          previousCommit: GitCommit.fromJson(
              json['previousCommit'] as Map<String, dynamic>),
          projectOriginUrl: json['projectOriginUrl'] as String,
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$CreateFlowGotProjectOriginUrlImplToJson(
        _$CreateFlowGotProjectOriginUrlImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'yamlInfo': instance.yamlInfo,
      'gitUser': instance.gitUser,
      'previousCommit': instance.previousCommit,
      'projectOriginUrl': instance.projectOriginUrl,
      'runtimeType': instance.$type,
    };

_$CreateFlowGotGitVariablesImpl _$$CreateFlowGotGitVariablesImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateFlowGotGitVariablesImpl(
      willLog: json['willLog'] as bool,
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      yamlInfo:
          CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
      gitVariables:
          GitVariables.fromJson(json['gitVariables'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CreateFlowGotGitVariablesImplToJson(
        _$CreateFlowGotGitVariablesImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'yamlInfo': instance.yamlInfo,
      'gitVariables': instance.gitVariables,
      'runtimeType': instance.$type,
    };

_$CreateFlowExtractedProjectCodebaseImpl
    _$$CreateFlowExtractedProjectCodebaseImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateFlowExtractedProjectCodebaseImpl(
          willLog: json['willLog'] as bool,
          accountApiKey: json['accountApiKey'] as String,
          directoryPath: json['directoryPath'] as String,
          client:
              ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
          yamlInfo: CodeBaseYamlInfo.fromJson(
              json['yamlInfo'] as Map<String, dynamic>),
          gitVariables: GitVariables.fromJson(
              json['gitVariables'] as Map<String, dynamic>),
          contextPaths: (json['contextPaths'] as List<dynamic>)
              .map((e) => e as String)
              .toSet(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$CreateFlowExtractedProjectCodebaseImplToJson(
        _$CreateFlowExtractedProjectCodebaseImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'yamlInfo': instance.yamlInfo,
      'gitVariables': instance.gitVariables,
      'contextPaths': instance.contextPaths.toList(),
      'runtimeType': instance.$type,
    };

_$CreateFlowCreatedProjectInGobabelServerImpl
    _$$CreateFlowCreatedProjectInGobabelServerImplFromJson(
            Map<String, dynamic> json) =>
        _$CreateFlowCreatedProjectInGobabelServerImpl(
          willLog: json['willLog'] as bool,
          accountApiKey: json['accountApiKey'] as String,
          directoryPath: json['directoryPath'] as String,
          client:
              ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
          yamlInfo: CodeBaseYamlInfo.fromJson(
              json['yamlInfo'] as Map<String, dynamic>),
          gitVariables: GitVariables.fromJson(
              json['gitVariables'] as Map<String, dynamic>),
          contextPaths: (json['contextPaths'] as List<dynamic>)
              .map((e) => e as String)
              .toSet(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$CreateFlowCreatedProjectInGobabelServerImplToJson(
        _$CreateFlowCreatedProjectInGobabelServerImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'yamlInfo': instance.yamlInfo,
      'gitVariables': instance.gitVariables,
      'contextPaths': instance.contextPaths.toList(),
      'runtimeType': instance.$type,
    };
