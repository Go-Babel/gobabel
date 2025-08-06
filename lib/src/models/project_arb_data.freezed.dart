// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_arb_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArbDataState _$ArbDataStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'withData':
      return ArbDataStateWithData.fromJson(json);
    case 'noneData':
      return _ArbDataStateNoneData.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ArbDataState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ArbDataState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            L10nProjectConfig config,
            Map<String, Set<String>> variablesPlaceholdersPerKey,
            @BabelSupportedLocalesJsonConverter()
            BabelSupportedLocales mainLocale,
            List<ArbFileData> preMadeTranslationArb)
        withData,
    required TResult Function() noneData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            L10nProjectConfig config,
            Map<String, Set<String>> variablesPlaceholdersPerKey,
            @BabelSupportedLocalesJsonConverter()
            BabelSupportedLocales mainLocale,
            List<ArbFileData> preMadeTranslationArb)?
        withData,
    TResult? Function()? noneData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            L10nProjectConfig config,
            Map<String, Set<String>> variablesPlaceholdersPerKey,
            @BabelSupportedLocalesJsonConverter()
            BabelSupportedLocales mainLocale,
            List<ArbFileData> preMadeTranslationArb)?
        withData,
    TResult Function()? noneData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArbDataStateWithData value) withData,
    required TResult Function(_ArbDataStateNoneData value) noneData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArbDataStateWithData value)? withData,
    TResult? Function(_ArbDataStateNoneData value)? noneData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArbDataStateWithData value)? withData,
    TResult Function(_ArbDataStateNoneData value)? noneData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this ArbDataState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArbDataStateCopyWith<$Res> {
  factory $ArbDataStateCopyWith(
          ArbDataState value, $Res Function(ArbDataState) then) =
      _$ArbDataStateCopyWithImpl<$Res, ArbDataState>;
}

/// @nodoc
class _$ArbDataStateCopyWithImpl<$Res, $Val extends ArbDataState>
    implements $ArbDataStateCopyWith<$Res> {
  _$ArbDataStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArbDataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ArbDataStateWithDataImplCopyWith<$Res> {
  factory _$$ArbDataStateWithDataImplCopyWith(_$ArbDataStateWithDataImpl value,
          $Res Function(_$ArbDataStateWithDataImpl) then) =
      __$$ArbDataStateWithDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {L10nProjectConfig config,
      Map<String, Set<String>> variablesPlaceholdersPerKey,
      @BabelSupportedLocalesJsonConverter() BabelSupportedLocales mainLocale,
      List<ArbFileData> preMadeTranslationArb});

  $L10nProjectConfigCopyWith<$Res> get config;
}

