// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_client_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiClientEntity _$ApiClientEntityFromJson(Map<String, dynamic> json) {
  return _ApiClientEntity.fromJson(json);
}

/// @nodoc
mixin _$ApiClientEntity {
  String get host => throw _privateConstructorUsedError;
  Duration get connectionTimeout => throw _privateConstructorUsedError;

  /// Serializes this ApiClientEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiClientEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiClientEntityCopyWith<ApiClientEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiClientEntityCopyWith<$Res> {
  factory $ApiClientEntityCopyWith(
          ApiClientEntity value, $Res Function(ApiClientEntity) then) =
      _$ApiClientEntityCopyWithImpl<$Res, ApiClientEntity>;
  @useResult
  $Res call({String host, Duration connectionTimeout});
}

/// @nodoc
class _$ApiClientEntityCopyWithImpl<$Res, $Val extends ApiClientEntity>
    implements $ApiClientEntityCopyWith<$Res> {
  _$ApiClientEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiClientEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? connectionTimeout = null,
  }) {
    return _then(_value.copyWith(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      connectionTimeout: null == connectionTimeout
          ? _value.connectionTimeout
          : connectionTimeout // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiClientEntityImplCopyWith<$Res>
    implements $ApiClientEntityCopyWith<$Res> {
  factory _$$ApiClientEntityImplCopyWith(_$ApiClientEntityImpl value,
          $Res Function(_$ApiClientEntityImpl) then) =
      __$$ApiClientEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String host, Duration connectionTimeout});
}

/// @nodoc
class __$$ApiClientEntityImplCopyWithImpl<$Res>
    extends _$ApiClientEntityCopyWithImpl<$Res, _$ApiClientEntityImpl>
    implements _$$ApiClientEntityImplCopyWith<$Res> {
  __$$ApiClientEntityImplCopyWithImpl(
      _$ApiClientEntityImpl _value, $Res Function(_$ApiClientEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiClientEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? host = null,
    Object? connectionTimeout = null,
  }) {
    return _then(_$ApiClientEntityImpl(
      host: null == host
          ? _value.host
          : host // ignore: cast_nullable_to_non_nullable
              as String,
      connectionTimeout: null == connectionTimeout
          ? _value.connectionTimeout
          : connectionTimeout // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiClientEntityImpl extends _ApiClientEntity {
  _$ApiClientEntityImpl({required this.host, required this.connectionTimeout})
      : super._();

  factory _$ApiClientEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiClientEntityImplFromJson(json);

  @override
  final String host;
  @override
  final Duration connectionTimeout;

  @override
  String toString() {
    return 'ApiClientEntity(host: $host, connectionTimeout: $connectionTimeout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiClientEntityImpl &&
            (identical(other.host, host) || other.host == host) &&
            (identical(other.connectionTimeout, connectionTimeout) ||
                other.connectionTimeout == connectionTimeout));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, host, connectionTimeout);

  /// Create a copy of ApiClientEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiClientEntityImplCopyWith<_$ApiClientEntityImpl> get copyWith =>
      __$$ApiClientEntityImplCopyWithImpl<_$ApiClientEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiClientEntityImplToJson(
      this,
    );
  }
}

abstract class _ApiClientEntity extends ApiClientEntity {
  factory _ApiClientEntity(
      {required final String host,
      required final Duration connectionTimeout}) = _$ApiClientEntityImpl;
  _ApiClientEntity._() : super._();

  factory _ApiClientEntity.fromJson(Map<String, dynamic> json) =
      _$ApiClientEntityImpl.fromJson;

  @override
  String get host;
  @override
  Duration get connectionTimeout;

  /// Create a copy of ApiClientEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiClientEntityImplCopyWith<_$ApiClientEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
