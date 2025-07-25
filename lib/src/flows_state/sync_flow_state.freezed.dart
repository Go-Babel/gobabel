// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SyncFlowState _$SyncFlowStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'initial':
      return SyncFlowInitial.fromJson(json);
    case 'createdClient':
      return SyncFlowCreatedClient.fromJson(json);
    case 'ensuredGit':
      return SyncFlowEnsureGit.fromJson(json);
    case 'gotCodeBaseYaml':
      return SyncFlowGotCodeBaseYaml.fromJson(json);
    case 'gotGitUser':
      return SyncFlowGotGitUser.fromJson(json);
    case 'gotLastLocalCommit':
      return SyncFlowGotLastLocalCommit.fromJson(json);
    case 'gotProjectOriginUrl':
      return SyncFlowGotProjectOriginUrl.fromJson(json);
    case 'gotGitVariables':
      return SyncFlowGotGitVariables.fromJson(json);
    case 'extractedProjectCodebase':
      return SyncFlowExtractedProjectCodebase.fromJson(json);
    case 'extractedBabelFunctionDeclarations':
      return SyncFlowExtractedBabelFunctionDeclarations.fromJson(json);
    case 'generatedBabelClass':
      return SyncFlowGeneratedBabelClass.fromJson(json);
    case 'writtedBabelTextFileIntoDirectory':
      return SyncFlowWrittedBabelTextFileIntoDirectory.fromJson(json);
    case 'createdProjectInGobabelServer':
      return SyncFlowCreatedProjectInGobabelServer.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'SyncFlowState',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$SyncFlowState {
  bool get willLog => throw _privateConstructorUsedError;
  String get accountApiKey => throw _privateConstructorUsedError;
  String get directoryPath => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
    )
    initial,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    extractedProjectCodebase,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    extractedBabelFunctionDeclarations,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )
    generatedBabelClass,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    writtedBabelTextFileIntoDirectory,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    createdProjectInGobabelServer,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncFlowInitial value) initial,
    required TResult Function(SyncFlowCreatedClient value) createdClient,
    required TResult Function(SyncFlowEnsureGit value) ensuredGit,
    required TResult Function(SyncFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(SyncFlowGotGitUser value) gotGitUser,
    required TResult Function(SyncFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(SyncFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(SyncFlowGotGitVariables value) gotGitVariables,
    required TResult Function(SyncFlowExtractedProjectCodebase value)
    extractedProjectCodebase,
    required TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)
    extractedBabelFunctionDeclarations,
    required TResult Function(SyncFlowGeneratedBabelClass value)
    generatedBabelClass,
    required TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)
    writtedBabelTextFileIntoDirectory,
    required TResult Function(SyncFlowCreatedProjectInGobabelServer value)
    createdProjectInGobabelServer,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncFlowInitial value)? initial,
    TResult? Function(SyncFlowCreatedClient value)? createdClient,
    TResult? Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult? Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult? Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult? Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult? Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult? Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncFlowInitial value)? initial,
    TResult Function(SyncFlowCreatedClient value)? createdClient,
    TResult Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this SyncFlowState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SyncFlowStateCopyWith<SyncFlowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SyncFlowStateCopyWith<$Res> {
  factory $SyncFlowStateCopyWith(
    SyncFlowState value,
    $Res Function(SyncFlowState) then,
  ) = _$SyncFlowStateCopyWithImpl<$Res, SyncFlowState>;
  @useResult
  $Res call({bool willLog, String accountApiKey, String directoryPath});
}

/// @nodoc
class _$SyncFlowStateCopyWithImpl<$Res, $Val extends SyncFlowState>
    implements $SyncFlowStateCopyWith<$Res> {
  _$SyncFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? willLog = null,
    Object? accountApiKey = null,
    Object? directoryPath = null,
  }) {
    return _then(
      _value.copyWith(
            willLog:
                null == willLog
                    ? _value.willLog
                    : willLog // ignore: cast_nullable_to_non_nullable
                        as bool,
            accountApiKey:
                null == accountApiKey
                    ? _value.accountApiKey
                    : accountApiKey // ignore: cast_nullable_to_non_nullable
                        as String,
            directoryPath:
                null == directoryPath
                    ? _value.directoryPath
                    : directoryPath // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SyncFlowInitialImplCopyWith<$Res>
    implements $SyncFlowStateCopyWith<$Res> {
  factory _$$SyncFlowInitialImplCopyWith(
    _$SyncFlowInitialImpl value,
    $Res Function(_$SyncFlowInitialImpl) then,
  ) = __$$SyncFlowInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool willLog, String accountApiKey, String directoryPath});
}

/// @nodoc
class __$$SyncFlowInitialImplCopyWithImpl<$Res>
    extends _$SyncFlowStateCopyWithImpl<$Res, _$SyncFlowInitialImpl>
    implements _$$SyncFlowInitialImplCopyWith<$Res> {
  __$$SyncFlowInitialImplCopyWithImpl(
    _$SyncFlowInitialImpl _value,
    $Res Function(_$SyncFlowInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? willLog = null,
    Object? accountApiKey = null,
    Object? directoryPath = null,
  }) {
    return _then(
      _$SyncFlowInitialImpl(
        willLog:
            null == willLog
                ? _value.willLog
                : willLog // ignore: cast_nullable_to_non_nullable
                    as bool,
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SyncFlowInitialImpl extends SyncFlowInitial {
  _$SyncFlowInitialImpl({
    required this.willLog,
    required this.accountApiKey,
    required this.directoryPath,
    final String? $type,
  }) : $type = $type ?? 'initial',
       super._();

  factory _$SyncFlowInitialImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncFlowInitialImplFromJson(json);

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
    return 'SyncFlowState.initial(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncFlowInitialImpl &&
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

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncFlowInitialImplCopyWith<_$SyncFlowInitialImpl> get copyWith =>
      __$$SyncFlowInitialImplCopyWithImpl<_$SyncFlowInitialImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
    )
    initial,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    extractedProjectCodebase,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    extractedBabelFunctionDeclarations,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )
    generatedBabelClass,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    writtedBabelTextFileIntoDirectory,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    createdProjectInGobabelServer,
  }) {
    return initial(willLog, accountApiKey, directoryPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
  }) {
    return initial?.call(willLog, accountApiKey, directoryPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
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
    required TResult Function(SyncFlowInitial value) initial,
    required TResult Function(SyncFlowCreatedClient value) createdClient,
    required TResult Function(SyncFlowEnsureGit value) ensuredGit,
    required TResult Function(SyncFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(SyncFlowGotGitUser value) gotGitUser,
    required TResult Function(SyncFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(SyncFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(SyncFlowGotGitVariables value) gotGitVariables,
    required TResult Function(SyncFlowExtractedProjectCodebase value)
    extractedProjectCodebase,
    required TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)
    extractedBabelFunctionDeclarations,
    required TResult Function(SyncFlowGeneratedBabelClass value)
    generatedBabelClass,
    required TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)
    writtedBabelTextFileIntoDirectory,
    required TResult Function(SyncFlowCreatedProjectInGobabelServer value)
    createdProjectInGobabelServer,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncFlowInitial value)? initial,
    TResult? Function(SyncFlowCreatedClient value)? createdClient,
    TResult? Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult? Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult? Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult? Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult? Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult? Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncFlowInitial value)? initial,
    TResult Function(SyncFlowCreatedClient value)? createdClient,
    TResult Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult Function(SyncFlowCreatedProjectInGobabelServer value)?
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
    return _$$SyncFlowInitialImplToJson(this);
  }
}

abstract class SyncFlowInitial extends SyncFlowState {
  factory SyncFlowInitial({
    required final bool willLog,
    required final String accountApiKey,
    required final String directoryPath,
  }) = _$SyncFlowInitialImpl;
  SyncFlowInitial._() : super._();

  factory SyncFlowInitial.fromJson(Map<String, dynamic> json) =
      _$SyncFlowInitialImpl.fromJson;

  @override
  bool get willLog;
  @override
  String get accountApiKey;
  @override
  String get directoryPath;

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncFlowInitialImplCopyWith<_$SyncFlowInitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncFlowCreatedClientImplCopyWith<$Res>
    implements $SyncFlowStateCopyWith<$Res> {
  factory _$$SyncFlowCreatedClientImplCopyWith(
    _$SyncFlowCreatedClientImpl value,
    $Res Function(_$SyncFlowCreatedClientImpl) then,
  ) = __$$SyncFlowCreatedClientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool willLog,
    String accountApiKey,
    String directoryPath,
    ApiClientEntity client,
  });

  $ApiClientEntityCopyWith<$Res> get client;
}

