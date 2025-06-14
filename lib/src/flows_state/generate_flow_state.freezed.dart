// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GenerateFlowState _$GenerateFlowStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'initial':
      return GenerateFlowInitial.fromJson(json);
    case 'createdClient':
      return GenerateFlowCreatedClient.fromJson(json);
    case 'ensuredGit':
      return GenerateFlowEnsureGit.fromJson(json);
    case 'gotCodeBaseYaml':
      return GenerateFlowGotCodeBaseYaml.fromJson(json);
    case 'gotGitUser':
      return GenerateFlowGotGitUser.fromJson(json);
    case 'gotLastLocalCommit':
      return GenerateFlowGotLastLocalCommit.fromJson(json);
    case 'gotProjectOriginUrl':
      return GenerateFlowGotProjectOriginUrl.fromJson(json);
    case 'gotGitVariables':
      return GenerateFlowGotGitVariables.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'GenerateFlowState',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$GenerateFlowState {
  String get accountApiKey => throw _privateConstructorUsedError;
  String get directoryPath => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountApiKey, String directoryPath)
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String accountApiKey, String directoryPath)? initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountApiKey, String directoryPath)? initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this GenerateFlowState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerateFlowStateCopyWith<GenerateFlowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateFlowStateCopyWith<$Res> {
  factory $GenerateFlowStateCopyWith(
    GenerateFlowState value,
    $Res Function(GenerateFlowState) then,
  ) = _$GenerateFlowStateCopyWithImpl<$Res, GenerateFlowState>;
  @useResult
  $Res call({String accountApiKey, String directoryPath});
}

/// @nodoc
class _$GenerateFlowStateCopyWithImpl<$Res, $Val extends GenerateFlowState>
    implements $GenerateFlowStateCopyWith<$Res> {
  _$GenerateFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accountApiKey = null, Object? directoryPath = null}) {
    return _then(
      _value.copyWith(
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
abstract class _$$GenerateFlowInitialImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowInitialImplCopyWith(
    _$GenerateFlowInitialImpl value,
    $Res Function(_$GenerateFlowInitialImpl) then,
  ) = __$$GenerateFlowInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accountApiKey, String directoryPath});
}

/// @nodoc
class __$$GenerateFlowInitialImplCopyWithImpl<$Res>
    extends _$GenerateFlowStateCopyWithImpl<$Res, _$GenerateFlowInitialImpl>
    implements _$$GenerateFlowInitialImplCopyWith<$Res> {
  __$$GenerateFlowInitialImplCopyWithImpl(
    _$GenerateFlowInitialImpl _value,
    $Res Function(_$GenerateFlowInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accountApiKey = null, Object? directoryPath = null}) {
    return _then(
      _$GenerateFlowInitialImpl(
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
class _$GenerateFlowInitialImpl extends GenerateFlowInitial {
  _$GenerateFlowInitialImpl({
    required this.accountApiKey,
    required this.directoryPath,
    final String? $type,
  }) : $type = $type ?? 'initial',
       super._();

  factory _$GenerateFlowInitialImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateFlowInitialImplFromJson(json);

  @override
  final String accountApiKey;
  @override
  final String directoryPath;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'GenerateFlowState.initial(accountApiKey: $accountApiKey, directoryPath: $directoryPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowInitialImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accountApiKey, directoryPath);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowInitialImplCopyWith<_$GenerateFlowInitialImpl> get copyWith =>
      __$$GenerateFlowInitialImplCopyWithImpl<_$GenerateFlowInitialImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountApiKey, String directoryPath)
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
  }) {
    return initial(accountApiKey, directoryPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String accountApiKey, String directoryPath)? initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
  }) {
    return initial?.call(accountApiKey, directoryPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountApiKey, String directoryPath)? initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(accountApiKey, directoryPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowInitialImplToJson(this);
  }
}

abstract class GenerateFlowInitial extends GenerateFlowState {
  factory GenerateFlowInitial({
    required final String accountApiKey,
    required final String directoryPath,
  }) = _$GenerateFlowInitialImpl;
  GenerateFlowInitial._() : super._();

  factory GenerateFlowInitial.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowInitialImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowInitialImplCopyWith<_$GenerateFlowInitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowCreatedClientImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowCreatedClientImplCopyWith(
    _$GenerateFlowCreatedClientImpl value,
    $Res Function(_$GenerateFlowCreatedClientImpl) then,
  ) = __$$GenerateFlowCreatedClientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    ApiClientEntity client,
  });

  $ApiClientEntityCopyWith<$Res> get client;
}

