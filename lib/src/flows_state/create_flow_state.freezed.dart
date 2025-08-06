// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreateFlowState _$CreateFlowStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'initial':
      return CreateFlowInitial.fromJson(json);
    case 'createdClient':
      return CreateFlowCreatedClient.fromJson(json);
    case 'ensuredGit':
      return CreateFlowEnsureGit.fromJson(json);
    case 'gotCodeBaseYaml':
      return CreateFlowGotCodeBaseYaml.fromJson(json);
    case 'gotGitUser':
      return CreateFlowGotGitUser.fromJson(json);
    case 'gotLastLocalCommit':
      return CreateFlowGotLastLocalCommit.fromJson(json);
    case 'gotProjectOriginUrl':
      return CreateFlowGotProjectOriginUrl.fromJson(json);
    case 'gotGitVariables':
      return CreateFlowGotGitVariables.fromJson(json);
    case 'extractedProjectCodebase':
      return CreateFlowExtractedProjectCodebase.fromJson(json);
    case 'createdProjectInGobabelServer':
      return CreateFlowCreatedProjectInGobabelServer.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'CreateFlowState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$CreateFlowState {
  bool get willLog => throw _privateConstructorUsedError;
  String get accountApiKey => throw _privateConstructorUsedError;
  String get directoryPath => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool willLog, String accountApiKey, String directoryPath)
        initial,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        createdClient,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        ensuredGit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo)
        gotCodeBaseYaml,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser)
        gotGitUser,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)
        gotLastLocalCommit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)
        gotProjectOriginUrl,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)
        gotGitVariables,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        extractedProjectCodebase,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        createdProjectInGobabelServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowInitial value) initial,
    required TResult Function(CreateFlowCreatedClient value) createdClient,
    required TResult Function(CreateFlowEnsureGit value) ensuredGit,
    required TResult Function(CreateFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(CreateFlowGotGitUser value) gotGitUser,
    required TResult Function(CreateFlowGotLastLocalCommit value)
        gotLastLocalCommit,
    required TResult Function(CreateFlowGotProjectOriginUrl value)
        gotProjectOriginUrl,
    required TResult Function(CreateFlowGotGitVariables value) gotGitVariables,
    required TResult Function(CreateFlowExtractedProjectCodebase value)
        extractedProjectCodebase,
    required TResult Function(CreateFlowCreatedProjectInGobabelServer value)
        createdProjectInGobabelServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowInitial value)? initial,
    TResult? Function(CreateFlowCreatedClient value)? createdClient,
    TResult? Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult? Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult? Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult? Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowInitial value)? initial,
    TResult Function(CreateFlowCreatedClient value)? createdClient,
    TResult Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this CreateFlowState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateFlowStateCopyWith<CreateFlowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateFlowStateCopyWith<$Res> {
  factory $CreateFlowStateCopyWith(
          CreateFlowState value, $Res Function(CreateFlowState) then) =
      _$CreateFlowStateCopyWithImpl<$Res, CreateFlowState>;
  @useResult
  $Res call({bool willLog, String accountApiKey, String directoryPath});
}

/// @nodoc
class _$CreateFlowStateCopyWithImpl<$Res, $Val extends CreateFlowState>
    implements $CreateFlowStateCopyWith<$Res> {
  _$CreateFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? willLog = null,
    Object? accountApiKey = null,
    Object? directoryPath = null,
  }) {
    return _then(_value.copyWith(
      willLog: null == willLog
          ? _value.willLog
          : willLog // ignore: cast_nullable_to_non_nullable
              as bool,
      accountApiKey: null == accountApiKey
          ? _value.accountApiKey
          : accountApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      directoryPath: null == directoryPath
          ? _value.directoryPath
          : directoryPath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateFlowInitialImplCopyWith<$Res>
    implements $CreateFlowStateCopyWith<$Res> {
  factory _$$CreateFlowInitialImplCopyWith(_$CreateFlowInitialImpl value,
          $Res Function(_$CreateFlowInitialImpl) then) =
      __$$CreateFlowInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool willLog, String accountApiKey, String directoryPath});
}

/// @nodoc
class __$$CreateFlowInitialImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res, _$CreateFlowInitialImpl>
    implements _$$CreateFlowInitialImplCopyWith<$Res> {
  __$$CreateFlowInitialImplCopyWithImpl(_$CreateFlowInitialImpl _value,
      $Res Function(_$CreateFlowInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? willLog = null,
    Object? accountApiKey = null,
    Object? directoryPath = null,
  }) {
    return _then(_$CreateFlowInitialImpl(
      willLog: null == willLog
          ? _value.willLog
          : willLog // ignore: cast_nullable_to_non_nullable
              as bool,
      accountApiKey: null == accountApiKey
          ? _value.accountApiKey
          : accountApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      directoryPath: null == directoryPath
          ? _value.directoryPath
          : directoryPath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFlowInitialImpl extends CreateFlowInitial {
  _$CreateFlowInitialImpl(
      {required this.willLog,
      required this.accountApiKey,
      required this.directoryPath,
      final String? $type})
      : $type = $type ?? 'initial',
        super._();

  factory _$CreateFlowInitialImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateFlowInitialImplFromJson(json);

  @override
  final bool willLog;
  @override
  final String accountApiKey;
  @override
  final String directoryPath;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CreateFlowState.initial(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowInitialImpl &&
            (identical(other.willLog, willLog) || other.willLog == willLog) &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, willLog, accountApiKey, directoryPath);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowInitialImplCopyWith<_$CreateFlowInitialImpl> get copyWith =>
      __$$CreateFlowInitialImplCopyWithImpl<_$CreateFlowInitialImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool willLog, String accountApiKey, String directoryPath)
        initial,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        createdClient,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        ensuredGit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo)
        gotCodeBaseYaml,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser)
        gotGitUser,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)
        gotLastLocalCommit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)
        gotProjectOriginUrl,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)
        gotGitVariables,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        extractedProjectCodebase,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        createdProjectInGobabelServer,
  }) {
    return initial(willLog, accountApiKey, directoryPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
  }) {
    return initial?.call(willLog, accountApiKey, directoryPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(willLog, accountApiKey, directoryPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowInitial value) initial,
    required TResult Function(CreateFlowCreatedClient value) createdClient,
    required TResult Function(CreateFlowEnsureGit value) ensuredGit,
    required TResult Function(CreateFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(CreateFlowGotGitUser value) gotGitUser,
    required TResult Function(CreateFlowGotLastLocalCommit value)
        gotLastLocalCommit,
    required TResult Function(CreateFlowGotProjectOriginUrl value)
        gotProjectOriginUrl,
    required TResult Function(CreateFlowGotGitVariables value) gotGitVariables,
    required TResult Function(CreateFlowExtractedProjectCodebase value)
        extractedProjectCodebase,
    required TResult Function(CreateFlowCreatedProjectInGobabelServer value)
        createdProjectInGobabelServer,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowInitial value)? initial,
    TResult? Function(CreateFlowCreatedClient value)? createdClient,
    TResult? Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult? Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult? Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult? Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowInitial value)? initial,
    TResult Function(CreateFlowCreatedClient value)? createdClient,
    TResult Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFlowInitialImplToJson(
      this,
    );
  }
}

abstract class CreateFlowInitial extends CreateFlowState {
  factory CreateFlowInitial(
      {required final bool willLog,
      required final String accountApiKey,
      required final String directoryPath}) = _$CreateFlowInitialImpl;
  CreateFlowInitial._() : super._();

  factory CreateFlowInitial.fromJson(Map<String, dynamic> json) =
      _$CreateFlowInitialImpl.fromJson;