/// @nodoc
class __$$SyncFlowCreatedClientImplCopyWithImpl<$Res>
    extends _$SyncFlowStateCopyWithImpl<$Res, _$SyncFlowCreatedClientImpl>
    implements _$$SyncFlowCreatedClientImplCopyWith<$Res> {
  __$$SyncFlowCreatedClientImplCopyWithImpl(
    _$SyncFlowCreatedClientImpl _value,
    $Res Function(_$SyncFlowCreatedClientImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? willLog = null,
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
  }) {
    return _then(
      _$SyncFlowCreatedClientImpl(
        willLog:
            null == willLog
                ? _value.willLog
                : willLog // ignore: cast_nullable_to_non_nullable
                    as bool,
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
      ),
    );
  }

  /// Create a copy of SyncFlowState
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
class _$SyncFlowCreatedClientImpl extends SyncFlowCreatedClient {
  _$SyncFlowCreatedClientImpl({
    required this.willLog,
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    final String? $type,
  }) : $type = $type ?? 'createdClient',
       super._();

  factory _$SyncFlowCreatedClientImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncFlowCreatedClientImplFromJson(json);

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
    return 'SyncFlowState.createdClient(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncFlowCreatedClientImpl &&
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

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncFlowCreatedClientImplCopyWith<_$SyncFlowCreatedClientImpl>
  get copyWith =>
      __$$SyncFlowCreatedClientImplCopyWithImpl<_$SyncFlowCreatedClientImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
    )
    initial,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    extractedProjectCodebase,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    extractedBabelFunctionDeclarations,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )
    generatedBabelClass,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    writtedBabelTextFileIntoDirectory,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    createdProjectInGobabelServer,
  }) {
    return createdClient(willLog, accountApiKey, directoryPath, client);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
  }) {
    return createdClient?.call(willLog, accountApiKey, directoryPath, client);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
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
    required TResult Function(SyncFlowInitial value) initial,
    required TResult Function(SyncFlowCreatedClient value) createdClient,
    required TResult Function(SyncFlowEnsureGit value) ensuredGit,
    required TResult Function(SyncFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(SyncFlowGotGitUser value) gotGitUser,
    required TResult Function(SyncFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(SyncFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(SyncFlowGotGitVariables value) gotGitVariables,
    required TResult Function(SyncFlowExtractedProjectCodebase value)
    extractedProjectCodebase,
    required TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)
    extractedBabelFunctionDeclarations,
    required TResult Function(SyncFlowGeneratedBabelClass value)
    generatedBabelClass,
    required TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)
    writtedBabelTextFileIntoDirectory,
    required TResult Function(SyncFlowCreatedProjectInGobabelServer value)
    createdProjectInGobabelServer,
  }) {
    return createdClient(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncFlowInitial value)? initial,
    TResult? Function(SyncFlowCreatedClient value)? createdClient,
    TResult? Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult? Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult? Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult? Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult? Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult? Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
  }) {
    return createdClient?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncFlowInitial value)? initial,
    TResult Function(SyncFlowCreatedClient value)? createdClient,
    TResult Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult Function(SyncFlowCreatedProjectInGobabelServer value)?
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
    return _$$SyncFlowCreatedClientImplToJson(this);
  }
}

abstract class SyncFlowCreatedClient extends SyncFlowState {
  factory SyncFlowCreatedClient({
    required final bool willLog,
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
  }) = _$SyncFlowCreatedClientImpl;
  SyncFlowCreatedClient._() : super._();

  factory SyncFlowCreatedClient.fromJson(Map<String, dynamic> json) =
      _$SyncFlowCreatedClientImpl.fromJson;

  @override
  bool get willLog;
  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncFlowCreatedClientImplCopyWith<_$SyncFlowCreatedClientImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncFlowEnsureGitImplCopyWith<$Res>
    implements $SyncFlowStateCopyWith<$Res> {
  factory _$$SyncFlowEnsureGitImplCopyWith(
    _$SyncFlowEnsureGitImpl value,
    $Res Function(_$SyncFlowEnsureGitImpl) then,
  ) = __$$SyncFlowEnsureGitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool willLog,
    String accountApiKey,
    String directoryPath,
    ApiClientEntity client,
  });

  $ApiClientEntityCopyWith<$Res> get client;
}

/// @nodoc
class __$$SyncFlowEnsureGitImplCopyWithImpl<$Res>
    extends _$SyncFlowStateCopyWithImpl<$Res, _$SyncFlowEnsureGitImpl>
    implements _$$SyncFlowEnsureGitImplCopyWith<$Res> {
  __$$SyncFlowEnsureGitImplCopyWithImpl(
    _$SyncFlowEnsureGitImpl _value,
    $Res Function(_$SyncFlowEnsureGitImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? willLog = null,
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
  }) {
    return _then(
      _$SyncFlowEnsureGitImpl(
        willLog:
            null == willLog
                ? _value.willLog
                : willLog // ignore: cast_nullable_to_non_nullable
                    as bool,
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
      ),
    );
  }

  /// Create a copy of SyncFlowState
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
class _$SyncFlowEnsureGitImpl extends SyncFlowEnsureGit {
  _$SyncFlowEnsureGitImpl({
    required this.willLog,
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    final String? $type,
  }) : $type = $type ?? 'ensuredGit',
       super._();

  factory _$SyncFlowEnsureGitImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncFlowEnsureGitImplFromJson(json);

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
    return 'SyncFlowState.ensuredGit(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncFlowEnsureGitImpl &&
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

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncFlowEnsureGitImplCopyWith<_$SyncFlowEnsureGitImpl> get copyWith =>
      __$$SyncFlowEnsureGitImplCopyWithImpl<_$SyncFlowEnsureGitImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
    )
    initial,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    extractedProjectCodebase,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    extractedBabelFunctionDeclarations,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )
    generatedBabelClass,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    writtedBabelTextFileIntoDirectory,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    createdProjectInGobabelServer,
  }) {
    return ensuredGit(willLog, accountApiKey, directoryPath, client);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
  }) {
    return ensuredGit?.call(willLog, accountApiKey, directoryPath, client);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
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
    required TResult Function(SyncFlowInitial value) initial,
    required TResult Function(SyncFlowCreatedClient value) createdClient,
    required TResult Function(SyncFlowEnsureGit value) ensuredGit,
    required TResult Function(SyncFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(SyncFlowGotGitUser value) gotGitUser,
    required TResult Function(SyncFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(SyncFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(SyncFlowGotGitVariables value) gotGitVariables,
    required TResult Function(SyncFlowExtractedProjectCodebase value)
    extractedProjectCodebase,
    required TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)
    extractedBabelFunctionDeclarations,
    required TResult Function(SyncFlowGeneratedBabelClass value)
    generatedBabelClass,
    required TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)
    writtedBabelTextFileIntoDirectory,
    required TResult Function(SyncFlowCreatedProjectInGobabelServer value)
    createdProjectInGobabelServer,
  }) {
    return ensuredGit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncFlowInitial value)? initial,
    TResult? Function(SyncFlowCreatedClient value)? createdClient,
    TResult? Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult? Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult? Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult? Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult? Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult? Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
  }) {
    return ensuredGit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncFlowInitial value)? initial,
    TResult Function(SyncFlowCreatedClient value)? createdClient,
    TResult Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult Function(SyncFlowCreatedProjectInGobabelServer value)?
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
    return _$$SyncFlowEnsureGitImplToJson(this);
  }
}

abstract class SyncFlowEnsureGit extends SyncFlowState {
  factory SyncFlowEnsureGit({
    required final bool willLog,
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
  }) = _$SyncFlowEnsureGitImpl;
  SyncFlowEnsureGit._() : super._();

  factory SyncFlowEnsureGit.fromJson(Map<String, dynamic> json) =
      _$SyncFlowEnsureGitImpl.fromJson;

  @override
  bool get willLog;
  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncFlowEnsureGitImplCopyWith<_$SyncFlowEnsureGitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncFlowGotCodeBaseYamlImplCopyWith<$Res>
    implements $SyncFlowStateCopyWith<$Res> {
  factory _$$SyncFlowGotCodeBaseYamlImplCopyWith(
    _$SyncFlowGotCodeBaseYamlImpl value,
    $Res Function(_$SyncFlowGotCodeBaseYamlImpl) then,
  ) = __$$SyncFlowGotCodeBaseYamlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool willLog,
    String accountApiKey,
    String directoryPath,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
}

/// @nodoc
class __$$SyncFlowGotCodeBaseYamlImplCopyWithImpl<$Res>
    extends _$SyncFlowStateCopyWithImpl<$Res, _$SyncFlowGotCodeBaseYamlImpl>
    implements _$$SyncFlowGotCodeBaseYamlImplCopyWith<$Res> {
  __$$SyncFlowGotCodeBaseYamlImplCopyWithImpl(
    _$SyncFlowGotCodeBaseYamlImpl _value,
    $Res Function(_$SyncFlowGotCodeBaseYamlImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncFlowState
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
    return _then(
      _$SyncFlowGotCodeBaseYamlImpl(
        willLog:
            null == willLog
                ? _value.willLog
                : willLog // ignore: cast_nullable_to_non_nullable
                    as bool,
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
      ),
    );
  }

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of SyncFlowState
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
class _$SyncFlowGotCodeBaseYamlImpl extends SyncFlowGotCodeBaseYaml {
  _$SyncFlowGotCodeBaseYamlImpl({
    required this.willLog,
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    required this.yamlInfo,
    final String? $type,
  }) : $type = $type ?? 'gotCodeBaseYaml',
       super._();

  factory _$SyncFlowGotCodeBaseYamlImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncFlowGotCodeBaseYamlImplFromJson(json);

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
    return 'SyncFlowState.gotCodeBaseYaml(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncFlowGotCodeBaseYamlImpl &&
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
    runtimeType,
    willLog,
    accountApiKey,
    directoryPath,
    client,
    yamlInfo,
  );

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncFlowGotCodeBaseYamlImplCopyWith<_$SyncFlowGotCodeBaseYamlImpl>
  get copyWith => __$$SyncFlowGotCodeBaseYamlImplCopyWithImpl<
    _$SyncFlowGotCodeBaseYamlImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
    )
    initial,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    extractedProjectCodebase,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    extractedBabelFunctionDeclarations,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )
    generatedBabelClass,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    writtedBabelTextFileIntoDirectory,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    createdProjectInGobabelServer,
  }) {
    return gotCodeBaseYaml(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
  }) {
    return gotCodeBaseYaml?.call(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (gotCodeBaseYaml != null) {
      return gotCodeBaseYaml(
        willLog,
        accountApiKey,
        directoryPath,
        client,
        yamlInfo,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncFlowInitial value) initial,
    required TResult Function(SyncFlowCreatedClient value) createdClient,
    required TResult Function(SyncFlowEnsureGit value) ensuredGit,
    required TResult Function(SyncFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(SyncFlowGotGitUser value) gotGitUser,
    required TResult Function(SyncFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(SyncFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(SyncFlowGotGitVariables value) gotGitVariables,
    required TResult Function(SyncFlowExtractedProjectCodebase value)
    extractedProjectCodebase,
    required TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)
    extractedBabelFunctionDeclarations,
    required TResult Function(SyncFlowGeneratedBabelClass value)
    generatedBabelClass,
    required TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)
    writtedBabelTextFileIntoDirectory,
    required TResult Function(SyncFlowCreatedProjectInGobabelServer value)
    createdProjectInGobabelServer,
  }) {
    return gotCodeBaseYaml(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncFlowInitial value)? initial,
    TResult? Function(SyncFlowCreatedClient value)? createdClient,
    TResult? Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult? Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult? Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult? Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult? Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult? Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
  }) {
    return gotCodeBaseYaml?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncFlowInitial value)? initial,
    TResult Function(SyncFlowCreatedClient value)? createdClient,
    TResult Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult Function(SyncFlowCreatedProjectInGobabelServer value)?
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
    return _$$SyncFlowGotCodeBaseYamlImplToJson(this);
  }
}

