// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'l10n_project_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

L10nProjectConfig _$L10nProjectConfigFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'withData':
      return L10nProjectConfigWithData.fromJson(json);
    case 'noData':
      return _L10nProjectConfigNoData.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'L10nProjectConfig',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$L10nProjectConfig {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String l10nFileName,
            String templateArbFile,
            String outputClass,
            String outputDir,
            String arbDir,
            bool syntheticPackage)
        withData,
    required TResult Function() noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String l10nFileName,
            String templateArbFile,
            String outputClass,
            String outputDir,
            String arbDir,
            bool syntheticPackage)?
        withData,
    TResult? Function()? noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String l10nFileName,
            String templateArbFile,
            String outputClass,
            String outputDir,
            String arbDir,
            bool syntheticPackage)?
        withData,
    TResult Function()? noData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(L10nProjectConfigWithData value) withData,
    required TResult Function(_L10nProjectConfigNoData value) noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(L10nProjectConfigWithData value)? withData,
    TResult? Function(_L10nProjectConfigNoData value)? noData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(L10nProjectConfigWithData value)? withData,
    TResult Function(_L10nProjectConfigNoData value)? noData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this L10nProjectConfig to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $L10nProjectConfigCopyWith<$Res> {
  factory $L10nProjectConfigCopyWith(
          L10nProjectConfig value, $Res Function(L10nProjectConfig) then) =
      _$L10nProjectConfigCopyWithImpl<$Res, L10nProjectConfig>;
}

/// @nodoc
class _$L10nProjectConfigCopyWithImpl<$Res, $Val extends L10nProjectConfig>
    implements $L10nProjectConfigCopyWith<$Res> {
  _$L10nProjectConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of L10nProjectConfig
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$L10nProjectConfigWithDataImplCopyWith<$Res> {
  factory _$$L10nProjectConfigWithDataImplCopyWith(
          _$L10nProjectConfigWithDataImpl value,
          $Res Function(_$L10nProjectConfigWithDataImpl) then) =
      __$$L10nProjectConfigWithDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String l10nFileName,
      String templateArbFile,
      String outputClass,
      String outputDir,
      String arbDir,
      bool syntheticPackage});
}