  @override
  bool get willLog;
  @override
  String get accountApiKey;
  @override
  String get directoryPath;

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFlowInitialImplCopyWith<_$CreateFlowInitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFlowCreatedClientImplCopyWith<$Res>
    implements $CreateFlowStateCopyWith<$Res> {
  factory _$$CreateFlowCreatedClientImplCopyWith(
          _$CreateFlowCreatedClientImpl value,
          $Res Function(_$CreateFlowCreatedClientImpl) then) =
      __$$CreateFlowCreatedClientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client});

  $ApiClientEntityCopyWith<$Res> get client;
}

/// @nodoc
class __$$CreateFlowCreatedClientImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res, _$CreateFlowCreatedClientImpl>
    implements _$$CreateFlowCreatedClientImplCopyWith<$Res> {
  __$$CreateFlowCreatedClientImplCopyWithImpl(
      _$CreateFlowCreatedClientImpl _value,
      $Res Function(_$CreateFlowCreatedClientImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? willLog = null,
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
  }) {
    return _then(_$CreateFlowCreatedClientImpl(
      willLog: null == willLog
          ? _value.willLog
          : willLog // ignore: cast_nullable_to_non_nullable
              as bool,
      accountApiKey: null == accountApiKey
          ? _value.accountApiKey
          : accountApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      directoryPath: null == directoryPath
          ? _value.directoryPath
          : directoryPath // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as ApiClientEntity,
    ));
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFlowCreatedClientImpl extends CreateFlowCreatedClient {
  _$CreateFlowCreatedClientImpl(
      {required this.willLog,
      required this.accountApiKey,
      required this.directoryPath,
      required this.client,
      final String? $type})
      : $type = $type ?? 'createdClient',
        super._();

  factory _$CreateFlowCreatedClientImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateFlowCreatedClientImplFromJson(json);

  @override
  final bool willLog;
  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  final ApiClientEntity client;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CreateFlowState.createdClient(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowCreatedClientImpl &&
            (identical(other.willLog, willLog) || other.willLog == willLog) &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.client, client) || other.client == client));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, willLog, accountApiKey, directoryPath, client);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowCreatedClientImplCopyWith<_$CreateFlowCreatedClientImpl>
      get copyWith => __$$CreateFlowCreatedClientImplCopyWithImpl<
          _$CreateFlowCreatedClientImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool willLog, String accountApiKey, String directoryPath)
        initial,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        createdClient,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        ensuredGit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo)
        gotCodeBaseYaml,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser)
        gotGitUser,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)
        gotLastLocalCommit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)
        gotProjectOriginUrl,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)
        gotGitVariables,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        extractedProjectCodebase,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        createdProjectInGobabelServer,
  }) {
    return createdClient(willLog, accountApiKey, directoryPath, client);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
  }) {
    return createdClient?.call(willLog, accountApiKey, directoryPath, client);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (createdClient != null) {
      return createdClient(willLog, accountApiKey, directoryPath, client);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowInitial value) initial,
    required TResult Function(CreateFlowCreatedClient value) createdClient,
    required TResult Function(CreateFlowEnsureGit value) ensuredGit,
    required TResult Function(CreateFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(CreateFlowGotGitUser value) gotGitUser,
    required TResult Function(CreateFlowGotLastLocalCommit value)
        gotLastLocalCommit,
    required TResult Function(CreateFlowGotProjectOriginUrl value)
        gotProjectOriginUrl,
    required TResult Function(CreateFlowGotGitVariables value) gotGitVariables,
    required TResult Function(CreateFlowExtractedProjectCodebase value)
        extractedProjectCodebase,
    required TResult Function(CreateFlowCreatedProjectInGobabelServer value)
        createdProjectInGobabelServer,
  }) {
    return createdClient(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowInitial value)? initial,
    TResult? Function(CreateFlowCreatedClient value)? createdClient,
    TResult? Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult? Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult? Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult? Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
  }) {
    return createdClient?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowInitial value)? initial,
    TResult Function(CreateFlowCreatedClient value)? createdClient,
    TResult Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (createdClient != null) {
      return createdClient(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFlowCreatedClientImplToJson(
      this,
    );
  }
}

abstract class CreateFlowCreatedClient extends CreateFlowState {
  factory CreateFlowCreatedClient(
      {required final bool willLog,
      required final String accountApiKey,
      required final String directoryPath,
      required final ApiClientEntity client}) = _$CreateFlowCreatedClientImpl;
  CreateFlowCreatedClient._() : super._();

  factory CreateFlowCreatedClient.fromJson(Map<String, dynamic> json) =
      _$CreateFlowCreatedClientImpl.fromJson;

  @override
  bool get willLog;
  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFlowCreatedClientImplCopyWith<_$CreateFlowCreatedClientImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFlowEnsureGitImplCopyWith<$Res>
    implements $CreateFlowStateCopyWith<$Res> {
  factory _$$CreateFlowEnsureGitImplCopyWith(_$CreateFlowEnsureGitImpl value,
          $Res Function(_$CreateFlowEnsureGitImpl) then) =
      __$$CreateFlowEnsureGitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client});

  $ApiClientEntityCopyWith<$Res> get client;
}

/// @nodoc
class __$$CreateFlowEnsureGitImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res, _$CreateFlowEnsureGitImpl>
    implements _$$CreateFlowEnsureGitImplCopyWith<$Res> {
  __$$CreateFlowEnsureGitImplCopyWithImpl(_$CreateFlowEnsureGitImpl _value,
      $Res Function(_$CreateFlowEnsureGitImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? willLog = null,
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
  }) {
    return _then(_$CreateFlowEnsureGitImpl(
      willLog: null == willLog
          ? _value.willLog
          : willLog // ignore: cast_nullable_to_non_nullable
              as bool,
      accountApiKey: null == accountApiKey
          ? _value.accountApiKey
          : accountApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      directoryPath: null == directoryPath
          ? _value.directoryPath
          : directoryPath // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as ApiClientEntity,
    ));
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFlowEnsureGitImpl extends CreateFlowEnsureGit {
  _$CreateFlowEnsureGitImpl(
      {required this.willLog,
      required this.accountApiKey,
      required this.directoryPath,
      required this.client,
      final String? $type})
      : $type = $type ?? 'ensuredGit',
        super._();

  factory _$CreateFlowEnsureGitImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateFlowEnsureGitImplFromJson(json);

  @override
  final bool willLog;
  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  final ApiClientEntity client;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CreateFlowState.ensuredGit(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowEnsureGitImpl &&
            (identical(other.willLog, willLog) || other.willLog == willLog) &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.client, client) || other.client == client));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, willLog, accountApiKey, directoryPath, client);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowEnsureGitImplCopyWith<_$CreateFlowEnsureGitImpl> get copyWith =>
      __$$CreateFlowEnsureGitImplCopyWithImpl<_$CreateFlowEnsureGitImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool willLog, String accountApiKey, String directoryPath)
        initial,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        createdClient,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        ensuredGit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo)
        gotCodeBaseYaml,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser)
        gotGitUser,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)
        gotLastLocalCommit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)
        gotProjectOriginUrl,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)
        gotGitVariables,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        extractedProjectCodebase,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        createdProjectInGobabelServer,
  }) {
    return ensuredGit(willLog, accountApiKey, directoryPath, client);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
  }) {
    return ensuredGit?.call(willLog, accountApiKey, directoryPath, client);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (ensuredGit != null) {
      return ensuredGit(willLog, accountApiKey, directoryPath, client);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowInitial value) initial,
    required TResult Function(CreateFlowCreatedClient value) createdClient,
    required TResult Function(CreateFlowEnsureGit value) ensuredGit,
    required TResult Function(CreateFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(CreateFlowGotGitUser value) gotGitUser,
    required TResult Function(CreateFlowGotLastLocalCommit value)
        gotLastLocalCommit,
    required TResult Function(CreateFlowGotProjectOriginUrl value)
        gotProjectOriginUrl,
    required TResult Function(CreateFlowGotGitVariables value) gotGitVariables,
    required TResult Function(CreateFlowExtractedProjectCodebase value)
        extractedProjectCodebase,
    required TResult Function(CreateFlowCreatedProjectInGobabelServer value)
        createdProjectInGobabelServer,
  }) {
    return ensuredGit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowInitial value)? initial,
    TResult? Function(CreateFlowCreatedClient value)? createdClient,
    TResult? Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult? Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult? Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult? Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
  }) {
    return ensuredGit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowInitial value)? initial,
    TResult Function(CreateFlowCreatedClient value)? createdClient,
    TResult Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (ensuredGit != null) {
      return ensuredGit(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFlowEnsureGitImplToJson(
      this,
    );
  }
}