abstract class SyncFlowGotCodeBaseYaml extends SyncFlowState {
  factory SyncFlowGotCodeBaseYaml({
    required final bool willLog,
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
  }) = _$SyncFlowGotCodeBaseYamlImpl;
  SyncFlowGotCodeBaseYaml._() : super._();

  factory SyncFlowGotCodeBaseYaml.fromJson(Map<String, dynamic> json) =
      _$SyncFlowGotCodeBaseYamlImpl.fromJson;

  @override
  bool get willLog;
  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncFlowGotCodeBaseYamlImplCopyWith<_$SyncFlowGotCodeBaseYamlImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncFlowGotGitUserImplCopyWith<$Res>
    implements $SyncFlowStateCopyWith<$Res> {
  factory _$$SyncFlowGotGitUserImplCopyWith(
    _$SyncFlowGotGitUserImpl value,
    $Res Function(_$SyncFlowGotGitUserImpl) then,
  ) = __$$SyncFlowGotGitUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool willLog,
    String accountApiKey,
    String directoryPath,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitUser gitUser,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
}

/// @nodoc
class __$$SyncFlowGotGitUserImplCopyWithImpl<$Res>
    extends _$SyncFlowStateCopyWithImpl<$Res, _$SyncFlowGotGitUserImpl>
    implements _$$SyncFlowGotGitUserImplCopyWith<$Res> {
  __$$SyncFlowGotGitUserImplCopyWithImpl(
    _$SyncFlowGotGitUserImpl _value,
    $Res Function(_$SyncFlowGotGitUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncFlowState
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
    return _then(
      _$SyncFlowGotGitUserImpl(
        willLog:
            null == willLog
                ? _value.willLog
                : willLog // ignore: cast_nullable_to_non_nullable
                    as bool,
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitUser:
            null == gitUser
                ? _value.gitUser
                : gitUser // ignore: cast_nullable_to_non_nullable
                    as GitUser,
      ),
    );
  }

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of SyncFlowState
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
class _$SyncFlowGotGitUserImpl extends SyncFlowGotGitUser {
  _$SyncFlowGotGitUserImpl({
    required this.willLog,
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    required this.yamlInfo,
    required this.gitUser,
    final String? $type,
  }) : $type = $type ?? 'gotGitUser',
       super._();

  factory _$SyncFlowGotGitUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncFlowGotGitUserImplFromJson(json);

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
    return 'SyncFlowState.gotGitUser(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitUser: $gitUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncFlowGotGitUserImpl &&
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
  int get hashCode => Object.hash(
    runtimeType,
    willLog,
    accountApiKey,
    directoryPath,
    client,
    yamlInfo,
    gitUser,
  );

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncFlowGotGitUserImplCopyWith<_$SyncFlowGotGitUserImpl> get copyWith =>
      __$$SyncFlowGotGitUserImplCopyWithImpl<_$SyncFlowGotGitUserImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
    )
    initial,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    extractedProjectCodebase,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    extractedBabelFunctionDeclarations,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )
    generatedBabelClass,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    writtedBabelTextFileIntoDirectory,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    createdProjectInGobabelServer,
  }) {
    return gotGitUser(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitUser,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
  }) {
    return gotGitUser?.call(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitUser,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (gotGitUser != null) {
      return gotGitUser(
        willLog,
        accountApiKey,
        directoryPath,
        client,
        yamlInfo,
        gitUser,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncFlowInitial value) initial,
    required TResult Function(SyncFlowCreatedClient value) createdClient,
    required TResult Function(SyncFlowEnsureGit value) ensuredGit,
    required TResult Function(SyncFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(SyncFlowGotGitUser value) gotGitUser,
    required TResult Function(SyncFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(SyncFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(SyncFlowGotGitVariables value) gotGitVariables,
    required TResult Function(SyncFlowExtractedProjectCodebase value)
    extractedProjectCodebase,
    required TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)
    extractedBabelFunctionDeclarations,
    required TResult Function(SyncFlowGeneratedBabelClass value)
    generatedBabelClass,
    required TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)
    writtedBabelTextFileIntoDirectory,
    required TResult Function(SyncFlowCreatedProjectInGobabelServer value)
    createdProjectInGobabelServer,
  }) {
    return gotGitUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncFlowInitial value)? initial,
    TResult? Function(SyncFlowCreatedClient value)? createdClient,
    TResult? Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult? Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult? Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult? Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult? Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult? Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
  }) {
    return gotGitUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncFlowInitial value)? initial,
    TResult Function(SyncFlowCreatedClient value)? createdClient,
    TResult Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult Function(SyncFlowCreatedProjectInGobabelServer value)?
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
    return _$$SyncFlowGotGitUserImplToJson(this);
  }
}

abstract class SyncFlowGotGitUser extends SyncFlowState {
  factory SyncFlowGotGitUser({
    required final bool willLog,
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitUser gitUser,
  }) = _$SyncFlowGotGitUserImpl;
  SyncFlowGotGitUser._() : super._();

  factory SyncFlowGotGitUser.fromJson(Map<String, dynamic> json) =
      _$SyncFlowGotGitUserImpl.fromJson;

  @override
  bool get willLog;
  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitUser get gitUser;

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncFlowGotGitUserImplCopyWith<_$SyncFlowGotGitUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncFlowGotLastLocalCommitImplCopyWith<$Res>
    implements $SyncFlowStateCopyWith<$Res> {
  factory _$$SyncFlowGotLastLocalCommitImplCopyWith(
    _$SyncFlowGotLastLocalCommitImpl value,
    $Res Function(_$SyncFlowGotLastLocalCommitImpl) then,
  ) = __$$SyncFlowGotLastLocalCommitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool willLog,
    String accountApiKey,
    String directoryPath,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitUser gitUser,
    GitCommit previousCommit,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
}

/// @nodoc
class __$$SyncFlowGotLastLocalCommitImplCopyWithImpl<$Res>
    extends _$SyncFlowStateCopyWithImpl<$Res, _$SyncFlowGotLastLocalCommitImpl>
    implements _$$SyncFlowGotLastLocalCommitImplCopyWith<$Res> {
  __$$SyncFlowGotLastLocalCommitImplCopyWithImpl(
    _$SyncFlowGotLastLocalCommitImpl _value,
    $Res Function(_$SyncFlowGotLastLocalCommitImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncFlowState
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
    return _then(
      _$SyncFlowGotLastLocalCommitImpl(
        willLog:
            null == willLog
                ? _value.willLog
                : willLog // ignore: cast_nullable_to_non_nullable
                    as bool,
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitUser:
            null == gitUser
                ? _value.gitUser
                : gitUser // ignore: cast_nullable_to_non_nullable
                    as GitUser,
        previousCommit:
            null == previousCommit
                ? _value.previousCommit
                : previousCommit // ignore: cast_nullable_to_non_nullable
                    as GitCommit,
      ),
    );
  }

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of SyncFlowState
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
class _$SyncFlowGotLastLocalCommitImpl extends SyncFlowGotLastLocalCommit {
  _$SyncFlowGotLastLocalCommitImpl({
    required this.willLog,
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    required this.yamlInfo,
    required this.gitUser,
    required this.previousCommit,
    final String? $type,
  }) : $type = $type ?? 'gotLastLocalCommit',
       super._();

  factory _$SyncFlowGotLastLocalCommitImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$SyncFlowGotLastLocalCommitImplFromJson(json);

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
    return 'SyncFlowState.gotLastLocalCommit(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitUser: $gitUser, previousCommit: $previousCommit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncFlowGotLastLocalCommitImpl &&
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
  int get hashCode => Object.hash(
    runtimeType,
    willLog,
    accountApiKey,
    directoryPath,
    client,
    yamlInfo,
    gitUser,
    previousCommit,
  );

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncFlowGotLastLocalCommitImplCopyWith<_$SyncFlowGotLastLocalCommitImpl>
  get copyWith => __$$SyncFlowGotLastLocalCommitImplCopyWithImpl<
    _$SyncFlowGotLastLocalCommitImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
    )
    initial,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    extractedProjectCodebase,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    extractedBabelFunctionDeclarations,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )
    generatedBabelClass,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    writtedBabelTextFileIntoDirectory,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    createdProjectInGobabelServer,
  }) {
    return gotLastLocalCommit(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitUser,
      previousCommit,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
  }) {
    return gotLastLocalCommit?.call(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitUser,
      previousCommit,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (gotLastLocalCommit != null) {
      return gotLastLocalCommit(
        willLog,
        accountApiKey,
        directoryPath,
        client,
        yamlInfo,
        gitUser,
        previousCommit,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncFlowInitial value) initial,
    required TResult Function(SyncFlowCreatedClient value) createdClient,
    required TResult Function(SyncFlowEnsureGit value) ensuredGit,
    required TResult Function(SyncFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(SyncFlowGotGitUser value) gotGitUser,
    required TResult Function(SyncFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(SyncFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(SyncFlowGotGitVariables value) gotGitVariables,
    required TResult Function(SyncFlowExtractedProjectCodebase value)
    extractedProjectCodebase,
    required TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)
    extractedBabelFunctionDeclarations,
    required TResult Function(SyncFlowGeneratedBabelClass value)
    generatedBabelClass,
    required TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)
    writtedBabelTextFileIntoDirectory,
    required TResult Function(SyncFlowCreatedProjectInGobabelServer value)
    createdProjectInGobabelServer,
  }) {
    return gotLastLocalCommit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncFlowInitial value)? initial,
    TResult? Function(SyncFlowCreatedClient value)? createdClient,
    TResult? Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult? Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult? Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult? Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult? Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult? Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
  }) {
    return gotLastLocalCommit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncFlowInitial value)? initial,
    TResult Function(SyncFlowCreatedClient value)? createdClient,
    TResult Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult Function(SyncFlowCreatedProjectInGobabelServer value)?
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
    return _$$SyncFlowGotLastLocalCommitImplToJson(this);
  }
}