/// @nodoc
class __$$GenerateFlowCreatedClientImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<$Res, _$GenerateFlowCreatedClientImpl>
    implements _$$GenerateFlowCreatedClientImplCopyWith<$Res> {
  __$$GenerateFlowCreatedClientImplCopyWithImpl(
    _$GenerateFlowCreatedClientImpl _value,
    $Res Function(_$GenerateFlowCreatedClientImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
  }) {
    return _then(
      _$GenerateFlowCreatedClientImpl(
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

  /// Create a copy of GenerateFlowState
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
class _$GenerateFlowCreatedClientImpl extends GenerateFlowCreatedClient {
  _$GenerateFlowCreatedClientImpl({
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    final String? $type,
  }) : $type = $type ?? 'createdClient',
       super._();

  factory _$GenerateFlowCreatedClientImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateFlowCreatedClientImplFromJson(json);

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
    return 'GenerateFlowState.createdClient(accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowCreatedClientImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.client, client) || other.client == client));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accountApiKey, directoryPath, client);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowCreatedClientImplCopyWith<_$GenerateFlowCreatedClientImpl>
  get copyWith => __$$GenerateFlowCreatedClientImplCopyWithImpl<
    _$GenerateFlowCreatedClientImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountApiKey, String directoryPath)
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
  }) {
    return createdClient(accountApiKey, directoryPath, client);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String accountApiKey, String directoryPath)? initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
  }) {
    return createdClient?.call(accountApiKey, directoryPath, client);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountApiKey, String directoryPath)? initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    required TResult orElse(),
  }) {
    if (createdClient != null) {
      return createdClient(accountApiKey, directoryPath, client);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
  }) {
    return createdClient(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
  }) {
    return createdClient?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    required TResult orElse(),
  }) {
    if (createdClient != null) {
      return createdClient(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowCreatedClientImplToJson(this);
  }
}

abstract class GenerateFlowCreatedClient extends GenerateFlowState {
  factory GenerateFlowCreatedClient({
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
  }) = _$GenerateFlowCreatedClientImpl;
  GenerateFlowCreatedClient._() : super._();

  factory GenerateFlowCreatedClient.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowCreatedClientImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowCreatedClientImplCopyWith<_$GenerateFlowCreatedClientImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowEnsureGitImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowEnsureGitImplCopyWith(
    _$GenerateFlowEnsureGitImpl value,
    $Res Function(_$GenerateFlowEnsureGitImpl) then,
  ) = __$$GenerateFlowEnsureGitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    ApiClientEntity client,
  });

  $ApiClientEntityCopyWith<$Res> get client;
}