abstract class CreateFlowEnsureGit extends CreateFlowState {
  factory CreateFlowEnsureGit(
      {required final bool willLog,
      required final String accountApiKey,
      required final String directoryPath,
      required final ApiClientEntity client}) = _$CreateFlowEnsureGitImpl;
  CreateFlowEnsureGit._() : super._();

  factory CreateFlowEnsureGit.fromJson(Map<String, dynamic> json) =
      _$CreateFlowEnsureGitImpl.fromJson;

  @override
  bool get willLog;
  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFlowEnsureGitImplCopyWith<_$CreateFlowEnsureGitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFlowGotCodeBaseYamlImplCopyWith<$Res>
    implements $CreateFlowStateCopyWith<$Res> {
  factory _$$CreateFlowGotCodeBaseYamlImplCopyWith(
          _$CreateFlowGotCodeBaseYamlImpl value,
          $Res Function(_$CreateFlowGotCodeBaseYamlImpl) then) =
      __$$CreateFlowGotCodeBaseYamlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo});

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
}

/// @nodoc
class __$$CreateFlowGotCodeBaseYamlImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res, _$CreateFlowGotCodeBaseYamlImpl>
    implements _$$CreateFlowGotCodeBaseYamlImplCopyWith<$Res> {
  __$$CreateFlowGotCodeBaseYamlImplCopyWithImpl(
      _$CreateFlowGotCodeBaseYamlImpl _value,
      $Res Function(_$CreateFlowGotCodeBaseYamlImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? willLog = null,
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
    Object? yamlInfo = null,
  }) {
    return _then(_$CreateFlowGotCodeBaseYamlImpl(
      willLog: null == willLog
          ? _value.willLog
          : willLog // ignore: cast_nullable_to_non_nullable
              as bool,
      accountApiKey: null == accountApiKey
          ? _value.accountApiKey
          : accountApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      directoryPath: null == directoryPath
          ? _value.directoryPath
          : directoryPath // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as ApiClientEntity,
      yamlInfo: null == yamlInfo
          ? _value.yamlInfo
          : yamlInfo // ignore: cast_nullable_to_non_nullable
              as CodeBaseYamlInfo,
    ));
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFlowGotCodeBaseYamlImpl extends CreateFlowGotCodeBaseYaml {
  _$CreateFlowGotCodeBaseYamlImpl(
      {required this.willLog,
      required this.accountApiKey,
      required this.directoryPath,
      required this.client,
      required this.yamlInfo,
      final String? $type})
      : $type = $type ?? 'gotCodeBaseYaml',
        super._();

  factory _$CreateFlowGotCodeBaseYamlImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateFlowGotCodeBaseYamlImplFromJson(json);

  @override
  final bool willLog;
  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CreateFlowState.gotCodeBaseYaml(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowGotCodeBaseYamlImpl &&
            (identical(other.willLog, willLog) || other.willLog == willLog) &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, willLog, accountApiKey, directoryPath, client, yamlInfo);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowGotCodeBaseYamlImplCopyWith<_$CreateFlowGotCodeBaseYamlImpl>
      get copyWith => __$$CreateFlowGotCodeBaseYamlImplCopyWithImpl<
          _$CreateFlowGotCodeBaseYamlImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool willLog, String accountApiKey, String directoryPath)
        initial,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        createdClient,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        ensuredGit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo)
        gotCodeBaseYaml,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser)
        gotGitUser,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)
        gotLastLocalCommit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)
        gotProjectOriginUrl,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)
        gotGitVariables,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        extractedProjectCodebase,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        createdProjectInGobabelServer,
  }) {
    return gotCodeBaseYaml(
        willLog, accountApiKey, directoryPath, client, yamlInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
  }) {
    return gotCodeBaseYaml?.call(
        willLog, accountApiKey, directoryPath, client, yamlInfo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (gotCodeBaseYaml != null) {
      return gotCodeBaseYaml(
          willLog, accountApiKey, directoryPath, client, yamlInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowInitial value) initial,
    required TResult Function(CreateFlowCreatedClient value) createdClient,
    required TResult Function(CreateFlowEnsureGit value) ensuredGit,
    required TResult Function(CreateFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(CreateFlowGotGitUser value) gotGitUser,
    required TResult Function(CreateFlowGotLastLocalCommit value)
        gotLastLocalCommit,
    required TResult Function(CreateFlowGotProjectOriginUrl value)
        gotProjectOriginUrl,
    required TResult Function(CreateFlowGotGitVariables value) gotGitVariables,
    required TResult Function(CreateFlowExtractedProjectCodebase value)
        extractedProjectCodebase,
    required TResult Function(CreateFlowCreatedProjectInGobabelServer value)
        createdProjectInGobabelServer,
  }) {
    return gotCodeBaseYaml(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowInitial value)? initial,
    TResult? Function(CreateFlowCreatedClient value)? createdClient,
    TResult? Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult? Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult? Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult? Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
  }) {
    return gotCodeBaseYaml?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowInitial value)? initial,
    TResult Function(CreateFlowCreatedClient value)? createdClient,
    TResult Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (gotCodeBaseYaml != null) {
      return gotCodeBaseYaml(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFlowGotCodeBaseYamlImplToJson(
      this,
    );
  }
}

abstract class CreateFlowGotCodeBaseYaml extends CreateFlowState {
  factory CreateFlowGotCodeBaseYaml(
          {required final bool willLog,
          required final String accountApiKey,
          required final String directoryPath,
          required final ApiClientEntity client,
          required final CodeBaseYamlInfo yamlInfo}) =
      _$CreateFlowGotCodeBaseYamlImpl;
  CreateFlowGotCodeBaseYaml._() : super._();

  factory CreateFlowGotCodeBaseYaml.fromJson(Map<String, dynamic> json) =
      _$CreateFlowGotCodeBaseYamlImpl.fromJson;

  @override
  bool get willLog;
  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFlowGotCodeBaseYamlImplCopyWith<_$CreateFlowGotCodeBaseYamlImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFlowGotGitUserImplCopyWith<$Res>
    implements $CreateFlowStateCopyWith<$Res> {
  factory _$$CreateFlowGotGitUserImplCopyWith(_$CreateFlowGotGitUserImpl value,
          $Res Function(_$CreateFlowGotGitUserImpl) then) =
      __$$CreateFlowGotGitUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser});

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
}