abstract class SyncFlowGotLastLocalCommit extends SyncFlowState {
  factory SyncFlowGotLastLocalCommit({
    required final bool willLog,
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitUser gitUser,
    required final GitCommit previousCommit,
  }) = _$SyncFlowGotLastLocalCommitImpl;
  SyncFlowGotLastLocalCommit._() : super._();

  factory SyncFlowGotLastLocalCommit.fromJson(Map<String, dynamic> json) =
      _$SyncFlowGotLastLocalCommitImpl.fromJson;

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

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncFlowGotLastLocalCommitImplCopyWith<_$SyncFlowGotLastLocalCommitImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncFlowGotProjectOriginUrlImplCopyWith<$Res>
    implements $SyncFlowStateCopyWith<$Res> {
  factory _$$SyncFlowGotProjectOriginUrlImplCopyWith(
    _$SyncFlowGotProjectOriginUrlImpl value,
    $Res Function(_$SyncFlowGotProjectOriginUrlImpl) then,
  ) = __$$SyncFlowGotProjectOriginUrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool willLog,
    String accountApiKey,
    String directoryPath,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitUser gitUser,
    GitCommit previousCommit,
    String projectOriginUrl,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
}

/// @nodoc
class __$$SyncFlowGotProjectOriginUrlImplCopyWithImpl<$Res>
    extends _$SyncFlowStateCopyWithImpl<$Res, _$SyncFlowGotProjectOriginUrlImpl>
    implements _$$SyncFlowGotProjectOriginUrlImplCopyWith<$Res> {
  __$$SyncFlowGotProjectOriginUrlImplCopyWithImpl(
    _$SyncFlowGotProjectOriginUrlImpl _value,
    $Res Function(_$SyncFlowGotProjectOriginUrlImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncFlowState
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
    return _then(
      _$SyncFlowGotProjectOriginUrlImpl(
        willLog:
            null == willLog
                ? _value.willLog
                : willLog // ignore: cast_nullable_to_non_nullable
                    as bool,
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitUser:
            null == gitUser
                ? _value.gitUser
                : gitUser // ignore: cast_nullable_to_non_nullable
                    as GitUser,
        previousCommit:
            null == previousCommit
                ? _value.previousCommit
                : previousCommit // ignore: cast_nullable_to_non_nullable
                    as GitCommit,
        projectOriginUrl:
            null == projectOriginUrl
                ? _value.projectOriginUrl
                : projectOriginUrl // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of SyncFlowState
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
class _$SyncFlowGotProjectOriginUrlImpl extends SyncFlowGotProjectOriginUrl {
  _$SyncFlowGotProjectOriginUrlImpl({
    required this.willLog,
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    required this.yamlInfo,
    required this.gitUser,
    required this.previousCommit,
    required this.projectOriginUrl,
    final String? $type,
  }) : $type = $type ?? 'gotProjectOriginUrl',
       super._();

  factory _$SyncFlowGotProjectOriginUrlImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$SyncFlowGotProjectOriginUrlImplFromJson(json);

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
    return 'SyncFlowState.gotProjectOriginUrl(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitUser: $gitUser, previousCommit: $previousCommit, projectOriginUrl: $projectOriginUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncFlowGotProjectOriginUrlImpl &&
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
    projectOriginUrl,
  );

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncFlowGotProjectOriginUrlImplCopyWith<_$SyncFlowGotProjectOriginUrlImpl>
  get copyWith => __$$SyncFlowGotProjectOriginUrlImplCopyWithImpl<
    _$SyncFlowGotProjectOriginUrlImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
    )
    initial,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    extractedProjectCodebase,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    extractedBabelFunctionDeclarations,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )
    generatedBabelClass,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    writtedBabelTextFileIntoDirectory,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    createdProjectInGobabelServer,
  }) {
    return gotProjectOriginUrl(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitUser,
      previousCommit,
      projectOriginUrl,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
  }) {
    return gotProjectOriginUrl?.call(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitUser,
      previousCommit,
      projectOriginUrl,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (gotProjectOriginUrl != null) {
      return gotProjectOriginUrl(
        willLog,
        accountApiKey,
        directoryPath,
        client,
        yamlInfo,
        gitUser,
        previousCommit,
        projectOriginUrl,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncFlowInitial value) initial,
    required TResult Function(SyncFlowCreatedClient value) createdClient,
    required TResult Function(SyncFlowEnsureGit value) ensuredGit,
    required TResult Function(SyncFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(SyncFlowGotGitUser value) gotGitUser,
    required TResult Function(SyncFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(SyncFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(SyncFlowGotGitVariables value) gotGitVariables,
    required TResult Function(SyncFlowExtractedProjectCodebase value)
    extractedProjectCodebase,
    required TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)
    extractedBabelFunctionDeclarations,
    required TResult Function(SyncFlowGeneratedBabelClass value)
    generatedBabelClass,
    required TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)
    writtedBabelTextFileIntoDirectory,
    required TResult Function(SyncFlowCreatedProjectInGobabelServer value)
    createdProjectInGobabelServer,
  }) {
    return gotProjectOriginUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncFlowInitial value)? initial,
    TResult? Function(SyncFlowCreatedClient value)? createdClient,
    TResult? Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult? Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult? Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult? Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult? Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult? Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
  }) {
    return gotProjectOriginUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncFlowInitial value)? initial,
    TResult Function(SyncFlowCreatedClient value)? createdClient,
    TResult Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult Function(SyncFlowCreatedProjectInGobabelServer value)?
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
    return _$$SyncFlowGotProjectOriginUrlImplToJson(this);
  }
}

abstract class SyncFlowGotProjectOriginUrl extends SyncFlowState {
  factory SyncFlowGotProjectOriginUrl({
    required final bool willLog,
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitUser gitUser,
    required final GitCommit previousCommit,
    required final String projectOriginUrl,
  }) = _$SyncFlowGotProjectOriginUrlImpl;
  SyncFlowGotProjectOriginUrl._() : super._();

