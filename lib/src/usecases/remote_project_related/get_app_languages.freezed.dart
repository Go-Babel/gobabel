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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAppLanguagesResponse {
  int get maxLanguageCount => throw _privateConstructorUsedError;
  Set<BabelSupportedLocales> get languages =>
      throw _privateConstructorUsedError;

  /// Create a copy of GetAppLanguagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetAppLanguagesResponseCopyWith<GetAppLanguagesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAppLanguagesResponseCopyWith<$Res> {
  factory $GetAppLanguagesResponseCopyWith(GetAppLanguagesResponse value,
          $Res Function(GetAppLanguagesResponse) then) =
      _$GetAppLanguagesResponseCopyWithImpl<$Res, GetAppLanguagesResponse>;
  @useResult
  $Res call({int maxLanguageCount, Set<BabelSupportedLocales> languages});
}

/// @nodoc
class _$GetAppLanguagesResponseCopyWithImpl<$Res,
        $Val extends GetAppLanguagesResponse>
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
  $Res call({
    Object? maxLanguageCount = null,
    Object? languages = null,
  }) {
    return _then(_value.copyWith(
      maxLanguageCount: null == maxLanguageCount
          ? _value.maxLanguageCount
          : maxLanguageCount // ignore: cast_nullable_to_non_nullable
              as int,
      languages: null == languages
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as Set<BabelSupportedLocales>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWith<
    $Res> implements $GetAppLanguagesResponseCopyWith<$Res> {
  factory _$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWith(
          _$GetAppLanguagesResponseWithoutDownloadableDataImpl value,
          $Res Function(_$GetAppLanguagesResponseWithoutDownloadableDataImpl)
              then) =
      __$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int maxLanguageCount, Set<BabelSupportedLocales> languages});
}

/// @nodoc
class __$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWithImpl<$Res>
    extends _$GetAppLanguagesResponseCopyWithImpl<$Res,
        _$GetAppLanguagesResponseWithoutDownloadableDataImpl>
    implements
        _$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWith<$Res> {
  __$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWithImpl(
      _$GetAppLanguagesResponseWithoutDownloadableDataImpl _value,
      $Res Function(_$GetAppLanguagesResponseWithoutDownloadableDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetAppLanguagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? maxLanguageCount = null,
    Object? languages = null,
  }) {
    return _then(_$GetAppLanguagesResponseWithoutDownloadableDataImpl(
      maxLanguageCount: null == maxLanguageCount
          ? _value.maxLanguageCount
          : maxLanguageCount // ignore: cast_nullable_to_non_nullable
              as int,
      languages: null == languages
          ? _value._languages
          : languages // ignore: cast_nullable_to_non_nullable
              as Set<BabelSupportedLocales>,
    ));
  }
}

/// @nodoc

class _$GetAppLanguagesResponseWithoutDownloadableDataImpl
    implements _GetAppLanguagesResponseWithoutDownloadableData {
  _$GetAppLanguagesResponseWithoutDownloadableDataImpl(
      {required this.maxLanguageCount,
      required final Set<BabelSupportedLocales> languages})
      : _languages = languages;

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
    return 'GetAppLanguagesResponse(maxLanguageCount: $maxLanguageCount, languages: $languages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAppLanguagesResponseWithoutDownloadableDataImpl &&
            (identical(other.maxLanguageCount, maxLanguageCount) ||
                other.maxLanguageCount == maxLanguageCount) &&
            const DeepCollectionEquality()
                .equals(other._languages, _languages));
  }

  @override
  int get hashCode => Object.hash(runtimeType, maxLanguageCount,
      const DeepCollectionEquality().hash(_languages));

  /// Create a copy of GetAppLanguagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWith<
          _$GetAppLanguagesResponseWithoutDownloadableDataImpl>
      get copyWith =>
          __$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWithImpl<
                  _$GetAppLanguagesResponseWithoutDownloadableDataImpl>(
              this, _$identity);
}

abstract class _GetAppLanguagesResponseWithoutDownloadableData
    implements GetAppLanguagesResponse {
  factory _GetAppLanguagesResponseWithoutDownloadableData(
          {required final int maxLanguageCount,
          required final Set<BabelSupportedLocales> languages}) =
      _$GetAppLanguagesResponseWithoutDownloadableDataImpl;

  @override
  int get maxLanguageCount;
  @override
  Set<BabelSupportedLocales> get languages;

  /// Create a copy of GetAppLanguagesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetAppLanguagesResponseWithoutDownloadableDataImplCopyWith<
          _$GetAppLanguagesResponseWithoutDownloadableDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