/// @nodoc
class __$$CreateFlowGotGitUserImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res, _$CreateFlowGotGitUserImpl>
    implements _$$CreateFlowGotGitUserImplCopyWith<$Res> {
  __$$CreateFlowGotGitUserImplCopyWithImpl(_$CreateFlowGotGitUserImpl _value,
      $Res Function(_$CreateFlowGotGitUserImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? willLog = null,
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitUser = null,
  }) {
    return _then(_$CreateFlowGotGitUserImpl(
      willLog: null == willLog
          ? _value.willLog
          : willLog // ignore: cast_nullable_to_non_nullable
              as bool,
      accountApiKey: null == accountApiKey
          ? _value.accountApiKey
          : accountApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      directoryPath: null == directoryPath
          ? _value.directoryPath
          : directoryPath // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as ApiClientEntity,
      yamlInfo: null == yamlInfo
          ? _value.yamlInfo
          : yamlInfo // ignore: cast_nullable_to_non_nullable
              as CodeBaseYamlInfo,
      gitUser: null == gitUser
          ? _value.gitUser
          : gitUser // ignore: cast_nullable_to_non_nullable
              as GitUser,
    ));
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFlowGotGitUserImpl extends CreateFlowGotGitUser {
  _$CreateFlowGotGitUserImpl(
      {required this.willLog,
      required this.accountApiKey,
      required this.directoryPath,
      required this.client,
      required this.yamlInfo,
      required this.gitUser,
      final String? $type})
      : $type = $type ?? 'gotGitUser',
        super._();

  factory _$CreateFlowGotGitUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateFlowGotGitUserImplFromJson(json);

  @override
  final bool willLog;
  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitUser gitUser;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CreateFlowState.gotGitUser(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitUser: $gitUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowGotGitUserImpl &&
            (identical(other.willLog, willLog) || other.willLog == willLog) &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitUser, gitUser) || other.gitUser == gitUser));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, willLog, accountApiKey,
      directoryPath, client, yamlInfo, gitUser);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowGotGitUserImplCopyWith<_$CreateFlowGotGitUserImpl>
      get copyWith =>
          __$$CreateFlowGotGitUserImplCopyWithImpl<_$CreateFlowGotGitUserImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool willLog, String accountApiKey, String directoryPath)
        initial,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        createdClient,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        ensuredGit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo)
        gotCodeBaseYaml,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser)
        gotGitUser,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)
        gotLastLocalCommit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)
        gotProjectOriginUrl,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)
        gotGitVariables,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        extractedProjectCodebase,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        createdProjectInGobabelServer,
  }) {
    return gotGitUser(
        willLog, accountApiKey, directoryPath, client, yamlInfo, gitUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
  }) {
    return gotGitUser?.call(
        willLog, accountApiKey, directoryPath, client, yamlInfo, gitUser);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (gotGitUser != null) {
      return gotGitUser(
          willLog, accountApiKey, directoryPath, client, yamlInfo, gitUser);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowInitial value) initial,
    required TResult Function(CreateFlowCreatedClient value) createdClient,
    required TResult Function(CreateFlowEnsureGit value) ensuredGit,
    required TResult Function(CreateFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(CreateFlowGotGitUser value) gotGitUser,
    required TResult Function(CreateFlowGotLastLocalCommit value)
        gotLastLocalCommit,
    required TResult Function(CreateFlowGotProjectOriginUrl value)
        gotProjectOriginUrl,
    required TResult Function(CreateFlowGotGitVariables value) gotGitVariables,
    required TResult Function(CreateFlowExtractedProjectCodebase value)
        extractedProjectCodebase,
    required TResult Function(CreateFlowCreatedProjectInGobabelServer value)
        createdProjectInGobabelServer,
  }) {
    return gotGitUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowInitial value)? initial,
    TResult? Function(CreateFlowCreatedClient value)? createdClient,
    TResult? Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult? Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult? Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult? Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
  }) {
    return gotGitUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowInitial value)? initial,
    TResult Function(CreateFlowCreatedClient value)? createdClient,
    TResult Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (gotGitUser != null) {
      return gotGitUser(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFlowGotGitUserImplToJson(
      this,
    );
  }
}

abstract class CreateFlowGotGitUser extends CreateFlowState {
  factory CreateFlowGotGitUser(
      {required final bool willLog,
      required final String accountApiKey,
      required final String directoryPath,
      required final ApiClientEntity client,
      required final CodeBaseYamlInfo yamlInfo,
      required final GitUser gitUser}) = _$CreateFlowGotGitUserImpl;
  CreateFlowGotGitUser._() : super._();

  factory CreateFlowGotGitUser.fromJson(Map<String, dynamic> json) =
      _$CreateFlowGotGitUserImpl.fromJson;

  @override
  bool get willLog;
  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitUser get gitUser;

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFlowGotGitUserImplCopyWith<_$CreateFlowGotGitUserImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFlowGotLastLocalCommitImplCopyWith<$Res>
    implements $CreateFlowStateCopyWith<$Res> {
  factory _$$CreateFlowGotLastLocalCommitImplCopyWith(
          _$CreateFlowGotLastLocalCommitImpl value,
          $Res Function(_$CreateFlowGotLastLocalCommitImpl) then) =
      __$$CreateFlowGotLastLocalCommitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit});

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
}

/// @nodoc
class __$$CreateFlowGotLastLocalCommitImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res,
        _$CreateFlowGotLastLocalCommitImpl>
    implements _$$CreateFlowGotLastLocalCommitImplCopyWith<$Res> {
  __$$CreateFlowGotLastLocalCommitImplCopyWithImpl(
      _$CreateFlowGotLastLocalCommitImpl _value,
      $Res Function(_$CreateFlowGotLastLocalCommitImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? willLog = null,
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitUser = null,
    Object? previousCommit = null,
  }) {
    return _then(_$CreateFlowGotLastLocalCommitImpl(
      willLog: null == willLog
          ? _value.willLog
          : willLog // ignore: cast_nullable_to_non_nullable
              as bool,
      accountApiKey: null == accountApiKey
          ? _value.accountApiKey
          : accountApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      directoryPath: null == directoryPath
          ? _value.directoryPath
          : directoryPath // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as ApiClientEntity,
      yamlInfo: null == yamlInfo
          ? _value.yamlInfo
          : yamlInfo // ignore: cast_nullable_to_non_nullable
              as CodeBaseYamlInfo,
      gitUser: null == gitUser
          ? _value.gitUser
          : gitUser // ignore: cast_nullable_to_non_nullable
              as GitUser,
      previousCommit: null == previousCommit
          ? _value.previousCommit
          : previousCommit // ignore: cast_nullable_to_non_nullable
              as GitCommit,
    ));
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFlowGotLastLocalCommitImpl extends CreateFlowGotLastLocalCommit {
  _$CreateFlowGotLastLocalCommitImpl(
      {required this.willLog,
      required this.accountApiKey,
      required this.directoryPath,
      required this.client,
      required this.yamlInfo,
      required this.gitUser,
      required this.previousCommit,
      final String? $type})
      : $type = $type ?? 'gotLastLocalCommit',
        super._();

  factory _$CreateFlowGotLastLocalCommitImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateFlowGotLastLocalCommitImplFromJson(json);

  @override
  final bool willLog;
  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitUser gitUser;
  @override
  final GitCommit previousCommit;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CreateFlowState.gotLastLocalCommit(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitUser: $gitUser, previousCommit: $previousCommit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowGotLastLocalCommitImpl &&
            (identical(other.willLog, willLog) || other.willLog == willLog) &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitUser, gitUser) || other.gitUser == gitUser) &&
            (identical(other.previousCommit, previousCommit) ||
                other.previousCommit == previousCommit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, willLog, accountApiKey,
      directoryPath, client, yamlInfo, gitUser, previousCommit);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowGotLastLocalCommitImplCopyWith<
          _$CreateFlowGotLastLocalCommitImpl>
      get copyWith => __$$CreateFlowGotLastLocalCommitImplCopyWithImpl<
          _$CreateFlowGotLastLocalCommitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool willLog, String accountApiKey, String directoryPath)
        initial,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        createdClient,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        ensuredGit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo)
        gotCodeBaseYaml,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser)
        gotGitUser,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)
        gotLastLocalCommit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)
        gotProjectOriginUrl,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)
        gotGitVariables,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        extractedProjectCodebase,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        createdProjectInGobabelServer,
  }) {
    return gotLastLocalCommit(willLog, accountApiKey, directoryPath, client,
        yamlInfo, gitUser, previousCommit);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
  }) {
    return gotLastLocalCommit?.call(willLog, accountApiKey, directoryPath,
        client, yamlInfo, gitUser, previousCommit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (gotLastLocalCommit != null) {
      return gotLastLocalCommit(willLog, accountApiKey, directoryPath, client,
          yamlInfo, gitUser, previousCommit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowInitial value) initial,
    required TResult Function(CreateFlowCreatedClient value) createdClient,
    required TResult Function(CreateFlowEnsureGit value) ensuredGit,
    required TResult Function(CreateFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(CreateFlowGotGitUser value) gotGitUser,
    required TResult Function(CreateFlowGotLastLocalCommit value)
        gotLastLocalCommit,
    required TResult Function(CreateFlowGotProjectOriginUrl value)
        gotProjectOriginUrl,
    required TResult Function(CreateFlowGotGitVariables value) gotGitVariables,
    required TResult Function(CreateFlowExtractedProjectCodebase value)
        extractedProjectCodebase,
    required TResult Function(CreateFlowCreatedProjectInGobabelServer value)
        createdProjectInGobabelServer,
  }) {
    return gotLastLocalCommit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowInitial value)? initial,
    TResult? Function(CreateFlowCreatedClient value)? createdClient,
    TResult? Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult? Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult? Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult? Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
  }) {
    return gotLastLocalCommit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowInitial value)? initial,
    TResult Function(CreateFlowCreatedClient value)? createdClient,
    TResult Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (gotLastLocalCommit != null) {
      return gotLastLocalCommit(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFlowGotLastLocalCommitImplToJson(
      this,
    );
  }
}