  factory SyncFlowGotProjectOriginUrl.fromJson(Map<String, dynamic> json) =
      _$SyncFlowGotProjectOriginUrlImpl.fromJson;

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

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncFlowGotProjectOriginUrlImplCopyWith<_$SyncFlowGotProjectOriginUrlImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncFlowGotGitVariablesImplCopyWith<$Res>
    implements $SyncFlowStateCopyWith<$Res> {
  factory _$$SyncFlowGotGitVariablesImplCopyWith(
    _$SyncFlowGotGitVariablesImpl value,
    $Res Function(_$SyncFlowGotGitVariablesImpl) then,
  ) = __$$SyncFlowGotGitVariablesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool willLog,
    String accountApiKey,
    String directoryPath,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitVariables gitVariables,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
}

/// @nodoc
class __$$SyncFlowGotGitVariablesImplCopyWithImpl<$Res>
    extends _$SyncFlowStateCopyWithImpl<$Res, _$SyncFlowGotGitVariablesImpl>
    implements _$$SyncFlowGotGitVariablesImplCopyWith<$Res> {
  __$$SyncFlowGotGitVariablesImplCopyWithImpl(
    _$SyncFlowGotGitVariablesImpl _value,
    $Res Function(_$SyncFlowGotGitVariablesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncFlowState
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
    return _then(
      _$SyncFlowGotGitVariablesImpl(
        willLog:
            null == willLog
                ? _value.willLog
                : willLog // ignore: cast_nullable_to_non_nullable
                    as bool,
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitVariables:
            null == gitVariables
                ? _value.gitVariables
                : gitVariables // ignore: cast_nullable_to_non_nullable
                    as GitVariables,
      ),
    );
  }

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of SyncFlowState
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
class _$SyncFlowGotGitVariablesImpl extends SyncFlowGotGitVariables {
  _$SyncFlowGotGitVariablesImpl({
    required this.willLog,
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    required this.yamlInfo,
    required this.gitVariables,
    final String? $type,
  }) : $type = $type ?? 'gotGitVariables',
       super._();

  factory _$SyncFlowGotGitVariablesImpl.fromJson(Map<String, dynamic> json) =>
      _$$SyncFlowGotGitVariablesImplFromJson(json);

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
    return 'SyncFlowState.gotGitVariables(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncFlowGotGitVariablesImpl &&
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
  int get hashCode => Object.hash(
    runtimeType,
    willLog,
    accountApiKey,
    directoryPath,
    client,
    yamlInfo,
    gitVariables,
  );

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncFlowGotGitVariablesImplCopyWith<_$SyncFlowGotGitVariablesImpl>
  get copyWith => __$$SyncFlowGotGitVariablesImplCopyWithImpl<
    _$SyncFlowGotGitVariablesImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
    )
    initial,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    extractedProjectCodebase,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    extractedBabelFunctionDeclarations,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )
    generatedBabelClass,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    writtedBabelTextFileIntoDirectory,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    createdProjectInGobabelServer,
  }) {
    return gotGitVariables(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitVariables,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
  }) {
    return gotGitVariables?.call(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitVariables,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (gotGitVariables != null) {
      return gotGitVariables(
        willLog,
        accountApiKey,
        directoryPath,
        client,
        yamlInfo,
        gitVariables,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncFlowInitial value) initial,
    required TResult Function(SyncFlowCreatedClient value) createdClient,
    required TResult Function(SyncFlowEnsureGit value) ensuredGit,
    required TResult Function(SyncFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(SyncFlowGotGitUser value) gotGitUser,
    required TResult Function(SyncFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(SyncFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(SyncFlowGotGitVariables value) gotGitVariables,
    required TResult Function(SyncFlowExtractedProjectCodebase value)
    extractedProjectCodebase,
    required TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)
    extractedBabelFunctionDeclarations,
    required TResult Function(SyncFlowGeneratedBabelClass value)
    generatedBabelClass,
    required TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)
    writtedBabelTextFileIntoDirectory,
    required TResult Function(SyncFlowCreatedProjectInGobabelServer value)
    createdProjectInGobabelServer,
  }) {
    return gotGitVariables(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncFlowInitial value)? initial,
    TResult? Function(SyncFlowCreatedClient value)? createdClient,
    TResult? Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult? Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult? Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult? Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult? Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult? Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
  }) {
    return gotGitVariables?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncFlowInitial value)? initial,
    TResult Function(SyncFlowCreatedClient value)? createdClient,
    TResult Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult Function(SyncFlowCreatedProjectInGobabelServer value)?
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
    return _$$SyncFlowGotGitVariablesImplToJson(this);
  }
}

abstract class SyncFlowGotGitVariables extends SyncFlowState {
  factory SyncFlowGotGitVariables({
    required final bool willLog,
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitVariables gitVariables,
  }) = _$SyncFlowGotGitVariablesImpl;
  SyncFlowGotGitVariables._() : super._();

  factory SyncFlowGotGitVariables.fromJson(Map<String, dynamic> json) =
      _$SyncFlowGotGitVariablesImpl.fromJson;

  @override
  bool get willLog;
  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitVariables get gitVariables;

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncFlowGotGitVariablesImplCopyWith<_$SyncFlowGotGitVariablesImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncFlowExtractedProjectCodebaseImplCopyWith<$Res>
    implements $SyncFlowStateCopyWith<$Res> {
  factory _$$SyncFlowExtractedProjectCodebaseImplCopyWith(
    _$SyncFlowExtractedProjectCodebaseImpl value,
    $Res Function(_$SyncFlowExtractedProjectCodebaseImpl) then,
  ) = __$$SyncFlowExtractedProjectCodebaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool willLog,
    String accountApiKey,
    String directoryPath,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitVariables gitVariables,
    Set<String> contextPaths,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
}

/// @nodoc
class __$$SyncFlowExtractedProjectCodebaseImplCopyWithImpl<$Res>
    extends
        _$SyncFlowStateCopyWithImpl<
          $Res,
          _$SyncFlowExtractedProjectCodebaseImpl
        >
    implements _$$SyncFlowExtractedProjectCodebaseImplCopyWith<$Res> {
  __$$SyncFlowExtractedProjectCodebaseImplCopyWithImpl(
    _$SyncFlowExtractedProjectCodebaseImpl _value,
    $Res Function(_$SyncFlowExtractedProjectCodebaseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncFlowState
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
    return _then(
      _$SyncFlowExtractedProjectCodebaseImpl(
        willLog:
            null == willLog
                ? _value.willLog
                : willLog // ignore: cast_nullable_to_non_nullable
                    as bool,
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitVariables:
            null == gitVariables
                ? _value.gitVariables
                : gitVariables // ignore: cast_nullable_to_non_nullable
                    as GitVariables,
        contextPaths:
            null == contextPaths
                ? _value._contextPaths
                : contextPaths // ignore: cast_nullable_to_non_nullable
                    as Set<String>,
      ),
    );
  }

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of SyncFlowState
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
class _$SyncFlowExtractedProjectCodebaseImpl
    extends SyncFlowExtractedProjectCodebase {
  _$SyncFlowExtractedProjectCodebaseImpl({
    required this.willLog,
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    required this.yamlInfo,
    required this.gitVariables,
    required final Set<String> contextPaths,
    final String? $type,
  }) : _contextPaths = contextPaths,
       $type = $type ?? 'extractedProjectCodebase',
       super._();

  factory _$SyncFlowExtractedProjectCodebaseImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$SyncFlowExtractedProjectCodebaseImplFromJson(json);

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
    return 'SyncFlowState.extractedProjectCodebase(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables, contextPaths: $contextPaths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncFlowExtractedProjectCodebaseImpl &&
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
            const DeepCollectionEquality().equals(
              other._contextPaths,
              _contextPaths,
            ));
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
    const DeepCollectionEquality().hash(_contextPaths),
  );

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncFlowExtractedProjectCodebaseImplCopyWith<
    _$SyncFlowExtractedProjectCodebaseImpl
  >
  get copyWith => __$$SyncFlowExtractedProjectCodebaseImplCopyWithImpl<
    _$SyncFlowExtractedProjectCodebaseImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
    )
    initial,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    extractedProjectCodebase,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    extractedBabelFunctionDeclarations,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )
    generatedBabelClass,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    writtedBabelTextFileIntoDirectory,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    createdProjectInGobabelServer,
  }) {
    return extractedProjectCodebase(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitVariables,
      contextPaths,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
  }) {
    return extractedProjectCodebase?.call(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitVariables,
      contextPaths,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (extractedProjectCodebase != null) {
      return extractedProjectCodebase(
        willLog,
        accountApiKey,
        directoryPath,
        client,
        yamlInfo,
        gitVariables,
        contextPaths,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncFlowInitial value) initial,
    required TResult Function(SyncFlowCreatedClient value) createdClient,
    required TResult Function(SyncFlowEnsureGit value) ensuredGit,
    required TResult Function(SyncFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(SyncFlowGotGitUser value) gotGitUser,
    required TResult Function(SyncFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(SyncFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(SyncFlowGotGitVariables value) gotGitVariables,
    required TResult Function(SyncFlowExtractedProjectCodebase value)
    extractedProjectCodebase,
    required TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)
    extractedBabelFunctionDeclarations,
    required TResult Function(SyncFlowGeneratedBabelClass value)
    generatedBabelClass,
    required TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)
    writtedBabelTextFileIntoDirectory,
    required TResult Function(SyncFlowCreatedProjectInGobabelServer value)
    createdProjectInGobabelServer,
  }) {
    return extractedProjectCodebase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncFlowInitial value)? initial,
    TResult? Function(SyncFlowCreatedClient value)? createdClient,
    TResult? Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult? Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult? Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult? Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult? Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult? Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
  }) {
    return extractedProjectCodebase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncFlowInitial value)? initial,
    TResult Function(SyncFlowCreatedClient value)? createdClient,
    TResult Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult Function(SyncFlowCreatedProjectInGobabelServer value)?
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
    return _$$SyncFlowExtractedProjectCodebaseImplToJson(this);
  }
}

abstract class SyncFlowExtractedProjectCodebase extends SyncFlowState {
  factory SyncFlowExtractedProjectCodebase({
    required final bool willLog,
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitVariables gitVariables,
    required final Set<String> contextPaths,
  }) = _$SyncFlowExtractedProjectCodebaseImpl;
  SyncFlowExtractedProjectCodebase._() : super._();

