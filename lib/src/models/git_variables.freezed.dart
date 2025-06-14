// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'git_variables.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GitVariables _$GitVariablesFromJson(Map<String, dynamic> json) {
  return _GitVariables.fromJson(json);
}

/// @nodoc
mixin _$GitVariables {
  GitUser get user => throw _privateConstructorUsedError;
  GitCommit get previousCommit => throw _privateConstructorUsedError;
  String get latestShaIdentifier => throw _privateConstructorUsedError;
  String get originUrl => throw _privateConstructorUsedError;
  BigInt get projectShaIdentifier => throw _privateConstructorUsedError;

  /// Serializes this GitVariables to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GitVariables
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GitVariablesCopyWith<GitVariables> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GitVariablesCopyWith<$Res> {
  factory $GitVariablesCopyWith(
    GitVariables value,
    $Res Function(GitVariables) then,
  ) = _$GitVariablesCopyWithImpl<$Res, GitVariables>;
  @useResult
  $Res call({
    GitUser user,
    GitCommit previousCommit,
    String latestShaIdentifier,
    String originUrl,
    BigInt projectShaIdentifier,
  });
}

/// @nodoc
class _$GitVariablesCopyWithImpl<$Res, $Val extends GitVariables>
    implements $GitVariablesCopyWith<$Res> {
  _$GitVariablesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GitVariables
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? previousCommit = null,
    Object? latestShaIdentifier = null,
    Object? originUrl = null,
    Object? projectShaIdentifier = null,
  }) {
    return _then(
      _value.copyWith(
            user:
                null == user
                    ? _value.user
                    : user // ignore: cast_nullable_to_non_nullable
                        as GitUser,
            previousCommit:
                null == previousCommit
                    ? _value.previousCommit
                    : previousCommit // ignore: cast_nullable_to_non_nullable
                        as GitCommit,
            latestShaIdentifier:
                null == latestShaIdentifier
                    ? _value.latestShaIdentifier
                    : latestShaIdentifier // ignore: cast_nullable_to_non_nullable
                        as String,
            originUrl:
                null == originUrl
                    ? _value.originUrl
                    : originUrl // ignore: cast_nullable_to_non_nullable
                        as String,
            projectShaIdentifier:
                null == projectShaIdentifier
                    ? _value.projectShaIdentifier
                    : projectShaIdentifier // ignore: cast_nullable_to_non_nullable
                        as BigInt,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GitVariablesImplCopyWith<$Res>
    implements $GitVariablesCopyWith<$Res> {
  factory _$$GitVariablesImplCopyWith(
    _$GitVariablesImpl value,
    $Res Function(_$GitVariablesImpl) then,
  ) = __$$GitVariablesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    GitUser user,
    GitCommit previousCommit,
    String latestShaIdentifier,
    String originUrl,
    BigInt projectShaIdentifier,
  });
}

/// @nodoc
class __$$GitVariablesImplCopyWithImpl<$Res>
    extends _$GitVariablesCopyWithImpl<$Res, _$GitVariablesImpl>
    implements _$$GitVariablesImplCopyWith<$Res> {
  __$$GitVariablesImplCopyWithImpl(
    _$GitVariablesImpl _value,
    $Res Function(_$GitVariablesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GitVariables
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? previousCommit = null,
    Object? latestShaIdentifier = null,
    Object? originUrl = null,
    Object? projectShaIdentifier = null,
  }) {
    return _then(
      _$GitVariablesImpl(
        user:
            null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                    as GitUser,
        previousCommit:
            null == previousCommit
                ? _value.previousCommit
                : previousCommit // ignore: cast_nullable_to_non_nullable
                    as GitCommit,
        latestShaIdentifier:
            null == latestShaIdentifier
                ? _value.latestShaIdentifier
                : latestShaIdentifier // ignore: cast_nullable_to_non_nullable
                    as String,
        originUrl:
            null == originUrl
                ? _value.originUrl
                : originUrl // ignore: cast_nullable_to_non_nullable
                    as String,
        projectShaIdentifier:
            null == projectShaIdentifier
                ? _value.projectShaIdentifier
                : projectShaIdentifier // ignore: cast_nullable_to_non_nullable
                    as BigInt,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GitVariablesImpl implements _GitVariables {
  _$GitVariablesImpl({
    required this.user,
    required this.previousCommit,
    required this.latestShaIdentifier,
    required this.originUrl,
    required this.projectShaIdentifier,
  });

  factory _$GitVariablesImpl.fromJson(Map<String, dynamic> json) =>
      _$$GitVariablesImplFromJson(json);

  @override
  final GitUser user;
  @override
  final GitCommit previousCommit;
  @override
  final String latestShaIdentifier;
  @override
  final String originUrl;
  @override
  final BigInt projectShaIdentifier;

  @override
  String toString() {
    return 'GitVariables(user: $user, previousCommit: $previousCommit, latestShaIdentifier: $latestShaIdentifier, originUrl: $originUrl, projectShaIdentifier: $projectShaIdentifier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GitVariablesImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.previousCommit, previousCommit) ||
                other.previousCommit == previousCommit) &&
            (identical(other.latestShaIdentifier, latestShaIdentifier) ||
                other.latestShaIdentifier == latestShaIdentifier) &&
            (identical(other.originUrl, originUrl) ||
                other.originUrl == originUrl) &&
            (identical(other.projectShaIdentifier, projectShaIdentifier) ||
                other.projectShaIdentifier == projectShaIdentifier));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    user,
    previousCommit,
    latestShaIdentifier,
    originUrl,
    projectShaIdentifier,
  );

  /// Create a copy of GitVariables
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GitVariablesImplCopyWith<_$GitVariablesImpl> get copyWith =>
      __$$GitVariablesImplCopyWithImpl<_$GitVariablesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GitVariablesImplToJson(this);
  }
}

abstract class _GitVariables implements GitVariables {
  factory _GitVariables({
    required final GitUser user,
    required final GitCommit previousCommit,
    required final String latestShaIdentifier,
    required final String originUrl,
    required final BigInt projectShaIdentifier,
  }) = _$GitVariablesImpl;

  factory _GitVariables.fromJson(Map<String, dynamic> json) =
      _$GitVariablesImpl.fromJson;

  @override
  GitUser get user;
  @override
  GitCommit get previousCommit;
  @override
  String get latestShaIdentifier;
  @override
  String get originUrl;
  @override
  BigInt get projectShaIdentifier;

  /// Create a copy of GitVariables
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GitVariablesImplCopyWith<_$GitVariablesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