abstract class CreateFlowGotLastLocalCommit extends CreateFlowState {
  factory CreateFlowGotLastLocalCommit(
          {required final bool willLog,
          required final String accountApiKey,
          required final String directoryPath,
          required final ApiClientEntity client,
          required final CodeBaseYamlInfo yamlInfo,
          required final GitUser gitUser,
          required final GitCommit previousCommit}) =
      _$CreateFlowGotLastLocalCommitImpl;
  CreateFlowGotLastLocalCommit._() : super._();

  factory CreateFlowGotLastLocalCommit.fromJson(Map<String, dynamic> json) =
      _$CreateFlowGotLastLocalCommitImpl.fromJson;

  @override
  bool get willLog;
  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitUser get gitUser;
  GitCommit get previousCommit;

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFlowGotLastLocalCommitImplCopyWith<
          _$CreateFlowGotLastLocalCommitImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFlowGotProjectOriginUrlImplCopyWith<$Res>
    implements $CreateFlowStateCopyWith<$Res> {
  factory _$$CreateFlowGotProjectOriginUrlImplCopyWith(
          _$CreateFlowGotProjectOriginUrlImpl value,
          $Res Function(_$CreateFlowGotProjectOriginUrlImpl) then) =
      __$$CreateFlowGotProjectOriginUrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl});

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
}

/// @nodoc
class __$$CreateFlowGotProjectOriginUrlImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res,
        _$CreateFlowGotProjectOriginUrlImpl>
    implements _$$CreateFlowGotProjectOriginUrlImplCopyWith<$Res> {
  __$$CreateFlowGotProjectOriginUrlImplCopyWithImpl(
      _$CreateFlowGotProjectOriginUrlImpl _value,
      $Res Function(_$CreateFlowGotProjectOriginUrlImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? willLog = null,
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitUser = null,
    Object? previousCommit = null,
    Object? projectOriginUrl = null,
  }) {
    return _then(_$CreateFlowGotProjectOriginUrlImpl(
      willLog: null == willLog
          ? _value.willLog
          : willLog // ignore: cast_nullable_to_non_nullable
              as bool,
      accountApiKey: null == accountApiKey
          ? _value.accountApiKey
          : accountApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      directoryPath: null == directoryPath
          ? _value.directoryPath
          : directoryPath // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as ApiClientEntity,
      yamlInfo: null == yamlInfo
          ? _value.yamlInfo
          : yamlInfo // ignore: cast_nullable_to_non_nullable
              as CodeBaseYamlInfo,
      gitUser: null == gitUser
          ? _value.gitUser
          : gitUser // ignore: cast_nullable_to_non_nullable
              as GitUser,
      previousCommit: null == previousCommit
          ? _value.previousCommit
          : previousCommit // ignore: cast_nullable_to_non_nullable
              as GitCommit,
      projectOriginUrl: null == projectOriginUrl
          ? _value.projectOriginUrl
          : projectOriginUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFlowGotProjectOriginUrlImpl
    extends CreateFlowGotProjectOriginUrl {
  _$CreateFlowGotProjectOriginUrlImpl(
      {required this.willLog,
      required this.accountApiKey,
      required this.directoryPath,
      required this.client,
      required this.yamlInfo,
      required this.gitUser,
      required this.previousCommit,
      required this.projectOriginUrl,
      final String? $type})
      : $type = $type ?? 'gotProjectOriginUrl',
        super._();

  factory _$CreateFlowGotProjectOriginUrlImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateFlowGotProjectOriginUrlImplFromJson(json);

  @override
  final bool willLog;
  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitUser gitUser;
  @override
  final GitCommit previousCommit;
  @override
  final String projectOriginUrl;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CreateFlowState.gotProjectOriginUrl(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitUser: $gitUser, previousCommit: $previousCommit, projectOriginUrl: $projectOriginUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowGotProjectOriginUrlImpl &&
            (identical(other.willLog, willLog) || other.willLog == willLog) &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitUser, gitUser) || other.gitUser == gitUser) &&
            (identical(other.previousCommit, previousCommit) ||
                other.previousCommit == previousCommit) &&
            (identical(other.projectOriginUrl, projectOriginUrl) ||
                other.projectOriginUrl == projectOriginUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitUser,
      previousCommit,
      projectOriginUrl);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowGotProjectOriginUrlImplCopyWith<
          _$CreateFlowGotProjectOriginUrlImpl>
      get copyWith => __$$CreateFlowGotProjectOriginUrlImplCopyWithImpl<
          _$CreateFlowGotProjectOriginUrlImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool willLog, String accountApiKey, String directoryPath)
        initial,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        createdClient,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        ensuredGit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo)
        gotCodeBaseYaml,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser)
        gotGitUser,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)
        gotLastLocalCommit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)
        gotProjectOriginUrl,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)
        gotGitVariables,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        extractedProjectCodebase,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        createdProjectInGobabelServer,
  }) {
    return gotProjectOriginUrl(willLog, accountApiKey, directoryPath, client,
        yamlInfo, gitUser, previousCommit, projectOriginUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
  }) {
    return gotProjectOriginUrl?.call(willLog, accountApiKey, directoryPath,
        client, yamlInfo, gitUser, previousCommit, projectOriginUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (gotProjectOriginUrl != null) {
      return gotProjectOriginUrl(willLog, accountApiKey, directoryPath, client,
          yamlInfo, gitUser, previousCommit, projectOriginUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowInitial value) initial,
    required TResult Function(CreateFlowCreatedClient value) createdClient,
    required TResult Function(CreateFlowEnsureGit value) ensuredGit,
    required TResult Function(CreateFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(CreateFlowGotGitUser value) gotGitUser,
    required TResult Function(CreateFlowGotLastLocalCommit value)
        gotLastLocalCommit,
    required TResult Function(CreateFlowGotProjectOriginUrl value)
        gotProjectOriginUrl,
    required TResult Function(CreateFlowGotGitVariables value) gotGitVariables,
    required TResult Function(CreateFlowExtractedProjectCodebase value)
        extractedProjectCodebase,
    required TResult Function(CreateFlowCreatedProjectInGobabelServer value)
        createdProjectInGobabelServer,
  }) {
    return gotProjectOriginUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowInitial value)? initial,
    TResult? Function(CreateFlowCreatedClient value)? createdClient,
    TResult? Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult? Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult? Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult? Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
  }) {
    return gotProjectOriginUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowInitial value)? initial,
    TResult Function(CreateFlowCreatedClient value)? createdClient,
    TResult Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (gotProjectOriginUrl != null) {
      return gotProjectOriginUrl(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFlowGotProjectOriginUrlImplToJson(
      this,
    );
  }
}