  factory SyncFlowExtractedProjectCodebase.fromJson(Map<String, dynamic> json) =
      _$SyncFlowExtractedProjectCodebaseImpl.fromJson;

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

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncFlowExtractedProjectCodebaseImplCopyWith<
    _$SyncFlowExtractedProjectCodebaseImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncFlowExtractedBabelFunctionDeclarationsImplCopyWith<$Res>
    implements $SyncFlowStateCopyWith<$Res> {
  factory _$$SyncFlowExtractedBabelFunctionDeclarationsImplCopyWith(
    _$SyncFlowExtractedBabelFunctionDeclarationsImpl value,
    $Res Function(_$SyncFlowExtractedBabelFunctionDeclarationsImpl) then,
  ) = __$$SyncFlowExtractedBabelFunctionDeclarationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool willLog,
    String accountApiKey,
    String directoryPath,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitVariables gitVariables,
    Set<String> contextPaths,
    Set<String> declarationFunctions,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
}

/// @nodoc
class __$$SyncFlowExtractedBabelFunctionDeclarationsImplCopyWithImpl<$Res>
    extends
        _$SyncFlowStateCopyWithImpl<
          $Res,
          _$SyncFlowExtractedBabelFunctionDeclarationsImpl
        >
    implements _$$SyncFlowExtractedBabelFunctionDeclarationsImplCopyWith<$Res> {
  __$$SyncFlowExtractedBabelFunctionDeclarationsImplCopyWithImpl(
    _$SyncFlowExtractedBabelFunctionDeclarationsImpl _value,
    $Res Function(_$SyncFlowExtractedBabelFunctionDeclarationsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncFlowState
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
    Object? declarationFunctions = null,
  }) {
    return _then(
      _$SyncFlowExtractedBabelFunctionDeclarationsImpl(
        willLog:
            null == willLog
                ? _value.willLog
                : willLog // ignore: cast_nullable_to_non_nullable
                    as bool,
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitVariables:
            null == gitVariables
                ? _value.gitVariables
                : gitVariables // ignore: cast_nullable_to_non_nullable
                    as GitVariables,
        contextPaths:
            null == contextPaths
                ? _value._contextPaths
                : contextPaths // ignore: cast_nullable_to_non_nullable
                    as Set<String>,
        declarationFunctions:
            null == declarationFunctions
                ? _value._declarationFunctions
                : declarationFunctions // ignore: cast_nullable_to_non_nullable
                    as Set<String>,
      ),
    );
  }

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of SyncFlowState
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
class _$SyncFlowExtractedBabelFunctionDeclarationsImpl
    extends SyncFlowExtractedBabelFunctionDeclarations {
  _$SyncFlowExtractedBabelFunctionDeclarationsImpl({
    required this.willLog,
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    required this.yamlInfo,
    required this.gitVariables,
    required final Set<String> contextPaths,
    required final Set<String> declarationFunctions,
    final String? $type,
  }) : _contextPaths = contextPaths,
       _declarationFunctions = declarationFunctions,
       $type = $type ?? 'extractedBabelFunctionDeclarations',
       super._();

  factory _$SyncFlowExtractedBabelFunctionDeclarationsImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$SyncFlowExtractedBabelFunctionDeclarationsImplFromJson(json);

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

  final Set<String> _declarationFunctions;
  @override
  Set<String> get declarationFunctions {
    if (_declarationFunctions is EqualUnmodifiableSetView)
      return _declarationFunctions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_declarationFunctions);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SyncFlowState.extractedBabelFunctionDeclarations(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables, contextPaths: $contextPaths, declarationFunctions: $declarationFunctions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncFlowExtractedBabelFunctionDeclarationsImpl &&
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
            const DeepCollectionEquality().equals(
              other._contextPaths,
              _contextPaths,
            ) &&
            const DeepCollectionEquality().equals(
              other._declarationFunctions,
              _declarationFunctions,
            ));
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
    const DeepCollectionEquality().hash(_contextPaths),
    const DeepCollectionEquality().hash(_declarationFunctions),
  );

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncFlowExtractedBabelFunctionDeclarationsImplCopyWith<
    _$SyncFlowExtractedBabelFunctionDeclarationsImpl
  >
  get copyWith =>
      __$$SyncFlowExtractedBabelFunctionDeclarationsImplCopyWithImpl<
        _$SyncFlowExtractedBabelFunctionDeclarationsImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
    )
    initial,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    extractedProjectCodebase,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    extractedBabelFunctionDeclarations,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )
    generatedBabelClass,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    writtedBabelTextFileIntoDirectory,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    createdProjectInGobabelServer,
  }) {
    return extractedBabelFunctionDeclarations(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitVariables,
      contextPaths,
      declarationFunctions,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
  }) {
    return extractedBabelFunctionDeclarations?.call(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitVariables,
      contextPaths,
      declarationFunctions,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (extractedBabelFunctionDeclarations != null) {
      return extractedBabelFunctionDeclarations(
        willLog,
        accountApiKey,
        directoryPath,
        client,
        yamlInfo,
        gitVariables,
        contextPaths,
        declarationFunctions,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncFlowInitial value) initial,
    required TResult Function(SyncFlowCreatedClient value) createdClient,
    required TResult Function(SyncFlowEnsureGit value) ensuredGit,
    required TResult Function(SyncFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(SyncFlowGotGitUser value) gotGitUser,
    required TResult Function(SyncFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(SyncFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(SyncFlowGotGitVariables value) gotGitVariables,
    required TResult Function(SyncFlowExtractedProjectCodebase value)
    extractedProjectCodebase,
    required TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)
    extractedBabelFunctionDeclarations,
    required TResult Function(SyncFlowGeneratedBabelClass value)
    generatedBabelClass,
    required TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)
    writtedBabelTextFileIntoDirectory,
    required TResult Function(SyncFlowCreatedProjectInGobabelServer value)
    createdProjectInGobabelServer,
  }) {
    return extractedBabelFunctionDeclarations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncFlowInitial value)? initial,
    TResult? Function(SyncFlowCreatedClient value)? createdClient,
    TResult? Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult? Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult? Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult? Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult? Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult? Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
  }) {
    return extractedBabelFunctionDeclarations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncFlowInitial value)? initial,
    TResult Function(SyncFlowCreatedClient value)? createdClient,
    TResult Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (extractedBabelFunctionDeclarations != null) {
      return extractedBabelFunctionDeclarations(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncFlowExtractedBabelFunctionDeclarationsImplToJson(this);
  }
}

