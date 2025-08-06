// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'code_base_yaml_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CodeBaseYamlInfo _$CodeBaseYamlInfoFromJson(Map<String, dynamic> json) {
  return _CodeBaseYamlInfo.fromJson(json);
}

/// @nodoc
mixin _$CodeBaseYamlInfo {
  String get projectName => throw _privateConstructorUsedError;
  String? get projectDescription => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  ProjectType get type => throw _privateConstructorUsedError;

  /// Serializes this CodeBaseYamlInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CodeBaseYamlInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CodeBaseYamlInfoCopyWith<CodeBaseYamlInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CodeBaseYamlInfoCopyWith<$Res> {
  factory $CodeBaseYamlInfoCopyWith(
          CodeBaseYamlInfo value, $Res Function(CodeBaseYamlInfo) then) =
      _$CodeBaseYamlInfoCopyWithImpl<$Res, CodeBaseYamlInfo>;
  @useResult
  $Res call(
      {String projectName,
      String? projectDescription,
      String version,
      ProjectType type});
}

/// @nodoc
class _$CodeBaseYamlInfoCopyWithImpl<$Res, $Val extends CodeBaseYamlInfo>
    implements $CodeBaseYamlInfoCopyWith<$Res> {
  _$CodeBaseYamlInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CodeBaseYamlInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
    Object? projectDescription = freezed,
    Object? version = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      projectDescription: freezed == projectDescription
          ? _value.projectDescription
          : projectDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProjectType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CodeBaseYamlInfoImplCopyWith<$Res>
    implements $CodeBaseYamlInfoCopyWith<$Res> {
  factory _$$CodeBaseYamlInfoImplCopyWith(_$CodeBaseYamlInfoImpl value,
          $Res Function(_$CodeBaseYamlInfoImpl) then) =
      __$$CodeBaseYamlInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String projectName,
      String? projectDescription,
      String version,
      ProjectType type});
}

/// @nodoc
class __$$CodeBaseYamlInfoImplCopyWithImpl<$Res>
    extends _$CodeBaseYamlInfoCopyWithImpl<$Res, _$CodeBaseYamlInfoImpl>
    implements _$$CodeBaseYamlInfoImplCopyWith<$Res> {
  __$$CodeBaseYamlInfoImplCopyWithImpl(_$CodeBaseYamlInfoImpl _value,
      $Res Function(_$CodeBaseYamlInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CodeBaseYamlInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectName = null,
    Object? projectDescription = freezed,
    Object? version = null,
    Object? type = null,
  }) {
    return _then(_$CodeBaseYamlInfoImpl(
      projectName: null == projectName
          ? _value.projectName
          : projectName // ignore: cast_nullable_to_non_nullable
              as String,
      projectDescription: freezed == projectDescription
          ? _value.projectDescription
          : projectDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ProjectType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CodeBaseYamlInfoImpl implements _CodeBaseYamlInfo {
  _$CodeBaseYamlInfoImpl(
      {required this.projectName,
      required this.projectDescription,
      required this.version,
      required this.type});

  factory _$CodeBaseYamlInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CodeBaseYamlInfoImplFromJson(json);

  @override
  final String projectName;
  @override
  final String? projectDescription;
  @override
  final String version;
  @override
  final ProjectType type;

  @override
  String toString() {
    return 'CodeBaseYamlInfo(projectName: $projectName, projectDescription: $projectDescription, version: $version, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CodeBaseYamlInfoImpl &&
            (identical(other.projectName, projectName) ||
                other.projectName == projectName) &&
            (identical(other.projectDescription, projectDescription) ||
                other.projectDescription == projectDescription) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, projectName, projectDescription, version, type);

  /// Create a copy of CodeBaseYamlInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CodeBaseYamlInfoImplCopyWith<_$CodeBaseYamlInfoImpl> get copyWith =>
      __$$CodeBaseYamlInfoImplCopyWithImpl<_$CodeBaseYamlInfoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CodeBaseYamlInfoImplToJson(
      this,
    );
  }
}

abstract class _CodeBaseYamlInfo implements CodeBaseYamlInfo {
  factory _CodeBaseYamlInfo(
      {required final String projectName,
      required final String? projectDescription,
      required final String version,
      required final ProjectType type}) = _$CodeBaseYamlInfoImpl;

  factory _CodeBaseYamlInfo.fromJson(Map<String, dynamic> json) =
      _$CodeBaseYamlInfoImpl.fromJson;

  @override
  String get projectName;
  @override
  String? get projectDescription;
  @override
  String get version;
  @override
  ProjectType get type;

  /// Create a copy of CodeBaseYamlInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CodeBaseYamlInfoImplCopyWith<_$CodeBaseYamlInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