abstract class CreateFlowGotProjectOriginUrl extends CreateFlowState {
  factory CreateFlowGotProjectOriginUrl(
          {required final bool willLog,
          required final String accountApiKey,
          required final String directoryPath,
          required final ApiClientEntity client,
          required final CodeBaseYamlInfo yamlInfo,
          required final GitUser gitUser,
          required final GitCommit previousCommit,
          required final String projectOriginUrl}) =
      _$CreateFlowGotProjectOriginUrlImpl;
  CreateFlowGotProjectOriginUrl._() : super._();

  factory CreateFlowGotProjectOriginUrl.fromJson(Map<String, dynamic> json) =
      _$CreateFlowGotProjectOriginUrlImpl.fromJson;

  @override
  bool get willLog;
  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitUser get gitUser;
  GitCommit get previousCommit;
  String get projectOriginUrl;

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFlowGotProjectOriginUrlImplCopyWith<
          _$CreateFlowGotProjectOriginUrlImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFlowGotGitVariablesImplCopyWith<$Res>
    implements $CreateFlowStateCopyWith<$Res> {
  factory _$$CreateFlowGotGitVariablesImplCopyWith(
          _$CreateFlowGotGitVariablesImpl value,
          $Res Function(_$CreateFlowGotGitVariablesImpl) then) =
      __$$CreateFlowGotGitVariablesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables});

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
}

/// @nodoc
class __$$CreateFlowGotGitVariablesImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res, _$CreateFlowGotGitVariablesImpl>
    implements _$$CreateFlowGotGitVariablesImplCopyWith<$Res> {
  __$$CreateFlowGotGitVariablesImplCopyWithImpl(
      _$CreateFlowGotGitVariablesImpl _value,
      $Res Function(_$CreateFlowGotGitVariablesImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? willLog = null,
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitVariables = null,
  }) {
    return _then(_$CreateFlowGotGitVariablesImpl(
      willLog: null == willLog
          ? _value.willLog
          : willLog // ignore: cast_nullable_to_non_nullable
              as bool,
      accountApiKey: null == accountApiKey
          ? _value.accountApiKey
          : accountApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      directoryPath: null == directoryPath
          ? _value.directoryPath
          : directoryPath // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as ApiClientEntity,
      yamlInfo: null == yamlInfo
          ? _value.yamlInfo
          : yamlInfo // ignore: cast_nullable_to_non_nullable
              as CodeBaseYamlInfo,
      gitVariables: null == gitVariables
          ? _value.gitVariables
          : gitVariables // ignore: cast_nullable_to_non_nullable
              as GitVariables,
    ));
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GitVariablesCopyWith<$Res> get gitVariables {
    return $GitVariablesCopyWith<$Res>(_value.gitVariables, (value) {
      return _then(_value.copyWith(gitVariables: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFlowGotGitVariablesImpl extends CreateFlowGotGitVariables {
  _$CreateFlowGotGitVariablesImpl(
      {required this.willLog,
      required this.accountApiKey,
      required this.directoryPath,
      required this.client,
      required this.yamlInfo,
      required this.gitVariables,
      final String? $type})
      : $type = $type ?? 'gotGitVariables',
        super._();

  factory _$CreateFlowGotGitVariablesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreateFlowGotGitVariablesImplFromJson(json);

  @override
  final bool willLog;
  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitVariables gitVariables;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CreateFlowState.gotGitVariables(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowGotGitVariablesImpl &&
            (identical(other.willLog, willLog) || other.willLog == willLog) &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitVariables, gitVariables) ||
                other.gitVariables == gitVariables));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, willLog, accountApiKey,
      directoryPath, client, yamlInfo, gitVariables);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowGotGitVariablesImplCopyWith<_$CreateFlowGotGitVariablesImpl>
      get copyWith => __$$CreateFlowGotGitVariablesImplCopyWithImpl<
          _$CreateFlowGotGitVariablesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool willLog, String accountApiKey, String directoryPath)
        initial,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        createdClient,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        ensuredGit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo)
        gotCodeBaseYaml,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser)
        gotGitUser,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)
        gotLastLocalCommit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)
        gotProjectOriginUrl,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)
        gotGitVariables,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        extractedProjectCodebase,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        createdProjectInGobabelServer,
  }) {
    return gotGitVariables(
        willLog, accountApiKey, directoryPath, client, yamlInfo, gitVariables);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
  }) {
    return gotGitVariables?.call(
        willLog, accountApiKey, directoryPath, client, yamlInfo, gitVariables);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (gotGitVariables != null) {
      return gotGitVariables(willLog, accountApiKey, directoryPath, client,
          yamlInfo, gitVariables);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowInitial value) initial,
    required TResult Function(CreateFlowCreatedClient value) createdClient,
    required TResult Function(CreateFlowEnsureGit value) ensuredGit,
    required TResult Function(CreateFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(CreateFlowGotGitUser value) gotGitUser,
    required TResult Function(CreateFlowGotLastLocalCommit value)
        gotLastLocalCommit,
    required TResult Function(CreateFlowGotProjectOriginUrl value)
        gotProjectOriginUrl,
    required TResult Function(CreateFlowGotGitVariables value) gotGitVariables,
    required TResult Function(CreateFlowExtractedProjectCodebase value)
        extractedProjectCodebase,
    required TResult Function(CreateFlowCreatedProjectInGobabelServer value)
        createdProjectInGobabelServer,
  }) {
    return gotGitVariables(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowInitial value)? initial,
    TResult? Function(CreateFlowCreatedClient value)? createdClient,
    TResult? Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult? Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult? Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult? Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
  }) {
    return gotGitVariables?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowInitial value)? initial,
    TResult Function(CreateFlowCreatedClient value)? createdClient,
    TResult Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (gotGitVariables != null) {
      return gotGitVariables(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFlowGotGitVariablesImplToJson(
      this,
    );
  }
}

abstract class CreateFlowGotGitVariables extends CreateFlowState {
  factory CreateFlowGotGitVariables(
          {required final bool willLog,
          required final String accountApiKey,
          required final String directoryPath,
          required final ApiClientEntity client,
          required final CodeBaseYamlInfo yamlInfo,
          required final GitVariables gitVariables}) =
      _$CreateFlowGotGitVariablesImpl;
  CreateFlowGotGitVariables._() : super._();

  factory CreateFlowGotGitVariables.fromJson(Map<String, dynamic> json) =
      _$CreateFlowGotGitVariablesImpl.fromJson;

  @override
  bool get willLog;
  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitVariables get gitVariables;

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFlowGotGitVariablesImplCopyWith<_$CreateFlowGotGitVariablesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFlowExtractedProjectCodebaseImplCopyWith<$Res>
    implements $CreateFlowStateCopyWith<$Res> {
  factory _$$CreateFlowExtractedProjectCodebaseImplCopyWith(
          _$CreateFlowExtractedProjectCodebaseImpl value,
          $Res Function(_$CreateFlowExtractedProjectCodebaseImpl) then) =
      __$$CreateFlowExtractedProjectCodebaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths});

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
}