/// @nodoc
class __$$ArbDataStateWithDataImplCopyWithImpl<$Res>
    extends _$ArbDataStateCopyWithImpl<$Res, _$ArbDataStateWithDataImpl>
    implements _$$ArbDataStateWithDataImplCopyWith<$Res> {
  __$$ArbDataStateWithDataImplCopyWithImpl(_$ArbDataStateWithDataImpl _value,
      $Res Function(_$ArbDataStateWithDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArbDataState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? config = null,
    Object? variablesPlaceholdersPerKey = null,
    Object? mainLocale = null,
    Object? preMadeTranslationArb = null,
  }) {
    return _then(_$ArbDataStateWithDataImpl(
      config: null == config
          ? _value.config
          : config // ignore: cast_nullable_to_non_nullable
              as L10nProjectConfig,
      variablesPlaceholdersPerKey: null == variablesPlaceholdersPerKey
          ? _value._variablesPlaceholdersPerKey
          : variablesPlaceholdersPerKey // ignore: cast_nullable_to_non_nullable
              as Map<String, Set<String>>,
      mainLocale: null == mainLocale
          ? _value.mainLocale
          : mainLocale // ignore: cast_nullable_to_non_nullable
              as BabelSupportedLocales,
      preMadeTranslationArb: null == preMadeTranslationArb
          ? _value._preMadeTranslationArb
          : preMadeTranslationArb // ignore: cast_nullable_to_non_nullable
              as List<ArbFileData>,
    ));
  }

  /// Create a copy of ArbDataState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $L10nProjectConfigCopyWith<$Res> get config {
    return $L10nProjectConfigCopyWith<$Res>(_value.config, (value) {
      return _then(_value.copyWith(config: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$ArbDataStateWithDataImpl extends ArbDataStateWithData {
  _$ArbDataStateWithDataImpl(
      {required this.config,
      required final Map<String, Set<String>> variablesPlaceholdersPerKey,
      @BabelSupportedLocalesJsonConverter() required this.mainLocale,
      required final List<ArbFileData> preMadeTranslationArb,
      final String? $type})
      : _variablesPlaceholdersPerKey = variablesPlaceholdersPerKey,
        _preMadeTranslationArb = preMadeTranslationArb,
        $type = $type ?? 'withData',
        super._();

  factory _$ArbDataStateWithDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArbDataStateWithDataImplFromJson(json);

  @override
  final L10nProjectConfig config;
  final Map<String, Set<String>> _variablesPlaceholdersPerKey;
  @override
  Map<String, Set<String>> get variablesPlaceholdersPerKey {
    if (_variablesPlaceholdersPerKey is EqualUnmodifiableMapView)
      return _variablesPlaceholdersPerKey;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_variablesPlaceholdersPerKey);
  }

  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales mainLocale;
  final List<ArbFileData> _preMadeTranslationArb;
  @override
  List<ArbFileData> get preMadeTranslationArb {
    if (_preMadeTranslationArb is EqualUnmodifiableListView)
      return _preMadeTranslationArb;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_preMadeTranslationArb);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ArbDataState.withData(config: $config, variablesPlaceholdersPerKey: $variablesPlaceholdersPerKey, mainLocale: $mainLocale, preMadeTranslationArb: $preMadeTranslationArb)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArbDataStateWithDataImpl &&
            (identical(other.config, config) || other.config == config) &&
            const DeepCollectionEquality().equals(
                other._variablesPlaceholdersPerKey,
                _variablesPlaceholdersPerKey) &&
            (identical(other.mainLocale, mainLocale) ||
                other.mainLocale == mainLocale) &&
            const DeepCollectionEquality()
                .equals(other._preMadeTranslationArb, _preMadeTranslationArb));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      config,
      const DeepCollectionEquality().hash(_variablesPlaceholdersPerKey),
      mainLocale,
      const DeepCollectionEquality().hash(_preMadeTranslationArb));

  /// Create a copy of ArbDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArbDataStateWithDataImplCopyWith<_$ArbDataStateWithDataImpl>
      get copyWith =>
          __$$ArbDataStateWithDataImplCopyWithImpl<_$ArbDataStateWithDataImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            L10nProjectConfig config,
            Map<String, Set<String>> variablesPlaceholdersPerKey,
            @BabelSupportedLocalesJsonConverter()
            BabelSupportedLocales mainLocale,
            List<ArbFileData> preMadeTranslationArb)
        withData,
    required TResult Function() noneData,
  }) {
    return withData(
        config, variablesPlaceholdersPerKey, mainLocale, preMadeTranslationArb);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            L10nProjectConfig config,
            Map<String, Set<String>> variablesPlaceholdersPerKey,
            @BabelSupportedLocalesJsonConverter()
            BabelSupportedLocales mainLocale,
            List<ArbFileData> preMadeTranslationArb)?
        withData,
    TResult? Function()? noneData,
  }) {
    return withData?.call(
        config, variablesPlaceholdersPerKey, mainLocale, preMadeTranslationArb);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            L10nProjectConfig config,
            Map<String, Set<String>> variablesPlaceholdersPerKey,
            @BabelSupportedLocalesJsonConverter()
            BabelSupportedLocales mainLocale,
            List<ArbFileData> preMadeTranslationArb)?
        withData,
    TResult Function()? noneData,
    required TResult orElse(),
  }) {
    if (withData != null) {
      return withData(config, variablesPlaceholdersPerKey, mainLocale,
          preMadeTranslationArb);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArbDataStateWithData value) withData,
    required TResult Function(_ArbDataStateNoneData value) noneData,
  }) {
    return withData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArbDataStateWithData value)? withData,
    TResult? Function(_ArbDataStateNoneData value)? noneData,
  }) {
    return withData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArbDataStateWithData value)? withData,
    TResult Function(_ArbDataStateNoneData value)? noneData,
    required TResult orElse(),
  }) {
    if (withData != null) {
      return withData(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ArbDataStateWithDataImplToJson(
      this,
    );
  }
}

abstract class ArbDataStateWithData extends ArbDataState {
  factory ArbDataStateWithData(
          {required final L10nProjectConfig config,
          required final Map<String, Set<String>> variablesPlaceholdersPerKey,
          @BabelSupportedLocalesJsonConverter()
          required final BabelSupportedLocales mainLocale,
          required final List<ArbFileData> preMadeTranslationArb}) =
      _$ArbDataStateWithDataImpl;
  ArbDataStateWithData._() : super._();

  factory ArbDataStateWithData.fromJson(Map<String, dynamic> json) =
      _$ArbDataStateWithDataImpl.fromJson;

  L10nProjectConfig get config;
  Map<String, Set<String>> get variablesPlaceholdersPerKey;
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get mainLocale;
  List<ArbFileData> get preMadeTranslationArb;

  /// Create a copy of ArbDataState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArbDataStateWithDataImplCopyWith<_$ArbDataStateWithDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ArbDataStateNoneDataImplCopyWith<$Res> {
  factory _$$ArbDataStateNoneDataImplCopyWith(_$ArbDataStateNoneDataImpl value,
          $Res Function(_$ArbDataStateNoneDataImpl) then) =
      __$$ArbDataStateNoneDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ArbDataStateNoneDataImplCopyWithImpl<$Res>
    extends _$ArbDataStateCopyWithImpl<$Res, _$ArbDataStateNoneDataImpl>
    implements _$$ArbDataStateNoneDataImplCopyWith<$Res> {
  __$$ArbDataStateNoneDataImplCopyWithImpl(_$ArbDataStateNoneDataImpl _value,
      $Res Function(_$ArbDataStateNoneDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArbDataState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$ArbDataStateNoneDataImpl extends _ArbDataStateNoneData {
  _$ArbDataStateNoneDataImpl({final String? $type})
      : $type = $type ?? 'noneData',
        super._();

  factory _$ArbDataStateNoneDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArbDataStateNoneDataImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ArbDataState.noneData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArbDataStateNoneDataImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            L10nProjectConfig config,
            Map<String, Set<String>> variablesPlaceholdersPerKey,
            @BabelSupportedLocalesJsonConverter()
            BabelSupportedLocales mainLocale,
            List<ArbFileData> preMadeTranslationArb)
        withData,
    required TResult Function() noneData,
  }) {
    return noneData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            L10nProjectConfig config,
            Map<String, Set<String>> variablesPlaceholdersPerKey,
            @BabelSupportedLocalesJsonConverter()
            BabelSupportedLocales mainLocale,
            List<ArbFileData> preMadeTranslationArb)?
        withData,
    TResult? Function()? noneData,
  }) {
    return noneData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            L10nProjectConfig config,
            Map<String, Set<String>> variablesPlaceholdersPerKey,
            @BabelSupportedLocalesJsonConverter()
            BabelSupportedLocales mainLocale,
            List<ArbFileData> preMadeTranslationArb)?
        withData,
    TResult Function()? noneData,
    required TResult orElse(),
  }) {
    if (noneData != null) {
      return noneData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArbDataStateWithData value) withData,
    required TResult Function(_ArbDataStateNoneData value) noneData,
  }) {
    return noneData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArbDataStateWithData value)? withData,
    TResult? Function(_ArbDataStateNoneData value)? noneData,
  }) {
    return noneData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArbDataStateWithData value)? withData,
    TResult Function(_ArbDataStateNoneData value)? noneData,
    required TResult orElse(),
  }) {
    if (noneData != null) {
      return noneData(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ArbDataStateNoneDataImplToJson(
      this,
    );
  }
}

abstract class _ArbDataStateNoneData extends ArbDataState {
  factory _ArbDataStateNoneData() = _$ArbDataStateNoneDataImpl;
  _ArbDataStateNoneData._() : super._();

  factory _ArbDataStateNoneData.fromJson(Map<String, dynamic> json) =
      _$ArbDataStateNoneDataImpl.fromJson;
}

ArbFileData _$ArbFileDataFromJson(Map<String, dynamic> json) {
  return _ArbFileData.fromJson(json);
}

/// @nodoc
mixin _$ArbFileData {
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get locale => throw _privateConstructorUsedError;
  Map<String, String> get allKeyValues => throw _privateConstructorUsedError;

  /// Serializes this ArbFileData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArbFileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArbFileDataCopyWith<ArbFileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArbFileDataCopyWith<$Res> {
  factory $ArbFileDataCopyWith(
          ArbFileData value, $Res Function(ArbFileData) then) =
      _$ArbFileDataCopyWithImpl<$Res, ArbFileData>;
  @useResult
  $Res call(
      {@BabelSupportedLocalesJsonConverter() BabelSupportedLocales locale,
      Map<String, String> allKeyValues});
}

/// @nodoc
class _$ArbFileDataCopyWithImpl<$Res, $Val extends ArbFileData>
    implements $ArbFileDataCopyWith<$Res> {
  _$ArbFileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArbFileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? allKeyValues = null,
  }) {
    return _then(_value.copyWith(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as BabelSupportedLocales,
      allKeyValues: null == allKeyValues
          ? _value.allKeyValues
          : allKeyValues // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArbFileDataImplCopyWith<$Res>
    implements $ArbFileDataCopyWith<$Res> {
  factory _$$ArbFileDataImplCopyWith(
          _$ArbFileDataImpl value, $Res Function(_$ArbFileDataImpl) then) =
      __$$ArbFileDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@BabelSupportedLocalesJsonConverter() BabelSupportedLocales locale,
      Map<String, String> allKeyValues});
}

/// @nodoc
class __$$ArbFileDataImplCopyWithImpl<$Res>
    extends _$ArbFileDataCopyWithImpl<$Res, _$ArbFileDataImpl>
    implements _$$ArbFileDataImplCopyWith<$Res> {
  __$$ArbFileDataImplCopyWithImpl(
      _$ArbFileDataImpl _value, $Res Function(_$ArbFileDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArbFileData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
    Object? allKeyValues = null,
  }) {
    return _then(_$ArbFileDataImpl(
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as BabelSupportedLocales,
      allKeyValues: null == allKeyValues
          ? _value._allKeyValues
          : allKeyValues // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArbFileDataImpl implements _ArbFileData {
  _$ArbFileDataImpl(
      {@BabelSupportedLocalesJsonConverter() required this.locale,
      required final Map<String, String> allKeyValues})
      : _allKeyValues = allKeyValues;

  factory _$ArbFileDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArbFileDataImplFromJson(json);

  @override
  @BabelSupportedLocalesJsonConverter()
  final BabelSupportedLocales locale;
  final Map<String, String> _allKeyValues;
  @override
  Map<String, String> get allKeyValues {
    if (_allKeyValues is EqualUnmodifiableMapView) return _allKeyValues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_allKeyValues);
  }

  @override
  String toString() {
    return 'ArbFileData(locale: $locale, allKeyValues: $allKeyValues)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArbFileDataImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            const DeepCollectionEquality()
                .equals(other._allKeyValues, _allKeyValues));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, locale, const DeepCollectionEquality().hash(_allKeyValues));

  /// Create a copy of ArbFileData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArbFileDataImplCopyWith<_$ArbFileDataImpl> get copyWith =>
      __$$ArbFileDataImplCopyWithImpl<_$ArbFileDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArbFileDataImplToJson(
      this,
    );
  }
}

abstract class _ArbFileData implements ArbFileData {
  factory _ArbFileData(
      {@BabelSupportedLocalesJsonConverter()
      required final BabelSupportedLocales locale,
      required final Map<String, String> allKeyValues}) = _$ArbFileDataImpl;

  factory _ArbFileData.fromJson(Map<String, dynamic> json) =
      _$ArbFileDataImpl.fromJson;

  @override
  @BabelSupportedLocalesJsonConverter()
  BabelSupportedLocales get locale;
  @override
  Map<String, String> get allKeyValues;

  /// Create a copy of ArbFileData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArbFileDataImplCopyWith<_$ArbFileDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