/// @nodoc
class __$$GenerateFlowEnsureGitImplCopyWithImpl<$Res>
    extends _$GenerateFlowStateCopyWithImpl<$Res, _$GenerateFlowEnsureGitImpl>
    implements _$$GenerateFlowEnsureGitImplCopyWith<$Res> {
  __$$GenerateFlowEnsureGitImplCopyWithImpl(
    _$GenerateFlowEnsureGitImpl _value,
    $Res Function(_$GenerateFlowEnsureGitImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
  }) {
    return _then(
      _$GenerateFlowEnsureGitImpl(
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

  /// Create a copy of GenerateFlowState
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
class _$GenerateFlowEnsureGitImpl extends GenerateFlowEnsureGit {
  _$GenerateFlowEnsureGitImpl({
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    final String? $type,
  }) : $type = $type ?? 'ensuredGit',
       super._();

  factory _$GenerateFlowEnsureGitImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateFlowEnsureGitImplFromJson(json);

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
    return 'GenerateFlowState.ensuredGit(accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowEnsureGitImpl &&
            (identical(other.accountApiKey, accountApiKey) ||
                other.accountApiKey == accountApiKey) &&
            (identical(other.directoryPath, directoryPath) ||
                other.directoryPath == directoryPath) &&
            (identical(other.client, client) || other.client == client));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, accountApiKey, directoryPath, client);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowEnsureGitImplCopyWith<_$GenerateFlowEnsureGitImpl>
  get copyWith =>
      __$$GenerateFlowEnsureGitImplCopyWithImpl<_$GenerateFlowEnsureGitImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountApiKey, String directoryPath)
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
  }) {
    return ensuredGit(accountApiKey, directoryPath, client);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String accountApiKey, String directoryPath)? initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
  }) {
    return ensuredGit?.call(accountApiKey, directoryPath, client);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountApiKey, String directoryPath)? initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    required TResult orElse(),
  }) {
    if (ensuredGit != null) {
      return ensuredGit(accountApiKey, directoryPath, client);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
  }) {
    return ensuredGit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
  }) {
    return ensuredGit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    required TResult orElse(),
  }) {
    if (ensuredGit != null) {
      return ensuredGit(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowEnsureGitImplToJson(this);
  }
}

abstract class GenerateFlowEnsureGit extends GenerateFlowState {
  factory GenerateFlowEnsureGit({
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
  }) = _$GenerateFlowEnsureGitImpl;
  GenerateFlowEnsureGit._() : super._();

  factory GenerateFlowEnsureGit.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowEnsureGitImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowEnsureGitImplCopyWith<_$GenerateFlowEnsureGitImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowGotCodeBaseYamlImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowGotCodeBaseYamlImplCopyWith(
    _$GenerateFlowGotCodeBaseYamlImpl value,
    $Res Function(_$GenerateFlowGotCodeBaseYamlImpl) then,
  ) = __$$GenerateFlowGotCodeBaseYamlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String accountApiKey,
    String directoryPath,
    ApiClientEntity client,
    CodeBaseYamlInfo yamlInfo,
  });

  $ApiClientEntityCopyWith<$Res> get client;
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo;
}