/// @nodoc
class __$$CreateFlowExtractedProjectCodebaseImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res,
        _$CreateFlowExtractedProjectCodebaseImpl>
    implements _$$CreateFlowExtractedProjectCodebaseImplCopyWith<$Res> {
  __$$CreateFlowExtractedProjectCodebaseImplCopyWithImpl(
      _$CreateFlowExtractedProjectCodebaseImpl _value,
      $Res Function(_$CreateFlowExtractedProjectCodebaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? willLog = null,
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitVariables = null,
    Object? contextPaths = null,
  }) {
    return _then(_$CreateFlowExtractedProjectCodebaseImpl(
      willLog: null == willLog
          ? _value.willLog
          : willLog // ignore: cast_nullable_to_non_nullable
              as bool,
      accountApiKey: null == accountApiKey
          ? _value.accountApiKey
          : accountApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      directoryPath: null == directoryPath
          ? _value.directoryPath
          : directoryPath // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as ApiClientEntity,
      yamlInfo: null == yamlInfo
          ? _value.yamlInfo
          : yamlInfo // ignore: cast_nullable_to_non_nullable
              as CodeBaseYamlInfo,
      gitVariables: null == gitVariables
          ? _value.gitVariables
          : gitVariables // ignore: cast_nullable_to_non_nullable
              as GitVariables,
      contextPaths: null == contextPaths
          ? _value._contextPaths
          : contextPaths // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GitVariablesCopyWith<$Res> get gitVariables {
    return $GitVariablesCopyWith<$Res>(_value.gitVariables, (value) {
      return _then(_value.copyWith(gitVariables: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFlowExtractedProjectCodebaseImpl
    extends CreateFlowExtractedProjectCodebase {
  _$CreateFlowExtractedProjectCodebaseImpl(
      {required this.willLog,
      required this.accountApiKey,
      required this.directoryPath,
      required this.client,
      required this.yamlInfo,
      required this.gitVariables,
      required final Set<String> contextPaths,
      final String? $type})
      : _contextPaths = contextPaths,
        $type = $type ?? 'extractedProjectCodebase',
        super._();

  factory _$CreateFlowExtractedProjectCodebaseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateFlowExtractedProjectCodebaseImplFromJson(json);

  @override
  final bool willLog;
  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitVariables gitVariables;
  final Set<String> _contextPaths;
  @override
  Set<String> get contextPaths {
    if (_contextPaths is EqualUnmodifiableSetView) return _contextPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_contextPaths);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CreateFlowState.extractedProjectCodebase(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables, contextPaths: $contextPaths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowExtractedProjectCodebaseImpl &&
            (identical(other.willLog, willLog) || other.willLog == willLog) &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitVariables, gitVariables) ||
                other.gitVariables == gitVariables) &&
            const DeepCollectionEquality()
                .equals(other._contextPaths, _contextPaths));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitVariables,
      const DeepCollectionEquality().hash(_contextPaths));

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowExtractedProjectCodebaseImplCopyWith<
          _$CreateFlowExtractedProjectCodebaseImpl>
      get copyWith => __$$CreateFlowExtractedProjectCodebaseImplCopyWithImpl<
          _$CreateFlowExtractedProjectCodebaseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool willLog, String accountApiKey, String directoryPath)
        initial,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        createdClient,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        ensuredGit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo)
        gotCodeBaseYaml,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser)
        gotGitUser,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)
        gotLastLocalCommit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)
        gotProjectOriginUrl,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)
        gotGitVariables,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        extractedProjectCodebase,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        createdProjectInGobabelServer,
  }) {
    return extractedProjectCodebase(willLog, accountApiKey, directoryPath,
        client, yamlInfo, gitVariables, contextPaths);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
  }) {
    return extractedProjectCodebase?.call(willLog, accountApiKey, directoryPath,
        client, yamlInfo, gitVariables, contextPaths);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (extractedProjectCodebase != null) {
      return extractedProjectCodebase(willLog, accountApiKey, directoryPath,
          client, yamlInfo, gitVariables, contextPaths);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowInitial value) initial,
    required TResult Function(CreateFlowCreatedClient value) createdClient,
    required TResult Function(CreateFlowEnsureGit value) ensuredGit,
    required TResult Function(CreateFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(CreateFlowGotGitUser value) gotGitUser,
    required TResult Function(CreateFlowGotLastLocalCommit value)
        gotLastLocalCommit,
    required TResult Function(CreateFlowGotProjectOriginUrl value)
        gotProjectOriginUrl,
    required TResult Function(CreateFlowGotGitVariables value) gotGitVariables,
    required TResult Function(CreateFlowExtractedProjectCodebase value)
        extractedProjectCodebase,
    required TResult Function(CreateFlowCreatedProjectInGobabelServer value)
        createdProjectInGobabelServer,
  }) {
    return extractedProjectCodebase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowInitial value)? initial,
    TResult? Function(CreateFlowCreatedClient value)? createdClient,
    TResult? Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult? Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult? Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult? Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
  }) {
    return extractedProjectCodebase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowInitial value)? initial,
    TResult Function(CreateFlowCreatedClient value)? createdClient,
    TResult Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (extractedProjectCodebase != null) {
      return extractedProjectCodebase(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFlowExtractedProjectCodebaseImplToJson(
      this,
    );
  }
}

abstract class CreateFlowExtractedProjectCodebase extends CreateFlowState {
  factory CreateFlowExtractedProjectCodebase(
          {required final bool willLog,
          required final String accountApiKey,
          required final String directoryPath,
          required final ApiClientEntity client,
          required final CodeBaseYamlInfo yamlInfo,
          required final GitVariables gitVariables,
          required final Set<String> contextPaths}) =
      _$CreateFlowExtractedProjectCodebaseImpl;
  CreateFlowExtractedProjectCodebase._() : super._();

  factory CreateFlowExtractedProjectCodebase.fromJson(
          Map<String, dynamic> json) =
      _$CreateFlowExtractedProjectCodebaseImpl.fromJson;

  @override
  bool get willLog;
  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitVariables get gitVariables;
  Set<String> get contextPaths;

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFlowExtractedProjectCodebaseImplCopyWith<
          _$CreateFlowExtractedProjectCodebaseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFlowCreatedProjectInGobabelServerImplCopyWith<$Res>
    implements $CreateFlowStateCopyWith<$Res> {
  factory _$$CreateFlowCreatedProjectInGobabelServerImplCopyWith(
          _$CreateFlowCreatedProjectInGobabelServerImpl value,
          $Res Function(_$CreateFlowCreatedProjectInGobabelServerImpl) then) =
      __$$CreateFlowCreatedProjectInGobabelServerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths});

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
}