abstract class SyncFlowExtractedBabelFunctionDeclarations
    extends SyncFlowState {
  factory SyncFlowExtractedBabelFunctionDeclarations({
    required final bool willLog,
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitVariables gitVariables,
    required final Set<String> contextPaths,
    required final Set<String> declarationFunctions,
  }) = _$SyncFlowExtractedBabelFunctionDeclarationsImpl;
  SyncFlowExtractedBabelFunctionDeclarations._() : super._();

  factory SyncFlowExtractedBabelFunctionDeclarations.fromJson(
    Map<String, dynamic> json,
  ) = _$SyncFlowExtractedBabelFunctionDeclarationsImpl.fromJson;

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
  Set<String> get declarationFunctions;

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncFlowExtractedBabelFunctionDeclarationsImplCopyWith<
    _$SyncFlowExtractedBabelFunctionDeclarationsImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncFlowGeneratedBabelClassImplCopyWith<$Res>
    implements $SyncFlowStateCopyWith<$Res> {
  factory _$$SyncFlowGeneratedBabelClassImplCopyWith(
    _$SyncFlowGeneratedBabelClassImpl value,
    $Res Function(_$SyncFlowGeneratedBabelClassImpl) then,
  ) = __$$SyncFlowGeneratedBabelClassImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool willLog,
    String accountApiKey,
    String directoryPath,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitVariables gitVariables,
    Set<String> contextPaths,
    Set<String> declarationFunctions,
    String babelClass,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
}

/// @nodoc
class __$$SyncFlowGeneratedBabelClassImplCopyWithImpl<$Res>
    extends _$SyncFlowStateCopyWithImpl<$Res, _$SyncFlowGeneratedBabelClassImpl>
    implements _$$SyncFlowGeneratedBabelClassImplCopyWith<$Res> {
  __$$SyncFlowGeneratedBabelClassImplCopyWithImpl(
    _$SyncFlowGeneratedBabelClassImpl _value,
    $Res Function(_$SyncFlowGeneratedBabelClassImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncFlowState
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
    Object? declarationFunctions = null,
    Object? babelClass = null,
  }) {
    return _then(
      _$SyncFlowGeneratedBabelClassImpl(
        willLog:
            null == willLog
                ? _value.willLog
                : willLog // ignore: cast_nullable_to_non_nullable
                    as bool,
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitVariables:
            null == gitVariables
                ? _value.gitVariables
                : gitVariables // ignore: cast_nullable_to_non_nullable
                    as GitVariables,
        contextPaths:
            null == contextPaths
                ? _value._contextPaths
                : contextPaths // ignore: cast_nullable_to_non_nullable
                    as Set<String>,
        declarationFunctions:
            null == declarationFunctions
                ? _value._declarationFunctions
                : declarationFunctions // ignore: cast_nullable_to_non_nullable
                    as Set<String>,
        babelClass:
            null == babelClass
                ? _value.babelClass
                : babelClass // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of SyncFlowState
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
class _$SyncFlowGeneratedBabelClassImpl extends SyncFlowGeneratedBabelClass {
  _$SyncFlowGeneratedBabelClassImpl({
    required this.willLog,
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    required this.yamlInfo,
    required this.gitVariables,
    required final Set<String> contextPaths,
    required final Set<String> declarationFunctions,
    required this.babelClass,
    final String? $type,
  }) : _contextPaths = contextPaths,
       _declarationFunctions = declarationFunctions,
       $type = $type ?? 'generatedBabelClass',
       super._();

  factory _$SyncFlowGeneratedBabelClassImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$SyncFlowGeneratedBabelClassImplFromJson(json);

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

  final Set<String> _declarationFunctions;
  @override
  Set<String> get declarationFunctions {
    if (_declarationFunctions is EqualUnmodifiableSetView)
      return _declarationFunctions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_declarationFunctions);
  }

  @override
  final String babelClass;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SyncFlowState.generatedBabelClass(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables, contextPaths: $contextPaths, declarationFunctions: $declarationFunctions, babelClass: $babelClass)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncFlowGeneratedBabelClassImpl &&
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
            const DeepCollectionEquality().equals(
              other._contextPaths,
              _contextPaths,
            ) &&
            const DeepCollectionEquality().equals(
              other._declarationFunctions,
              _declarationFunctions,
            ) &&
            (identical(other.babelClass, babelClass) ||
                other.babelClass == babelClass));
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
    const DeepCollectionEquality().hash(_contextPaths),
    const DeepCollectionEquality().hash(_declarationFunctions),
    babelClass,
  );

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncFlowGeneratedBabelClassImplCopyWith<_$SyncFlowGeneratedBabelClassImpl>
  get copyWith => __$$SyncFlowGeneratedBabelClassImplCopyWithImpl<
    _$SyncFlowGeneratedBabelClassImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
    )
    initial,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    extractedProjectCodebase,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    extractedBabelFunctionDeclarations,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )
    generatedBabelClass,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    writtedBabelTextFileIntoDirectory,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    createdProjectInGobabelServer,
  }) {
    return generatedBabelClass(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitVariables,
      contextPaths,
      declarationFunctions,
      babelClass,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
  }) {
    return generatedBabelClass?.call(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitVariables,
      contextPaths,
      declarationFunctions,
      babelClass,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (generatedBabelClass != null) {
      return generatedBabelClass(
        willLog,
        accountApiKey,
        directoryPath,
        client,
        yamlInfo,
        gitVariables,
        contextPaths,
        declarationFunctions,
        babelClass,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncFlowInitial value) initial,
    required TResult Function(SyncFlowCreatedClient value) createdClient,
    required TResult Function(SyncFlowEnsureGit value) ensuredGit,
    required TResult Function(SyncFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(SyncFlowGotGitUser value) gotGitUser,
    required TResult Function(SyncFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(SyncFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(SyncFlowGotGitVariables value) gotGitVariables,
    required TResult Function(SyncFlowExtractedProjectCodebase value)
    extractedProjectCodebase,
    required TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)
    extractedBabelFunctionDeclarations,
    required TResult Function(SyncFlowGeneratedBabelClass value)
    generatedBabelClass,
    required TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)
    writtedBabelTextFileIntoDirectory,
    required TResult Function(SyncFlowCreatedProjectInGobabelServer value)
    createdProjectInGobabelServer,
  }) {
    return generatedBabelClass(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncFlowInitial value)? initial,
    TResult? Function(SyncFlowCreatedClient value)? createdClient,
    TResult? Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult? Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult? Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult? Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult? Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult? Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
  }) {
    return generatedBabelClass?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncFlowInitial value)? initial,
    TResult Function(SyncFlowCreatedClient value)? createdClient,
    TResult Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (generatedBabelClass != null) {
      return generatedBabelClass(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncFlowGeneratedBabelClassImplToJson(this);
  }
}

abstract class SyncFlowGeneratedBabelClass extends SyncFlowState {
  factory SyncFlowGeneratedBabelClass({
    required final bool willLog,
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitVariables gitVariables,
    required final Set<String> contextPaths,
    required final Set<String> declarationFunctions,
    required final String babelClass,
  }) = _$SyncFlowGeneratedBabelClassImpl;
  SyncFlowGeneratedBabelClass._() : super._();

  factory SyncFlowGeneratedBabelClass.fromJson(Map<String, dynamic> json) =
      _$SyncFlowGeneratedBabelClassImpl.fromJson;

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
  Set<String> get declarationFunctions;
  String get babelClass;

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncFlowGeneratedBabelClassImplCopyWith<_$SyncFlowGeneratedBabelClassImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncFlowWrittedBabelTextFileIntoDirectoryImplCopyWith<$Res>
    implements $SyncFlowStateCopyWith<$Res> {
  factory _$$SyncFlowWrittedBabelTextFileIntoDirectoryImplCopyWith(
    _$SyncFlowWrittedBabelTextFileIntoDirectoryImpl value,
    $Res Function(_$SyncFlowWrittedBabelTextFileIntoDirectoryImpl) then,
  ) = __$$SyncFlowWrittedBabelTextFileIntoDirectoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool willLog,
    String accountApiKey,
    String directoryPath,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitVariables gitVariables,
    Set<String> contextPaths,
    Set<String> declarationFunctions,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
}

/// @nodoc
class __$$SyncFlowWrittedBabelTextFileIntoDirectoryImplCopyWithImpl<$Res>
    extends
        _$SyncFlowStateCopyWithImpl<
          $Res,
          _$SyncFlowWrittedBabelTextFileIntoDirectoryImpl
        >
    implements _$$SyncFlowWrittedBabelTextFileIntoDirectoryImplCopyWith<$Res> {
  __$$SyncFlowWrittedBabelTextFileIntoDirectoryImplCopyWithImpl(
    _$SyncFlowWrittedBabelTextFileIntoDirectoryImpl _value,
    $Res Function(_$SyncFlowWrittedBabelTextFileIntoDirectoryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncFlowState
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
    Object? declarationFunctions = null,
  }) {
    return _then(
      _$SyncFlowWrittedBabelTextFileIntoDirectoryImpl(
        willLog:
            null == willLog
                ? _value.willLog
                : willLog // ignore: cast_nullable_to_non_nullable
                    as bool,
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitVariables:
            null == gitVariables
                ? _value.gitVariables
                : gitVariables // ignore: cast_nullable_to_non_nullable
                    as GitVariables,
        contextPaths:
            null == contextPaths
                ? _value._contextPaths
                : contextPaths // ignore: cast_nullable_to_non_nullable
                    as Set<String>,
        declarationFunctions:
            null == declarationFunctions
                ? _value._declarationFunctions
                : declarationFunctions // ignore: cast_nullable_to_non_nullable
                    as Set<String>,
      ),
    );
  }

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of SyncFlowState
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
class _$SyncFlowWrittedBabelTextFileIntoDirectoryImpl
    extends SyncFlowWrittedBabelTextFileIntoDirectory {
  _$SyncFlowWrittedBabelTextFileIntoDirectoryImpl({
    required this.willLog,
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    required this.yamlInfo,
    required this.gitVariables,
    required final Set<String> contextPaths,
    required final Set<String> declarationFunctions,
    final String? $type,
  }) : _contextPaths = contextPaths,
       _declarationFunctions = declarationFunctions,
       $type = $type ?? 'writtedBabelTextFileIntoDirectory',
       super._();

  factory _$SyncFlowWrittedBabelTextFileIntoDirectoryImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$SyncFlowWrittedBabelTextFileIntoDirectoryImplFromJson(json);

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

  final Set<String> _declarationFunctions;
  @override
  Set<String> get declarationFunctions {
    if (_declarationFunctions is EqualUnmodifiableSetView)
      return _declarationFunctions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_declarationFunctions);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'SyncFlowState.writtedBabelTextFileIntoDirectory(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables, contextPaths: $contextPaths, declarationFunctions: $declarationFunctions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncFlowWrittedBabelTextFileIntoDirectoryImpl &&
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
            const DeepCollectionEquality().equals(
              other._contextPaths,
              _contextPaths,
            ) &&
            const DeepCollectionEquality().equals(
              other._declarationFunctions,
              _declarationFunctions,
            ));
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
    const DeepCollectionEquality().hash(_contextPaths),
    const DeepCollectionEquality().hash(_declarationFunctions),
  );

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncFlowWrittedBabelTextFileIntoDirectoryImplCopyWith<
    _$SyncFlowWrittedBabelTextFileIntoDirectoryImpl
  >
  get copyWith => __$$SyncFlowWrittedBabelTextFileIntoDirectoryImplCopyWithImpl<
    _$SyncFlowWrittedBabelTextFileIntoDirectoryImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
    )
    initial,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    extractedProjectCodebase,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    extractedBabelFunctionDeclarations,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )
    generatedBabelClass,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    writtedBabelTextFileIntoDirectory,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    createdProjectInGobabelServer,
  }) {
    return writtedBabelTextFileIntoDirectory(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitVariables,
      contextPaths,
      declarationFunctions,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
  }) {
    return writtedBabelTextFileIntoDirectory?.call(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitVariables,
      contextPaths,
      declarationFunctions,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (writtedBabelTextFileIntoDirectory != null) {
      return writtedBabelTextFileIntoDirectory(
        willLog,
        accountApiKey,
        directoryPath,
        client,
        yamlInfo,
        gitVariables,
        contextPaths,
        declarationFunctions,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncFlowInitial value) initial,
    required TResult Function(SyncFlowCreatedClient value) createdClient,
    required TResult Function(SyncFlowEnsureGit value) ensuredGit,
    required TResult Function(SyncFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(SyncFlowGotGitUser value) gotGitUser,
    required TResult Function(SyncFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(SyncFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(SyncFlowGotGitVariables value) gotGitVariables,
    required TResult Function(SyncFlowExtractedProjectCodebase value)
    extractedProjectCodebase,
    required TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)
    extractedBabelFunctionDeclarations,
    required TResult Function(SyncFlowGeneratedBabelClass value)
    generatedBabelClass,
    required TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)
    writtedBabelTextFileIntoDirectory,
    required TResult Function(SyncFlowCreatedProjectInGobabelServer value)
    createdProjectInGobabelServer,
  }) {
    return writtedBabelTextFileIntoDirectory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncFlowInitial value)? initial,
    TResult? Function(SyncFlowCreatedClient value)? createdClient,
    TResult? Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult? Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult? Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult? Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult? Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult? Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
  }) {
    return writtedBabelTextFileIntoDirectory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncFlowInitial value)? initial,
    TResult Function(SyncFlowCreatedClient value)? createdClient,
    TResult Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (writtedBabelTextFileIntoDirectory != null) {
      return writtedBabelTextFileIntoDirectory(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SyncFlowWrittedBabelTextFileIntoDirectoryImplToJson(this);
  }
}