/// @nodoc
class __$$L10nProjectConfigWithDataImplCopyWithImpl<$Res>
    extends _$L10nProjectConfigCopyWithImpl<$Res,
        _$L10nProjectConfigWithDataImpl>
    implements _$$L10nProjectConfigWithDataImplCopyWith<$Res> {
  __$$L10nProjectConfigWithDataImplCopyWithImpl(
      _$L10nProjectConfigWithDataImpl _value,
      $Res Function(_$L10nProjectConfigWithDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of L10nProjectConfig
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? l10nFileName = null,
    Object? templateArbFile = null,
    Object? outputClass = null,
    Object? outputDir = null,
    Object? arbDir = null,
    Object? syntheticPackage = null,
  }) {
    return _then(_$L10nProjectConfigWithDataImpl(
      l10nFileName: null == l10nFileName
          ? _value.l10nFileName
          : l10nFileName // ignore: cast_nullable_to_non_nullable
              as String,
      templateArbFile: null == templateArbFile
          ? _value.templateArbFile
          : templateArbFile // ignore: cast_nullable_to_non_nullable
              as String,
      outputClass: null == outputClass
          ? _value.outputClass
          : outputClass // ignore: cast_nullable_to_non_nullable
              as String,
      outputDir: null == outputDir
          ? _value.outputDir
          : outputDir // ignore: cast_nullable_to_non_nullable
              as String,
      arbDir: null == arbDir
          ? _value.arbDir
          : arbDir // ignore: cast_nullable_to_non_nullable
              as String,
      syntheticPackage: null == syntheticPackage
          ? _value.syntheticPackage
          : syntheticPackage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$L10nProjectConfigWithDataImpl implements L10nProjectConfigWithData {
  _$L10nProjectConfigWithDataImpl(
      {required this.l10nFileName,
      required this.templateArbFile,
      required this.outputClass,
      required this.outputDir,
      required this.arbDir,
      required this.syntheticPackage,
      final String? $type})
      : $type = $type ?? 'withData';

  factory _$L10nProjectConfigWithDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$L10nProjectConfigWithDataImplFromJson(json);

  @override
  final String l10nFileName;
  @override
  final String templateArbFile;
  @override
  final String outputClass;
  @override
  final String outputDir;
  @override
  final String arbDir;
  @override
  final bool syntheticPackage;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'L10nProjectConfig.withData(l10nFileName: $l10nFileName, templateArbFile: $templateArbFile, outputClass: $outputClass, outputDir: $outputDir, arbDir: $arbDir, syntheticPackage: $syntheticPackage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$L10nProjectConfigWithDataImpl &&
            (identical(other.l10nFileName, l10nFileName) ||
                other.l10nFileName == l10nFileName) &&
            (identical(other.templateArbFile, templateArbFile) ||
                other.templateArbFile == templateArbFile) &&
            (identical(other.outputClass, outputClass) ||
                other.outputClass == outputClass) &&
            (identical(other.outputDir, outputDir) ||
                other.outputDir == outputDir) &&
            (identical(other.arbDir, arbDir) || other.arbDir == arbDir) &&
            (identical(other.syntheticPackage, syntheticPackage) ||
                other.syntheticPackage == syntheticPackage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, l10nFileName, templateArbFile,
      outputClass, outputDir, arbDir, syntheticPackage);

  /// Create a copy of L10nProjectConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$L10nProjectConfigWithDataImplCopyWith<_$L10nProjectConfigWithDataImpl>
      get copyWith => __$$L10nProjectConfigWithDataImplCopyWithImpl<
          _$L10nProjectConfigWithDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String l10nFileName,
            String templateArbFile,
            String outputClass,
            String outputDir,
            String arbDir,
            bool syntheticPackage)
        withData,
    required TResult Function() noData,
  }) {
    return withData(l10nFileName, templateArbFile, outputClass, outputDir,
        arbDir, syntheticPackage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String l10nFileName,
            String templateArbFile,
            String outputClass,
            String outputDir,
            String arbDir,
            bool syntheticPackage)?
        withData,
    TResult? Function()? noData,
  }) {
    return withData?.call(l10nFileName, templateArbFile, outputClass, outputDir,
        arbDir, syntheticPackage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String l10nFileName,
            String templateArbFile,
            String outputClass,
            String outputDir,
            String arbDir,
            bool syntheticPackage)?
        withData,
    TResult Function()? noData,
    required TResult orElse(),
  }) {
    if (withData != null) {
      return withData(l10nFileName, templateArbFile, outputClass, outputDir,
          arbDir, syntheticPackage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(L10nProjectConfigWithData value) withData,
    required TResult Function(_L10nProjectConfigNoData value) noData,
  }) {
    return withData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(L10nProjectConfigWithData value)? withData,
    TResult? Function(_L10nProjectConfigNoData value)? noData,
  }) {
    return withData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(L10nProjectConfigWithData value)? withData,
    TResult Function(_L10nProjectConfigNoData value)? noData,
    required TResult orElse(),
  }) {
    if (withData != null) {
      return withData(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$L10nProjectConfigWithDataImplToJson(
      this,
    );
  }
}

abstract class L10nProjectConfigWithData implements L10nProjectConfig {
  factory L10nProjectConfigWithData(
      {required final String l10nFileName,
      required final String templateArbFile,
      required final String outputClass,
      required final String outputDir,
      required final String arbDir,
      required final bool syntheticPackage}) = _$L10nProjectConfigWithDataImpl;

  factory L10nProjectConfigWithData.fromJson(Map<String, dynamic> json) =
      _$L10nProjectConfigWithDataImpl.fromJson;

  String get l10nFileName;
  String get templateArbFile;
  String get outputClass;
  String get outputDir;
  String get arbDir;
  bool get syntheticPackage;

  /// Create a copy of L10nProjectConfig
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$L10nProjectConfigWithDataImplCopyWith<_$L10nProjectConfigWithDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$L10nProjectConfigNoDataImplCopyWith<$Res> {
  factory _$$L10nProjectConfigNoDataImplCopyWith(
          _$L10nProjectConfigNoDataImpl value,
          $Res Function(_$L10nProjectConfigNoDataImpl) then) =
      __$$L10nProjectConfigNoDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$L10nProjectConfigNoDataImplCopyWithImpl<$Res>
    extends _$L10nProjectConfigCopyWithImpl<$Res, _$L10nProjectConfigNoDataImpl>
    implements _$$L10nProjectConfigNoDataImplCopyWith<$Res> {
  __$$L10nProjectConfigNoDataImplCopyWithImpl(
      _$L10nProjectConfigNoDataImpl _value,
      $Res Function(_$L10nProjectConfigNoDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of L10nProjectConfig
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$L10nProjectConfigNoDataImpl implements _L10nProjectConfigNoData {
  _$L10nProjectConfigNoDataImpl({final String? $type})
      : $type = $type ?? 'noData';

  factory _$L10nProjectConfigNoDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$L10nProjectConfigNoDataImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'L10nProjectConfig.noData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$L10nProjectConfigNoDataImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String l10nFileName,
            String templateArbFile,
            String outputClass,
            String outputDir,
            String arbDir,
            bool syntheticPackage)
        withData,
    required TResult Function() noData,
  }) {
    return noData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String l10nFileName,
            String templateArbFile,
            String outputClass,
            String outputDir,
            String arbDir,
            bool syntheticPackage)?
        withData,
    TResult? Function()? noData,
  }) {
    return noData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String l10nFileName,
            String templateArbFile,
            String outputClass,
            String outputDir,
            String arbDir,
            bool syntheticPackage)?
        withData,
    TResult Function()? noData,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(L10nProjectConfigWithData value) withData,
    required TResult Function(_L10nProjectConfigNoData value) noData,
  }) {
    return noData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(L10nProjectConfigWithData value)? withData,
    TResult? Function(_L10nProjectConfigNoData value)? noData,
  }) {
    return noData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(L10nProjectConfigWithData value)? withData,
    TResult Function(_L10nProjectConfigNoData value)? noData,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$L10nProjectConfigNoDataImplToJson(
      this,
    );
  }
}

abstract class _L10nProjectConfigNoData implements L10nProjectConfig {
  factory _L10nProjectConfigNoData() = _$L10nProjectConfigNoDataImpl;

  factory _L10nProjectConfigNoData.fromJson(Map<String, dynamic> json) =
      _$L10nProjectConfigNoDataImpl.fromJson;
}
