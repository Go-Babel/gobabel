// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_last_commit_sha_stamps.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProjectLastCommitShaStamps _$ProjectLastCommitShaStampsFromJson(
    Map<String, dynamic> json) {
  return _ProjectLastCommitShaStamps.fromJson(json);
}

/// @nodoc
mixin _$ProjectLastCommitShaStamps {
  String get lastCommitShaShort => throw _privateConstructorUsedError;
  String get lastCommitShaFull => throw _privateConstructorUsedError;

  /// Serializes this ProjectLastCommitShaStamps to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProjectLastCommitShaStamps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectLastCommitShaStampsCopyWith<ProjectLastCommitShaStamps>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectLastCommitShaStampsCopyWith<$Res> {
  factory $ProjectLastCommitShaStampsCopyWith(ProjectLastCommitShaStamps value,
          $Res Function(ProjectLastCommitShaStamps) then) =
      _$ProjectLastCommitShaStampsCopyWithImpl<$Res,
          ProjectLastCommitShaStamps>;
  @useResult
  $Res call({String lastCommitShaShort, String lastCommitShaFull});
}

/// @nodoc
class _$ProjectLastCommitShaStampsCopyWithImpl<$Res,
        $Val extends ProjectLastCommitShaStamps>
    implements $ProjectLastCommitShaStampsCopyWith<$Res> {
  _$ProjectLastCommitShaStampsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectLastCommitShaStamps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastCommitShaShort = null,
    Object? lastCommitShaFull = null,
  }) {
    return _then(_value.copyWith(
      lastCommitShaShort: null == lastCommitShaShort
          ? _value.lastCommitShaShort
          : lastCommitShaShort // ignore: cast_nullable_to_non_nullable
              as String,
      lastCommitShaFull: null == lastCommitShaFull
          ? _value.lastCommitShaFull
          : lastCommitShaFull // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProjectLastCommitShaStampsImplCopyWith<$Res>
    implements $ProjectLastCommitShaStampsCopyWith<$Res> {
  factory _$$ProjectLastCommitShaStampsImplCopyWith(
          _$ProjectLastCommitShaStampsImpl value,
          $Res Function(_$ProjectLastCommitShaStampsImpl) then) =
      __$$ProjectLastCommitShaStampsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String lastCommitShaShort, String lastCommitShaFull});
}

/// @nodoc
class __$$ProjectLastCommitShaStampsImplCopyWithImpl<$Res>
    extends _$ProjectLastCommitShaStampsCopyWithImpl<$Res,
        _$ProjectLastCommitShaStampsImpl>
    implements _$$ProjectLastCommitShaStampsImplCopyWith<$Res> {
  __$$ProjectLastCommitShaStampsImplCopyWithImpl(
      _$ProjectLastCommitShaStampsImpl _value,
      $Res Function(_$ProjectLastCommitShaStampsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectLastCommitShaStamps
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastCommitShaShort = null,
    Object? lastCommitShaFull = null,
  }) {
    return _then(_$ProjectLastCommitShaStampsImpl(
      lastCommitShaShort: null == lastCommitShaShort
          ? _value.lastCommitShaShort
          : lastCommitShaShort // ignore: cast_nullable_to_non_nullable
              as String,
      lastCommitShaFull: null == lastCommitShaFull
          ? _value.lastCommitShaFull
          : lastCommitShaFull // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProjectLastCommitShaStampsImpl implements _ProjectLastCommitShaStamps {
  const _$ProjectLastCommitShaStampsImpl(
      {required this.lastCommitShaShort, required this.lastCommitShaFull});

  factory _$ProjectLastCommitShaStampsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProjectLastCommitShaStampsImplFromJson(json);

  @override
  final String lastCommitShaShort;
  @override
  final String lastCommitShaFull;

  @override
  String toString() {
    return 'ProjectLastCommitShaStamps(lastCommitShaShort: $lastCommitShaShort, lastCommitShaFull: $lastCommitShaFull)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectLastCommitShaStampsImpl &&
            (identical(other.lastCommitShaShort, lastCommitShaShort) ||
                other.lastCommitShaShort == lastCommitShaShort) &&
            (identical(other.lastCommitShaFull, lastCommitShaFull) ||
                other.lastCommitShaFull == lastCommitShaFull));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, lastCommitShaShort, lastCommitShaFull);

  /// Create a copy of ProjectLastCommitShaStamps
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectLastCommitShaStampsImplCopyWith<_$ProjectLastCommitShaStampsImpl>
      get copyWith => __$$ProjectLastCommitShaStampsImplCopyWithImpl<
          _$ProjectLastCommitShaStampsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProjectLastCommitShaStampsImplToJson(
      this,
    );
  }
}

abstract class _ProjectLastCommitShaStamps
    implements ProjectLastCommitShaStamps {
  const factory _ProjectLastCommitShaStamps(
          {required final String lastCommitShaShort,
          required final String lastCommitShaFull}) =
      _$ProjectLastCommitShaStampsImpl;

  factory _ProjectLastCommitShaStamps.fromJson(Map<String, dynamic> json) =
      _$ProjectLastCommitShaStampsImpl.fromJson;

  @override
  String get lastCommitShaShort;
  @override
  String get lastCommitShaFull;

  /// Create a copy of ProjectLastCommitShaStamps
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectLastCommitShaStampsImplCopyWith<_$ProjectLastCommitShaStampsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