abstract class SyncFlowWrittedBabelTextFileIntoDirectory extends SyncFlowState {
  factory SyncFlowWrittedBabelTextFileIntoDirectory({
    required final bool willLog,
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitVariables gitVariables,
    required final Set<String> contextPaths,
    required final Set<String> declarationFunctions,
  }) = _$SyncFlowWrittedBabelTextFileIntoDirectoryImpl;
  SyncFlowWrittedBabelTextFileIntoDirectory._() : super._();

  factory SyncFlowWrittedBabelTextFileIntoDirectory.fromJson(
    Map<String, dynamic> json,
  ) = _$SyncFlowWrittedBabelTextFileIntoDirectoryImpl.fromJson;

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
  Set<String> get declarationFunctions;

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncFlowWrittedBabelTextFileIntoDirectoryImplCopyWith<
    _$SyncFlowWrittedBabelTextFileIntoDirectoryImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SyncFlowCreatedProjectInGobabelServerImplCopyWith<$Res>
    implements $SyncFlowStateCopyWith<$Res> {
  factory _$$SyncFlowCreatedProjectInGobabelServerImplCopyWith(
    _$SyncFlowCreatedProjectInGobabelServerImpl value,
    $Res Function(_$SyncFlowCreatedProjectInGobabelServerImpl) then,
  ) = __$$SyncFlowCreatedProjectInGobabelServerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool willLog,
    String accountApiKey,
    String directoryPath,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
    GitVariables gitVariables,
    Set<String> contextPaths,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
  $GitVariablesCopyWith<$Res> get gitVariables;
}

/// @nodoc
class __$$SyncFlowCreatedProjectInGobabelServerImplCopyWithImpl<$Res>
    extends
        _$SyncFlowStateCopyWithImpl<
          $Res,
          _$SyncFlowCreatedProjectInGobabelServerImpl
        >
    implements _$$SyncFlowCreatedProjectInGobabelServerImplCopyWith<$Res> {
  __$$SyncFlowCreatedProjectInGobabelServerImplCopyWithImpl(
    _$SyncFlowCreatedProjectInGobabelServerImpl _value,
    $Res Function(_$SyncFlowCreatedProjectInGobabelServerImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SyncFlowState
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
    return _then(
      _$SyncFlowCreatedProjectInGobabelServerImpl(
        willLog:
            null == willLog
                ? _value.willLog
                : willLog // ignore: cast_nullable_to_non_nullable
                    as bool,
        accountApiKey:
            null == accountApiKey
                ? _value.accountApiKey
                : accountApiKey // ignore: cast_nullable_to_non_nullable
                    as String,
        directoryPath:
            null == directoryPath
                ? _value.directoryPath
                : directoryPath // ignore: cast_nullable_to_non_nullable
                    as String,
        client:
            null == client
                ? _value.client
                : client // ignore: cast_nullable_to_non_nullable
                    as ApiClientEntity,
        yamlInfo:
            null == yamlInfo
                ? _value.yamlInfo
                : yamlInfo // ignore: cast_nullable_to_non_nullable
                    as CodeBaseYamlInfo,
        gitVariables:
            null == gitVariables
                ? _value.gitVariables
                : gitVariables // ignore: cast_nullable_to_non_nullable
                    as GitVariables,
        contextPaths:
            null == contextPaths
                ? _value._contextPaths
                : contextPaths // ignore: cast_nullable_to_non_nullable
                    as Set<String>,
      ),
    );
  }

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of SyncFlowState
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
class _$SyncFlowCreatedProjectInGobabelServerImpl
    extends SyncFlowCreatedProjectInGobabelServer {
  _$SyncFlowCreatedProjectInGobabelServerImpl({
    required this.willLog,
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    required this.yamlInfo,
    required this.gitVariables,
    required final Set<String> contextPaths,
    final String? $type,
  }) : _contextPaths = contextPaths,
       $type = $type ?? 'createdProjectInGobabelServer',
       super._();

  factory _$SyncFlowCreatedProjectInGobabelServerImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$SyncFlowCreatedProjectInGobabelServerImplFromJson(json);

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
    return 'SyncFlowState.createdProjectInGobabelServer(willLog: $willLog, accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables, contextPaths: $contextPaths)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SyncFlowCreatedProjectInGobabelServerImpl &&
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
            const DeepCollectionEquality().equals(
              other._contextPaths,
              _contextPaths,
            ));
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
    const DeepCollectionEquality().hash(_contextPaths),
  );

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SyncFlowCreatedProjectInGobabelServerImplCopyWith<
    _$SyncFlowCreatedProjectInGobabelServerImpl
  >
  get copyWith => __$$SyncFlowCreatedProjectInGobabelServerImplCopyWithImpl<
    _$SyncFlowCreatedProjectInGobabelServerImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
    )
    initial,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )
    gotProjectOriginUrl,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    extractedProjectCodebase,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    extractedBabelFunctionDeclarations,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )
    generatedBabelClass,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )
    writtedBabelTextFileIntoDirectory,
    required TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )
    createdProjectInGobabelServer,
  }) {
    return createdProjectInGobabelServer(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitVariables,
      contextPaths,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
  }) {
    return createdProjectInGobabelServer?.call(
      willLog,
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
      gitVariables,
      contextPaths,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool willLog, String accountApiKey, String directoryPath)?
    initial,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
      String projectOriginUrl,
    )?
    gotProjectOriginUrl,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    extractedProjectCodebase,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    extractedBabelFunctionDeclarations,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
      String babelClass,
    )?
    generatedBabelClass,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
      Set<String> declarationFunctions,
    )?
    writtedBabelTextFileIntoDirectory,
    TResult Function(
      bool willLog,
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
      Set<String> contextPaths,
    )?
    createdProjectInGobabelServer,
    required TResult orElse(),
  }) {
    if (createdProjectInGobabelServer != null) {
      return createdProjectInGobabelServer(
        willLog,
        accountApiKey,
        directoryPath,
        client,
        yamlInfo,
        gitVariables,
        contextPaths,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SyncFlowInitial value) initial,
    required TResult Function(SyncFlowCreatedClient value) createdClient,
    required TResult Function(SyncFlowEnsureGit value) ensuredGit,
    required TResult Function(SyncFlowGotCodeBaseYaml value) gotCodeBaseYaml,
    required TResult Function(SyncFlowGotGitUser value) gotGitUser,
    required TResult Function(SyncFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(SyncFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(SyncFlowGotGitVariables value) gotGitVariables,
    required TResult Function(SyncFlowExtractedProjectCodebase value)
    extractedProjectCodebase,
    required TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)
    extractedBabelFunctionDeclarations,
    required TResult Function(SyncFlowGeneratedBabelClass value)
    generatedBabelClass,
    required TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)
    writtedBabelTextFileIntoDirectory,
    required TResult Function(SyncFlowCreatedProjectInGobabelServer value)
    createdProjectInGobabelServer,
  }) {
    return createdProjectInGobabelServer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SyncFlowInitial value)? initial,
    TResult? Function(SyncFlowCreatedClient value)? createdClient,
    TResult? Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult? Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult? Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult? Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult? Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult? Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult? Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult? Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult? Function(SyncFlowCreatedProjectInGobabelServer value)?
    createdProjectInGobabelServer,
  }) {
    return createdProjectInGobabelServer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SyncFlowInitial value)? initial,
    TResult Function(SyncFlowCreatedClient value)? createdClient,
    TResult Function(SyncFlowEnsureGit value)? ensuredGit,
    TResult Function(SyncFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(SyncFlowGotGitUser value)? gotGitUser,
    TResult Function(SyncFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(SyncFlowGotProjectOriginUrl value)? gotProjectOriginUrl,
    TResult Function(SyncFlowGotGitVariables value)? gotGitVariables,
    TResult Function(SyncFlowExtractedProjectCodebase value)?
    extractedProjectCodebase,
    TResult Function(SyncFlowExtractedBabelFunctionDeclarations value)?
    extractedBabelFunctionDeclarations,
    TResult Function(SyncFlowGeneratedBabelClass value)? generatedBabelClass,
    TResult Function(SyncFlowWrittedBabelTextFileIntoDirectory value)?
    writtedBabelTextFileIntoDirectory,
    TResult Function(SyncFlowCreatedProjectInGobabelServer value)?
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
    return _$$SyncFlowCreatedProjectInGobabelServerImplToJson(this);
  }
}

abstract class SyncFlowCreatedProjectInGobabelServer extends SyncFlowState {
  factory SyncFlowCreatedProjectInGobabelServer({
    required final bool willLog,
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitVariables gitVariables,
    required final Set<String> contextPaths,
  }) = _$SyncFlowCreatedProjectInGobabelServerImpl;
  SyncFlowCreatedProjectInGobabelServer._() : super._();

  factory SyncFlowCreatedProjectInGobabelServer.fromJson(
    Map<String, dynamic> json,
  ) = _$SyncFlowCreatedProjectInGobabelServerImpl.fromJson;

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

  /// Create a copy of SyncFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SyncFlowCreatedProjectInGobabelServerImplCopyWith<
    _$SyncFlowCreatedProjectInGobabelServerImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
