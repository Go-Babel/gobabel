// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_flow_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SyncFlowInitialImpl _$$SyncFlowInitialImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncFlowInitialImpl(
      willLog: json['willLog'] as bool,
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SyncFlowInitialImplToJson(
        _$SyncFlowInitialImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'runtimeType': instance.$type,
    };

_$SyncFlowCreatedClientImpl _$$SyncFlowCreatedClientImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncFlowCreatedClientImpl(
      willLog: json['willLog'] as bool,
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SyncFlowCreatedClientImplToJson(
        _$SyncFlowCreatedClientImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'runtimeType': instance.$type,
    };

_$SyncFlowEnsureGitImpl _$$SyncFlowEnsureGitImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncFlowEnsureGitImpl(
      willLog: json['willLog'] as bool,
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SyncFlowEnsureGitImplToJson(
        _$SyncFlowEnsureGitImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'runtimeType': instance.$type,
    };

_$SyncFlowGotCodeBaseYamlImpl _$$SyncFlowGotCodeBaseYamlImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncFlowGotCodeBaseYamlImpl(
      willLog: json['willLog'] as bool,
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      yamlInfo:
          CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SyncFlowGotCodeBaseYamlImplToJson(
        _$SyncFlowGotCodeBaseYamlImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'yamlInfo': instance.yamlInfo,
      'runtimeType': instance.$type,
    };

_$SyncFlowGotGitUserImpl _$$SyncFlowGotGitUserImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncFlowGotGitUserImpl(
      willLog: json['willLog'] as bool,
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      yamlInfo:
          CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
      gitUser: GitUser.fromJson(json['gitUser'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SyncFlowGotGitUserImplToJson(
        _$SyncFlowGotGitUserImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'yamlInfo': instance.yamlInfo,
      'gitUser': instance.gitUser,
      'runtimeType': instance.$type,
    };

_$SyncFlowGotLastLocalCommitImpl _$$SyncFlowGotLastLocalCommitImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncFlowGotLastLocalCommitImpl(
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

Map<String, dynamic> _$$SyncFlowGotLastLocalCommitImplToJson(
        _$SyncFlowGotLastLocalCommitImpl instance) =>
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

_$SyncFlowGotProjectOriginUrlImpl _$$SyncFlowGotProjectOriginUrlImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncFlowGotProjectOriginUrlImpl(
      willLog: json['willLog'] as bool,
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      yamlInfo:
          CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
      gitUser: GitUser.fromJson(json['gitUser'] as Map<String, dynamic>),
      previousCommit:
          GitCommit.fromJson(json['previousCommit'] as Map<String, dynamic>),
      projectOriginUrl: json['projectOriginUrl'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SyncFlowGotProjectOriginUrlImplToJson(
        _$SyncFlowGotProjectOriginUrlImpl instance) =>
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

_$SyncFlowGotGitVariablesImpl _$$SyncFlowGotGitVariablesImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncFlowGotGitVariablesImpl(
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

Map<String, dynamic> _$$SyncFlowGotGitVariablesImplToJson(
        _$SyncFlowGotGitVariablesImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'yamlInfo': instance.yamlInfo,
      'gitVariables': instance.gitVariables,
      'runtimeType': instance.$type,
    };

_$SyncFlowExtractedProjectCodebaseImpl
    _$$SyncFlowExtractedProjectCodebaseImplFromJson(
            Map<String, dynamic> json) =>
        _$SyncFlowExtractedProjectCodebaseImpl(
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

Map<String, dynamic> _$$SyncFlowExtractedProjectCodebaseImplToJson(
        _$SyncFlowExtractedProjectCodebaseImpl instance) =>
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

_$SyncFlowExtractedBabelFunctionDeclarationsImpl
    _$$SyncFlowExtractedBabelFunctionDeclarationsImplFromJson(
            Map<String, dynamic> json) =>
        _$SyncFlowExtractedBabelFunctionDeclarationsImpl(
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
          declarationFunctions: (json['declarationFunctions'] as List<dynamic>)
              .map((e) => e as String)
              .toSet(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$SyncFlowExtractedBabelFunctionDeclarationsImplToJson(
        _$SyncFlowExtractedBabelFunctionDeclarationsImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'yamlInfo': instance.yamlInfo,
      'gitVariables': instance.gitVariables,
      'contextPaths': instance.contextPaths.toList(),
      'declarationFunctions': instance.declarationFunctions.toList(),
      'runtimeType': instance.$type,
    };

_$SyncFlowGeneratedBabelClassImpl _$$SyncFlowGeneratedBabelClassImplFromJson(
        Map<String, dynamic> json) =>
    _$SyncFlowGeneratedBabelClassImpl(
      willLog: json['willLog'] as bool,
      accountApiKey: json['accountApiKey'] as String,
      directoryPath: json['directoryPath'] as String,
      client: ApiClientEntity.fromJson(json['client'] as Map<String, dynamic>),
      yamlInfo:
          CodeBaseYamlInfo.fromJson(json['yamlInfo'] as Map<String, dynamic>),
      gitVariables:
          GitVariables.fromJson(json['gitVariables'] as Map<String, dynamic>),
      contextPaths: (json['contextPaths'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      declarationFunctions: (json['declarationFunctions'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      babelClass: json['babelClass'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$SyncFlowGeneratedBabelClassImplToJson(
        _$SyncFlowGeneratedBabelClassImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'yamlInfo': instance.yamlInfo,
      'gitVariables': instance.gitVariables,
      'contextPaths': instance.contextPaths.toList(),
      'declarationFunctions': instance.declarationFunctions.toList(),
      'babelClass': instance.babelClass,
      'runtimeType': instance.$type,
    };

_$SyncFlowWrittedBabelTextFileIntoDirectoryImpl
    _$$SyncFlowWrittedBabelTextFileIntoDirectoryImplFromJson(
            Map<String, dynamic> json) =>
        _$SyncFlowWrittedBabelTextFileIntoDirectoryImpl(
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
          declarationFunctions: (json['declarationFunctions'] as List<dynamic>)
              .map((e) => e as String)
              .toSet(),
          $type: json['runtimeType'] as String?,
        );

Map<String, dynamic> _$$SyncFlowWrittedBabelTextFileIntoDirectoryImplToJson(
        _$SyncFlowWrittedBabelTextFileIntoDirectoryImpl instance) =>
    <String, dynamic>{
      'willLog': instance.willLog,
      'accountApiKey': instance.accountApiKey,
      'directoryPath': instance.directoryPath,
      'client': instance.client,
      'yamlInfo': instance.yamlInfo,
      'gitVariables': instance.gitVariables,
      'contextPaths': instance.contextPaths.toList(),
      'declarationFunctions': instance.declarationFunctions.toList(),
      'runtimeType': instance.$type,
    };

_$SyncFlowCreatedProjectInGobabelServerImpl
    _$$SyncFlowCreatedProjectInGobabelServerImplFromJson(
            Map<String, dynamic> json) =>
        _$SyncFlowCreatedProjectInGobabelServerImpl(
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

Map<String, dynamic> _$$SyncFlowCreatedProjectInGobabelServerImplToJson(
        _$SyncFlowCreatedProjectInGobabelServerImpl instance) =>
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
