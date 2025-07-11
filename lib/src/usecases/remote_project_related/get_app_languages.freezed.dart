// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_app_languages.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GetAppLanguagesResponse {
  int get maxLanguageCount => throw _privateConstructorUsedError;
  Set<BabelSupportedLocales> get languages =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    withDownloadableData,
    required TResult Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
    )
    withoutDownloadableData,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    withDownloadableData,
    TResult? Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
    )?
    withoutDownloadableData,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    withDownloadableData,
    TResult Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
    )?
    withoutDownloadableData,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
      _GetAppLanguagesResponseWithDownloadableData value,
    )
    withDownloadableData,
    required TResult Function(
      _GetAppLanguagesResponseWithoutDownloadableData value,
    )
    withoutDownloadableData,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAppLanguagesResponseWithDownloadableData value)?
    withDownloadableData,
    TResult? Function(_GetAppLanguagesResponseWithoutDownloadableData value)?
    withoutDownloadableData,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAppLanguagesResponseWithDownloadableData value)?
    withDownloadableData,
    TResult Function(_GetAppLanguagesResponseWithoutDownloadableData value)?
    withoutDownloadableData,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of GetAppLanguagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAppLanguagesResponseCopyWith<GetAppLanguagesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAppLanguagesResponseCopyWith<$Res> {
  factory $GetAppLanguagesResponseCopyWith(
    GetAppLanguagesResponse value,
    $Res Function(GetAppLanguagesResponse) then,
  ) = _$GetAppLanguagesResponseCopyWithImpl<$Res, GetAppLanguagesResponse>;
  @useResult
  $Res call({int maxLanguageCount, Set<BabelSupportedLocales> languages});
}

/// @nodoc
class _$GetAppLanguagesResponseCopyWithImpl<
  $Res,
  $Val extends GetAppLanguagesResponse