/// @nodoc
class __$$CreateFlowCreatedProjectInGobabelServerImplCopyWithImpl<$Res>
    extends _$CreateFlowStateCopyWithImpl<$Res,
        _$CreateFlowCreatedProjectInGobabelServerImpl>
    implements _$$CreateFlowCreatedProjectInGobabelServerImplCopyWith<$Res> {
  __$$CreateFlowCreatedProjectInGobabelServerImplCopyWithImpl(
      _$CreateFlowCreatedProjectInGobabelServerImpl _value,
      $Res Function(_$CreateFlowCreatedProjectInGobabelServerImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? willLog = null,
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitVariables = null,
    Object? contextPaths = null,
  }) {
    return _then(_$CreateFlowCreatedProjectInGobabelServerImpl(
      willLog: null == willLog
          ? _value.willLog
          : willLog // ignore: cast_nullable_to_non_nullable
              as bool,
      accountApiKey: null == accountApiKey
          ? _value.accountApiKey
          : accountApiKey // ignore: cast_nullable_to_non_nullable
              as String,
      directoryPath: null == directoryPath
          ? _value.directoryPath
          : directoryPath // ignore: cast_nullable_to_non_nullable
              as String,
      client: null == client
          ? _value.client
          : client // ignore: cast_nullable_to_non_nullable
              as ApiClientEntity,
      yamlInfo: null == yamlInfo
          ? _value.yamlInfo
          : yamlInfo // ignore: cast_nullable_to_non_nullable
              as CodeBaseYamlInfo,
      gitVariables: null == gitVariables
          ? _value.gitVariables
          : gitVariables // ignore: cast_nullable_to_non_nullable
              as GitVariables,
      contextPaths: null == contextPaths
          ? _value._contextPaths
          : contextPaths // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GitVariablesCopyWith<$Res> get gitVariables {
    return $GitVariablesCopyWith<$Res>(_value.gitVariables, (value) {
      return _then(_value.copyWith(gitVariables: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$CreateFlowCreatedProjectInGobabelServerImpl
    extends CreateFlowCreatedProjectInGobabelServer {
  _$CreateFlowCreatedProjectInGobabelServerImpl(
      {required this.willLog,
      required this.accountApiKey,
      required this.directoryPath,
      required this.client,
      required this.yamlInfo,
      required this.gitVariables,
      required final Set<String> contextPaths,
      final String? $type})
      : _contextPaths = contextPaths,
        $type = $type ?? 'createdProjectInGobabelServer',
        super._();

  factory _$CreateFlowCreatedProjectInGobabelServerImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$CreateFlowCreatedProjectInGobabelServerImplFromJson(json);

  @override
  final bool willLog;
  @override
  final String accountApiKey;
  @override
  final String directoryPath;
  @override
  final ApiClientEntity client;
  @override
  final CodeBaseYamlInfo yamlInfo;
  @override
  final GitVariables gitVariables;
  final Set<String> _contextPaths;
  @override
  Set<String> get contextPaths {
    if (_contextPaths is EqualUnmodifiableSetView) return _contextPaths;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_contextPaths);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CreateFlowState.createdProjectInGobabelServer(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables, contextPaths: $contextPaths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFlowCreatedProjectInGobabelServerImpl &&
            (identical(other.willLog, willLog) || other.willLog == willLog) &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.client, client) || other.client == client) &&
            (identical(other.yamlInfo, yamlInfo) ||
                other.yamlInfo == yamlInfo) &&
            (identical(other.gitVariables, gitVariables) ||
                other.gitVariables == gitVariables) &&
            const DeepCollectionEquality()
                .equals(other._contextPaths, _contextPaths));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitVariables,
      const DeepCollectionEquality().hash(_contextPaths));

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFlowCreatedProjectInGobabelServerImplCopyWith<
          _$CreateFlowCreatedProjectInGobabelServerImpl>
      get copyWith =>
          __$$CreateFlowCreatedProjectInGobabelServerImplCopyWithImpl<
              _$CreateFlowCreatedProjectInGobabelServerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool willLog, String accountApiKey, String directoryPath)
        initial,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        createdClient,
    required TResult Function(bool willLog, String accountApiKey,
            String directoryPath, ApiClientEntity client)
        ensuredGit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo)
        gotCodeBaseYaml,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser)
        gotGitUser,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)
        gotLastLocalCommit,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)
        gotProjectOriginUrl,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)
        gotGitVariables,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        extractedProjectCodebase,
    required TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)
        createdProjectInGobabelServer,
  }) {
    return createdProjectInGobabelServer(willLog, accountApiKey, directoryPath,
        client, yamlInfo, gitVariables, contextPaths);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult? Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult? Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
  }) {
    return createdProjectInGobabelServer?.call(willLog, accountApiKey,
        directoryPath, client, yamlInfo, gitVariables, contextPaths);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
        initial,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        createdClient,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client)?
        ensuredGit,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo)?
        gotCodeBaseYaml,
    TResult Function(bool willLog, String accountApiKey, String directoryPath,
            ApiClientEntity client, CodeBaseYamlInfo yamlInfo, GitUser gitUser)?
        gotGitUser,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit)?
        gotLastLocalCommit,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitUser gitUser,
            GitCommit previousCommit,
            String projectOriginUrl)?
        gotProjectOriginUrl,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables)?
        gotGitVariables,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        extractedProjectCodebase,
    TResult Function(
            bool willLog,
            String accountApiKey,
            String directoryPath,
            ApiClientEntity client,
            CodeBaseYamlInfo yamlInfo,
            GitVariables gitVariables,
            Set<String> contextPaths)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (createdProjectInGobabelServer != null) {
      return createdProjectInGobabelServer(willLog, accountApiKey,
          directoryPath, client, yamlInfo, gitVariables, contextPaths);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CreateFlowInitial value) initial,
    required TResult Function(CreateFlowCreatedClient value) createdClient,
    required TResult Function(CreateFlowEnsureGit value) ensuredGit,
    required TResult Function(CreateFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(CreateFlowGotGitUser value) gotGitUser,
    required TResult Function(CreateFlowGotLastLocalCommit value)
        gotLastLocalCommit,
    required TResult Function(CreateFlowGotProjectOriginUrl value)
        gotProjectOriginUrl,
    required TResult Function(CreateFlowGotGitVariables value) gotGitVariables,
    required TResult Function(CreateFlowExtractedProjectCodebase value)
        extractedProjectCodebase,
    required TResult Function(CreateFlowCreatedProjectInGobabelServer value)
        createdProjectInGobabelServer,
  }) {
    return createdProjectInGobabelServer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowInitial value)? initial,
    TResult? Function(CreateFlowCreatedClient value)? createdClient,
    TResult? Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult? Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult? Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult? Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
  }) {
    return createdProjectInGobabelServer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CreateFlowInitial value)? initial,
    TResult Function(CreateFlowCreatedClient value)? createdClient,
    TResult Function(CreateFlowEnsureGit value)? ensuredGit,
    TResult Function(CreateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(CreateFlowGotGitUser value)? gotGitUser,
    TResult Function(CreateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(CreateFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(CreateFlowGotGitVariables value)? gotGitVariables,
    TResult Function(CreateFlowExtractedProjectCodebase value)?
        extractedProjectCodebase,
    TResult Function(CreateFlowCreatedProjectInGobabelServer value)?
        createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (createdProjectInGobabelServer != null) {
      return createdProjectInGobabelServer(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CreateFlowCreatedProjectInGobabelServerImplToJson(
      this,
    );
  }
}

abstract class CreateFlowCreatedProjectInGobabelServer extends CreateFlowState {
  factory CreateFlowCreatedProjectInGobabelServer(
          {required final bool willLog,
          required final String accountApiKey,
          required final String directoryPath,
          required final ApiClientEntity client,
          required final CodeBaseYamlInfo yamlInfo,
          required final GitVariables gitVariables,
          required final Set<String> contextPaths}) =
      _$CreateFlowCreatedProjectInGobabelServerImpl;
  CreateFlowCreatedProjectInGobabelServer._() : super._();

  factory CreateFlowCreatedProjectInGobabelServer.fromJson(
          Map<String, dynamic> json) =
      _$CreateFlowCreatedProjectInGobabelServerImpl.fromJson;

  @override
  bool get willLog;
  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitVariables get gitVariables;
  Set<String> get contextPaths;

  /// Create a copy of CreateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFlowCreatedProjectInGobabelServerImplCopyWith<
          _$CreateFlowCreatedProjectInGobabelServerImpl>
      get copyWith => throw _privateConstructorUsedError;
}