/// @nodoc
class __$$GenerateFlowGotCodeBaseYamlImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<$Res, _$GenerateFlowGotCodeBaseYamlImpl>
    implements _$$GenerateFlowGotCodeBaseYamlImplCopyWith<$Res> {
  __$$GenerateFlowGotCodeBaseYamlImplCopyWithImpl(
    _$GenerateFlowGotCodeBaseYamlImpl _value,
    $Res Function(_$GenerateFlowGotCodeBaseYamlImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
    Object? yamlInfo = null,
  }) {
    return _then(
      _$GenerateFlowGotCodeBaseYamlImpl(
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

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
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
class _$GenerateFlowGotCodeBaseYamlImpl extends GenerateFlowGotCodeBaseYaml {
  _$GenerateFlowGotCodeBaseYamlImpl({
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    required this.yamlInfo,
    final String? $type,
  }) : $type = $type ?? 'gotCodeBaseYaml',
       super._();

  factory _$GenerateFlowGotCodeBaseYamlImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GenerateFlowGotCodeBaseYamlImplFromJson(json);

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
    return 'GenerateFlowState.gotCodeBaseYaml(accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowGotCodeBaseYamlImpl &&
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
  int get hashCode =>
      Object.hash(runtimeType, accountApiKey, directoryPath, client, yamlInfo);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowGotCodeBaseYamlImplCopyWith<_$GenerateFlowGotCodeBaseYamlImpl>
  get copyWith => __$$GenerateFlowGotCodeBaseYamlImplCopyWithImpl<
    _$GenerateFlowGotCodeBaseYamlImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountApiKey, String directoryPath)
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
  }) {
    return gotCodeBaseYaml(accountApiKey, directoryPath, client, yamlInfo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String accountApiKey, String directoryPath)? initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
  }) {
    return gotCodeBaseYaml?.call(
      accountApiKey,
      directoryPath,
      client,
      yamlInfo,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String accountApiKey, String directoryPath)? initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    required TResult orElse(),
  }) {
    if (gotCodeBaseYaml != null) {
      return gotCodeBaseYaml(accountApiKey, directoryPath, client, yamlInfo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
  }) {
    return gotCodeBaseYaml(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
  }) {
    return gotCodeBaseYaml?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    required TResult orElse(),
  }) {
    if (gotCodeBaseYaml != null) {
      return gotCodeBaseYaml(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowGotCodeBaseYamlImplToJson(this);
  }
}

abstract class GenerateFlowGotCodeBaseYaml extends GenerateFlowState {
  factory GenerateFlowGotCodeBaseYaml({
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
  }) = _$GenerateFlowGotCodeBaseYamlImpl;
  GenerateFlowGotCodeBaseYaml._() : super._();

  factory GenerateFlowGotCodeBaseYaml.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowGotCodeBaseYamlImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowGotCodeBaseYamlImplCopyWith<_$GenerateFlowGotCodeBaseYamlImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowGotGitUserImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowGotGitUserImplCopyWith(
    _$GenerateFlowGotGitUserImpl value,
    $Res Function(_$GenerateFlowGotGitUserImpl) then,
  ) = __$$GenerateFlowGotGitUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
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
class __$$GenerateFlowGotGitUserImplCopyWithImpl<$Res>
    extends _$GenerateFlowStateCopyWithImpl<$Res, _$GenerateFlowGotGitUserImpl>
    implements _$$GenerateFlowGotGitUserImplCopyWith<$Res> {
  __$$GenerateFlowGotGitUserImplCopyWithImpl(
    _$GenerateFlowGotGitUserImpl _value,
    $Res Function(_$GenerateFlowGotGitUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitUser = null,
  }) {
    return _then(
      _$GenerateFlowGotGitUserImpl(
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

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
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
class _$GenerateFlowGotGitUserImpl extends GenerateFlowGotGitUser {
  _$GenerateFlowGotGitUserImpl({
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    required this.yamlInfo,
    required this.gitUser,
    final String? $type,
  }) : $type = $type ?? 'gotGitUser',
       super._();

  factory _$GenerateFlowGotGitUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateFlowGotGitUserImplFromJson(json);

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
    return 'GenerateFlowState.gotGitUser(accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitUser: $gitUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowGotGitUserImpl &&
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
    accountApiKey,
    directoryPath,
    client,
    yamlInfo,
    gitUser,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowGotGitUserImplCopyWith<_$GenerateFlowGotGitUserImpl>
  get copyWith =>
      __$$GenerateFlowGotGitUserImplCopyWithImpl<_$GenerateFlowGotGitUserImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountApiKey, String directoryPath)
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
  }) {
    return gotGitUser(accountApiKey, directoryPath, client, yamlInfo, gitUser);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String accountApiKey, String directoryPath)? initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
  }) {
    return gotGitUser?.call(
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
    TResult Function(String accountApiKey, String directoryPath)? initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    required TResult orElse(),
  }) {
    if (gotGitUser != null) {
      return gotGitUser(
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
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
  }) {
    return gotGitUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
  }) {
    return gotGitUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    required TResult orElse(),
  }) {
    if (gotGitUser != null) {
      return gotGitUser(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowGotGitUserImplToJson(this);
  }
}

abstract class GenerateFlowGotGitUser extends GenerateFlowState {
  factory GenerateFlowGotGitUser({
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitUser gitUser,
  }) = _$GenerateFlowGotGitUserImpl;
  GenerateFlowGotGitUser._() : super._();

  factory GenerateFlowGotGitUser.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowGotGitUserImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitUser get gitUser;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowGotGitUserImplCopyWith<_$GenerateFlowGotGitUserImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowGotLastLocalCommitImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowGotLastLocalCommitImplCopyWith(
    _$GenerateFlowGotLastLocalCommitImpl value,
    $Res Function(_$GenerateFlowGotLastLocalCommitImpl) then,
  ) = __$$GenerateFlowGotLastLocalCommitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
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
class __$$GenerateFlowGotLastLocalCommitImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<
          $Res,
          _$GenerateFlowGotLastLocalCommitImpl
        >
    implements _$$GenerateFlowGotLastLocalCommitImplCopyWith<$Res> {
  __$$GenerateFlowGotLastLocalCommitImplCopyWithImpl(
    _$GenerateFlowGotLastLocalCommitImpl _value,
    $Res Function(_$GenerateFlowGotLastLocalCommitImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitUser = null,
    Object? previousCommit = null,
  }) {
    return _then(
      _$GenerateFlowGotLastLocalCommitImpl(
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

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
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
class _$GenerateFlowGotLastLocalCommitImpl
    extends GenerateFlowGotLastLocalCommit {
  _$GenerateFlowGotLastLocalCommitImpl({
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    required this.yamlInfo,
    required this.gitUser,
    required this.previousCommit,
    final String? $type,
  }) : $type = $type ?? 'gotLastLocalCommit',
       super._();

  factory _$GenerateFlowGotLastLocalCommitImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GenerateFlowGotLastLocalCommitImplFromJson(json);

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
    return 'GenerateFlowState.gotLastLocalCommit(accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitUser: $gitUser, previousCommit: $previousCommit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowGotLastLocalCommitImpl &&
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
    accountApiKey,
    directoryPath,
    client,
    yamlInfo,
    gitUser,
    previousCommit,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowGotLastLocalCommitImplCopyWith<
    _$GenerateFlowGotLastLocalCommitImpl
  >
  get copyWith => __$$GenerateFlowGotLastLocalCommitImplCopyWithImpl<
    _$GenerateFlowGotLastLocalCommitImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountApiKey, String directoryPath)
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
  }) {
    return gotLastLocalCommit(
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
    TResult? Function(String accountApiKey, String directoryPath)? initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
  }) {
    return gotLastLocalCommit?.call(
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
    TResult Function(String accountApiKey, String directoryPath)? initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    required TResult orElse(),
  }) {
    if (gotLastLocalCommit != null) {
      return gotLastLocalCommit(
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
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
  }) {
    return gotLastLocalCommit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
  }) {
    return gotLastLocalCommit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    required TResult orElse(),
  }) {
    if (gotLastLocalCommit != null) {
      return gotLastLocalCommit(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowGotLastLocalCommitImplToJson(this);
  }
}

abstract class GenerateFlowGotLastLocalCommit extends GenerateFlowState {
  factory GenerateFlowGotLastLocalCommit({
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitUser gitUser,
    required final GitCommit previousCommit,
  }) = _$GenerateFlowGotLastLocalCommitImpl;
  GenerateFlowGotLastLocalCommit._() : super._();

  factory GenerateFlowGotLastLocalCommit.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowGotLastLocalCommitImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitUser get gitUser;
  GitCommit get previousCommit;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowGotLastLocalCommitImplCopyWith<
    _$GenerateFlowGotLastLocalCommitImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowGotProjectOriginUrlImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowGotProjectOriginUrlImplCopyWith(
    _$GenerateFlowGotProjectOriginUrlImpl value,
    $Res Function(_$GenerateFlowGotProjectOriginUrlImpl) then,
  ) = __$$GenerateFlowGotProjectOriginUrlImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
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
class __$$GenerateFlowGotProjectOriginUrlImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<
          $Res,
          _$GenerateFlowGotProjectOriginUrlImpl
        >
    implements _$$GenerateFlowGotProjectOriginUrlImplCopyWith<$Res> {
  __$$GenerateFlowGotProjectOriginUrlImplCopyWithImpl(
    _$GenerateFlowGotProjectOriginUrlImpl _value,
    $Res Function(_$GenerateFlowGotProjectOriginUrlImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitUser = null,
    Object? previousCommit = null,
    Object? projectOriginUrl = null,
  }) {
    return _then(
      _$GenerateFlowGotProjectOriginUrlImpl(
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

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
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
class _$GenerateFlowGotProjectOriginUrlImpl
    extends GenerateFlowGotProjectOriginUrl {
  _$GenerateFlowGotProjectOriginUrlImpl({
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

  factory _$GenerateFlowGotProjectOriginUrlImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GenerateFlowGotProjectOriginUrlImplFromJson(json);

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
    return 'GenerateFlowState.gotProjectOriginUrl(accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitUser: $gitUser, previousCommit: $previousCommit, projectOriginUrl: $projectOriginUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowGotProjectOriginUrlImpl &&
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
    accountApiKey,
    directoryPath,
    client,
    yamlInfo,
    gitUser,
    previousCommit,
    projectOriginUrl,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowGotProjectOriginUrlImplCopyWith<
    _$GenerateFlowGotProjectOriginUrlImpl
  >
  get copyWith => __$$GenerateFlowGotProjectOriginUrlImplCopyWithImpl<
    _$GenerateFlowGotProjectOriginUrlImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountApiKey, String directoryPath)
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
  }) {
    return gotProjectOriginUrl(
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
    TResult? Function(String accountApiKey, String directoryPath)? initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
  }) {
    return gotProjectOriginUrl?.call(
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
    TResult Function(String accountApiKey, String directoryPath)? initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    required TResult orElse(),
  }) {
    if (gotProjectOriginUrl != null) {
      return gotProjectOriginUrl(
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
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
  }) {
    return gotProjectOriginUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
  }) {
    return gotProjectOriginUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    required TResult orElse(),
  }) {
    if (gotProjectOriginUrl != null) {
      return gotProjectOriginUrl(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowGotProjectOriginUrlImplToJson(this);
  }
}

abstract class GenerateFlowGotProjectOriginUrl extends GenerateFlowState {
  factory GenerateFlowGotProjectOriginUrl({
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitUser gitUser,
    required final GitCommit previousCommit,
    required final String projectOriginUrl,
  }) = _$GenerateFlowGotProjectOriginUrlImpl;
  GenerateFlowGotProjectOriginUrl._() : super._();

  factory GenerateFlowGotProjectOriginUrl.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowGotProjectOriginUrlImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitUser get gitUser;
  GitCommit get previousCommit;
  String get projectOriginUrl;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowGotProjectOriginUrlImplCopyWith<
    _$GenerateFlowGotProjectOriginUrlImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GenerateFlowGotGitVariablesImplCopyWith<$Res>
    implements $GenerateFlowStateCopyWith<$Res> {
  factory _$$GenerateFlowGotGitVariablesImplCopyWith(
    _$GenerateFlowGotGitVariablesImpl value,
    $Res Function(_$GenerateFlowGotGitVariablesImpl) then,
  ) = __$$GenerateFlowGotGitVariablesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
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
class __$$GenerateFlowGotGitVariablesImplCopyWithImpl<$Res>
    extends
        _$GenerateFlowStateCopyWithImpl<$Res, _$GenerateFlowGotGitVariablesImpl>
    implements _$$GenerateFlowGotGitVariablesImplCopyWith<$Res> {
  __$$GenerateFlowGotGitVariablesImplCopyWithImpl(
    _$GenerateFlowGotGitVariablesImpl _value,
    $Res Function(_$GenerateFlowGotGitVariablesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountApiKey = null,
    Object? directoryPath = null,
    Object? client = null,
    Object? yamlInfo = null,
    Object? gitVariables = null,
  }) {
    return _then(
      _$GenerateFlowGotGitVariablesImpl(
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

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiClientEntityCopyWith<$Res> get client {
    return $ApiClientEntityCopyWith<$Res>(_value.client, (value) {
      return _then(_value.copyWith(client: value));
    });
  }

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CodeBaseYamlInfoCopyWith<$Res> get yamlInfo {
    return $CodeBaseYamlInfoCopyWith<$Res>(_value.yamlInfo, (value) {
      return _then(_value.copyWith(yamlInfo: value));
    });
  }

  /// Create a copy of GenerateFlowState
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
class _$GenerateFlowGotGitVariablesImpl extends GenerateFlowGotGitVariables {
  _$GenerateFlowGotGitVariablesImpl({
    required this.accountApiKey,
    required this.directoryPath,
    required this.client,
    required this.yamlInfo,
    required this.gitVariables,
    final String? $type,
  }) : $type = $type ?? 'gotGitVariables',
       super._();

  factory _$GenerateFlowGotGitVariablesImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$GenerateFlowGotGitVariablesImplFromJson(json);

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
    return 'GenerateFlowState.gotGitVariables(accountApiKey: $accountApiKey, directoryPath: $directoryPath, client: $client, yamlInfo: $yamlInfo, gitVariables: $gitVariables)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateFlowGotGitVariablesImpl &&
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
    accountApiKey,
    directoryPath,
    client,
    yamlInfo,
    gitVariables,
  );

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateFlowGotGitVariablesImplCopyWith<_$GenerateFlowGotGitVariablesImpl>
  get copyWith => __$$GenerateFlowGotGitVariablesImplCopyWithImpl<
    _$GenerateFlowGotGitVariablesImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String accountApiKey, String directoryPath)
    initial,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    createdClient,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )
    ensuredGit,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )
    gotCodeBaseYaml,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )
    gotGitUser,
    required TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )
    gotLastLocalCommit,
    required TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )
    gotGitVariables,
  }) {
    return gotGitVariables(
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
    TResult? Function(String accountApiKey, String directoryPath)? initial,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult? Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult? Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
  }) {
    return gotGitVariables?.call(
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
    TResult Function(String accountApiKey, String directoryPath)? initial,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    createdClient,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
    )?
    ensuredGit,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
    )?
    gotCodeBaseYaml,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
    )?
    gotGitUser,
    TResult Function(
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitUser gitUser,
      GitCommit previousCommit,
    )?
    gotLastLocalCommit,
    TResult Function(
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
      String accountApiKey,
      String directoryPath,
      ApiClientEntity client,
      CodeBaseYamlInfo yamlInfo,
      GitVariables gitVariables,
    )?
    gotGitVariables,
    required TResult orElse(),
  }) {
    if (gotGitVariables != null) {
      return gotGitVariables(
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
    required TResult Function(GenerateFlowInitial value) initial,
    required TResult Function(GenerateFlowCreatedClient value) createdClient,
    required TResult Function(GenerateFlowEnsureGit value) ensuredGit,
    required TResult Function(GenerateFlowGotCodeBaseYaml value)
    gotCodeBaseYaml,
    required TResult Function(GenerateFlowGotGitUser value) gotGitUser,
    required TResult Function(GenerateFlowGotLastLocalCommit value)
    gotLastLocalCommit,
    required TResult Function(GenerateFlowGotProjectOriginUrl value)
    gotProjectOriginUrl,
    required TResult Function(GenerateFlowGotGitVariables value)
    gotGitVariables,
  }) {
    return gotGitVariables(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GenerateFlowInitial value)? initial,
    TResult? Function(GenerateFlowCreatedClient value)? createdClient,
    TResult? Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult? Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult? Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult? Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult? Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult? Function(GenerateFlowGotGitVariables value)? gotGitVariables,
  }) {
    return gotGitVariables?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GenerateFlowInitial value)? initial,
    TResult Function(GenerateFlowCreatedClient value)? createdClient,
    TResult Function(GenerateFlowEnsureGit value)? ensuredGit,
    TResult Function(GenerateFlowGotCodeBaseYaml value)? gotCodeBaseYaml,
    TResult Function(GenerateFlowGotGitUser value)? gotGitUser,
    TResult Function(GenerateFlowGotLastLocalCommit value)? gotLastLocalCommit,
    TResult Function(GenerateFlowGotProjectOriginUrl value)?
    gotProjectOriginUrl,
    TResult Function(GenerateFlowGotGitVariables value)? gotGitVariables,
    required TResult orElse(),
  }) {
    if (gotGitVariables != null) {
      return gotGitVariables(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateFlowGotGitVariablesImplToJson(this);
  }
}

abstract class GenerateFlowGotGitVariables extends GenerateFlowState {
  factory GenerateFlowGotGitVariables({
    required final String accountApiKey,
    required final String directoryPath,
    required final ApiClientEntity client,
    required final CodeBaseYamlInfo yamlInfo,
    required final GitVariables gitVariables,
  }) = _$GenerateFlowGotGitVariablesImpl;
  GenerateFlowGotGitVariables._() : super._();

  factory GenerateFlowGotGitVariables.fromJson(Map<String, dynamic> json) =
      _$GenerateFlowGotGitVariablesImpl.fromJson;

  @override
  String get accountApiKey;
  @override
  String get directoryPath;
  ApiClientEntity get client;
  CodeBaseYamlInfo get yamlInfo;
  GitVariables get gitVariables;

  /// Create a copy of GenerateFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateFlowGotGitVariablesImplCopyWith<_$GenerateFlowGotGitVariablesImpl>
  get copyWith => throw _privateConstructorUsedError;
}