>
    implements $GetAppLanguagesResponseCopyWith<$Res> {
  _$GetAppLanguagesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetAppLanguagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? maxLanguageCount = null, Object? languages = null}) {
    return _then(
      _value.copyWith(
            maxLanguageCount:
                null == maxLanguageCount
                    ? _value.maxLanguageCount
                    : maxLanguageCount // ignore: cast_nullable_to_non_nullable
                        as int,
            languages:
                null == languages
                    ? _value.languages
                    : languages // ignore: cast_nullable_to_non_nullable
                        as Set<BabelSupportedLocales>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GetAppLanguagesResponseWithDownloadableDataImplCopyWith<$Res>
    implements $GetAppLanguagesResponseCopyWith<$Res> {
  factory _$$GetAppLanguagesResponseWithDownloadableDataImplCopyWith(
    _$GetAppLanguagesResponseWithDownloadableDataImpl value,
    $Res Function(_$GetAppLanguagesResponseWithDownloadableDataImpl) then,
  ) = __$$GetAppLanguagesResponseWithDownloadableDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int maxLanguageCount,
    Set<BabelSupportedLocales> languages,
    String downloadLink,
  });
}

/// @nodoc
class __$$GetAppLanguagesResponseWithDownloadableDataImplCopyWithImpl<$Res>
    extends
        _$GetAppLanguagesResponseCopyWithImpl<
          $Res,
          _$GetAppLanguagesResponseWithDownloadableDataImpl
        >
    implements
        _$$GetAppLanguagesResponseWithDownloadableDataImplCopyWith<$Res> {
  __$$GetAppLanguagesResponseWithDownloadableDataImplCopyWithImpl(
    _$GetAppLanguagesResponseWithDownloadableDataImpl _value,
    $Res Function(_$GetAppLanguagesResponseWithDownloadableDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetAppLanguagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxLanguageCount = null,
    Object? languages = null,
    Object? downloadLink = null,
  }) {
    return _then(
      _$GetAppLanguagesResponseWithDownloadableDataImpl(
        maxLanguageCount:
            null == maxLanguageCount
                ? _value.maxLanguageCount
                : maxLanguageCount // ignore: cast_nullable_to_non_nullable
                    as int,
        languages:
            null == languages
                ? _value._languages
                : languages // ignore: cast_nullable_to_non_nullable
                    as Set<BabelSupportedLocales>,
        downloadLink:
            null == downloadLink
                ? _value.downloadLink
                : downloadLink // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc

class _$GetAppLanguagesResponseWithDownloadableDataImpl
    implements _GetAppLanguagesResponseWithDownloadableData {
  _$GetAppLanguagesResponseWithDownloadableDataImpl({
    required this.maxLanguageCount,
    required final Set<BabelSupportedLocales> languages,
    required this.downloadLink,
  }) : _languages = languages;

  @override
  final int maxLanguageCount;
  final Set<BabelSupportedLocales> _languages;
  @override
  Set<BabelSupportedLocales> get languages {
    if (_languages is EqualUnmodifiableSetView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_languages);
  }

  @override
  final String downloadLink;

  @override
  String toString() {
    return 'GetAppLanguagesResponse.withDownloadableData(maxLanguageCount: $maxLanguageCount, languages: $languages, downloadLink: $downloadLink)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAppLanguagesResponseWithDownloadableDataImpl &&
            (identical(other.maxLanguageCount, maxLanguageCount) ||
                other.maxLanguageCount == maxLanguageCount) &&
            const DeepCollectionEquality().equals(
              other._languages,
              _languages,
            ) &&
            (identical(other.downloadLink, downloadLink) ||
                other.downloadLink == downloadLink));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    maxLanguageCount,
    const DeepCollectionEquality().hash(_languages),
    downloadLink,
  );

  /// Create a copy of GetAppLanguagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAppLanguagesResponseWithDownloadableDataImplCopyWith<
    _$GetAppLanguagesResponseWithDownloadableDataImpl
  >
  get copyWith =>
      __$$GetAppLanguagesResponseWithDownloadableDataImplCopyWithImpl<
        _$GetAppLanguagesResponseWithDownloadableDataImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    withDownloadableData,
    required TResult Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
    )
    withoutDownloadableData,
  }) {
    return withDownloadableData(maxLanguageCount, languages, downloadLink);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    withDownloadableData,
    TResult? Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
    )?
    withoutDownloadableData,
  }) {
    return withDownloadableData?.call(
      maxLanguageCount,
      languages,
      downloadLink,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    withDownloadableData,
    TResult Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
    )?
    withoutDownloadableData,
    required TResult orElse(),
  }) {
    if (withDownloadableData != null) {
      return withDownloadableData(maxLanguageCount, languages, downloadLink);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
      _GetAppLanguagesResponseWithDownloadableData value,
    )
    withDownloadableData,
    required TResult Function(
      _GetAppLanguagesResponseWithoutDownloadableData value,
    )
    withoutDownloadableData,
  }) {
    return withDownloadableData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAppLanguagesResponseWithDownloadableData value)?
    withDownloadableData,
    TResult? Function(_GetAppLanguagesResponseWithoutDownloadableData value)?
    withoutDownloadableData,
  }) {
    return withDownloadableData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAppLanguagesResponseWithDownloadableData value)?
    withDownloadableData,
    TResult Function(_GetAppLanguagesResponseWithoutDownloadableData value)?
    withoutDownloadableData,
    required TResult orElse(),
  }) {
    if (withDownloadableData != null) {
      return withDownloadableData(this);
    }
    return orElse();
  }
}

abstract class _GetAppLanguagesResponseWithDownloadableData
    implements GetAppLanguagesResponse {
  factory _GetAppLanguagesResponseWithDownloadableData({
    required final int maxLanguageCount,
    required final Set<BabelSupportedLocales> languages,
    required final String downloadLink,
  }) = _$GetAppLanguagesResponseWithDownloadableDataImpl;

  @override
  int get maxLanguageCount;
  @override
  Set<BabelSupportedLocales> get languages;
  String get downloadLink;

  /// Create a copy of GetAppLanguagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAppLanguagesResponseWithDownloadableDataImplCopyWith<
    _$GetAppLanguagesResponseWithDownloadableDataImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWith<
  $Res
>
    implements $GetAppLanguagesResponseCopyWith<$Res> {
  factory _$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWith(
    _$GetAppLanguagesResponseWithoutDownloadableDataImpl value,
    $Res Function(_$GetAppLanguagesResponseWithoutDownloadableDataImpl) then,
  ) = __$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int maxLanguageCount, Set<BabelSupportedLocales> languages});
}

/// @nodoc
class __$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWithImpl<$Res>
    extends
        _$GetAppLanguagesResponseCopyWithImpl<
          $Res,
          _$GetAppLanguagesResponseWithoutDownloadableDataImpl
        >
    implements
        _$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWith<$Res> {
  __$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWithImpl(
    _$GetAppLanguagesResponseWithoutDownloadableDataImpl _value,
    $Res Function(_$GetAppLanguagesResponseWithoutDownloadableDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GetAppLanguagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? maxLanguageCount = null, Object? languages = null}) {
    return _then(
      _$GetAppLanguagesResponseWithoutDownloadableDataImpl(
        maxLanguageCount:
            null == maxLanguageCount
                ? _value.maxLanguageCount
                : maxLanguageCount // ignore: cast_nullable_to_non_nullable
                    as int,
        languages:
            null == languages
                ? _value._languages
                : languages // ignore: cast_nullable_to_non_nullable
                    as Set<BabelSupportedLocales>,
      ),
    );
  }
}

/// @nodoc

class _$GetAppLanguagesResponseWithoutDownloadableDataImpl
    implements _GetAppLanguagesResponseWithoutDownloadableData {
  _$GetAppLanguagesResponseWithoutDownloadableDataImpl({
    required this.maxLanguageCount,
    required final Set<BabelSupportedLocales> languages,
  }) : _languages = languages;

  @override
  final int maxLanguageCount;
  final Set<BabelSupportedLocales> _languages;
  @override
  Set<BabelSupportedLocales> get languages {
    if (_languages is EqualUnmodifiableSetView) return _languages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_languages);
  }

  @override
  String toString() {
    return 'GetAppLanguagesResponse.withoutDownloadableData(maxLanguageCount: $maxLanguageCount, languages: $languages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAppLanguagesResponseWithoutDownloadableDataImpl &&
            (identical(other.maxLanguageCount, maxLanguageCount) ||
                other.maxLanguageCount == maxLanguageCount) &&
            const DeepCollectionEquality().equals(
              other._languages,
              _languages,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    maxLanguageCount,
    const DeepCollectionEquality().hash(_languages),
  );

  /// Create a copy of GetAppLanguagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWith<
    _$GetAppLanguagesResponseWithoutDownloadableDataImpl
  >
  get copyWith =>
      __$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWithImpl<
        _$GetAppLanguagesResponseWithoutDownloadableDataImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )
    withDownloadableData,
    required TResult Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
    )
    withoutDownloadableData,
  }) {
    return withoutDownloadableData(maxLanguageCount, languages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    withDownloadableData,
    TResult? Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
    )?
    withoutDownloadableData,
  }) {
    return withoutDownloadableData?.call(maxLanguageCount, languages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
      String downloadLink,
    )?
    withDownloadableData,
    TResult Function(
      int maxLanguageCount,
      Set<BabelSupportedLocales> languages,
    )?
    withoutDownloadableData,
    required TResult orElse(),
  }) {
    if (withoutDownloadableData != null) {
      return withoutDownloadableData(maxLanguageCount, languages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(
      _GetAppLanguagesResponseWithDownloadableData value,
    )
    withDownloadableData,
    required TResult Function(
      _GetAppLanguagesResponseWithoutDownloadableData value,
    )
    withoutDownloadableData,
  }) {
    return withoutDownloadableData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAppLanguagesResponseWithDownloadableData value)?
    withDownloadableData,
    TResult? Function(_GetAppLanguagesResponseWithoutDownloadableData value)?
    withoutDownloadableData,
  }) {
    return withoutDownloadableData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAppLanguagesResponseWithDownloadableData value)?
    withDownloadableData,
    TResult Function(_GetAppLanguagesResponseWithoutDownloadableData value)?
    withoutDownloadableData,
    required TResult orElse(),
  }) {
    if (withoutDownloadableData != null) {
      return withoutDownloadableData(this);
    }
    return orElse();
  }
}

abstract class _GetAppLanguagesResponseWithoutDownloadableData
    implements GetAppLanguagesResponse {
  factory _GetAppLanguagesResponseWithoutDownloadableData({
    required final int maxLanguageCount,
    required final Set<BabelSupportedLocales> languages,
  }) = _$GetAppLanguagesResponseWithoutDownloadableDataImpl;

  @override
  int get maxLanguageCount;
  @override
  Set<BabelSupportedLocales> get languages;

  /// Create a copy of GetAppLanguagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWith<
    _$GetAppLanguagesResponseWithoutDownloadableDataImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
