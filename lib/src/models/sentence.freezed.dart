// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sentence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Sentence {
  String get text => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) regularLabel,
    required TResult Function(String text) string,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? regularLabel,
    TResult? Function(String text)? string,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? regularLabel,
    TResult Function(String text)? string,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SentenceLabel value) regularLabel,
    required TResult Function(_SentenceString value) string,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SentenceLabel value)? regularLabel,
    TResult? Function(_SentenceString value)? string,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SentenceLabel value)? regularLabel,
    TResult Function(_SentenceString value)? string,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SentenceCopyWith<Sentence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SentenceCopyWith<$Res> {
  factory $SentenceCopyWith(Sentence value, $Res Function(Sentence) then) =
      _$SentenceCopyWithImpl<$Res, Sentence>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class _$SentenceCopyWithImpl<$Res, $Val extends Sentence>
    implements $SentenceCopyWith<$Res> {
  _$SentenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SentenceLabelImplCopyWith<$Res>
    implements $SentenceCopyWith<$Res> {
  factory _$$SentenceLabelImplCopyWith(
          _$SentenceLabelImpl value, $Res Function(_$SentenceLabelImpl) then) =
      __$$SentenceLabelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$SentenceLabelImplCopyWithImpl<$Res>
    extends _$SentenceCopyWithImpl<$Res, _$SentenceLabelImpl>
    implements _$$SentenceLabelImplCopyWith<$Res> {
  __$$SentenceLabelImplCopyWithImpl(
      _$SentenceLabelImpl _value, $Res Function(_$SentenceLabelImpl) _then)
      : super(_value, _then);

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$SentenceLabelImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SentenceLabelImpl implements _SentenceLabel {
  _$SentenceLabelImpl({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'Sentence.regularLabel(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SentenceLabelImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SentenceLabelImplCopyWith<_$SentenceLabelImpl> get copyWith =>
      __$$SentenceLabelImplCopyWithImpl<_$SentenceLabelImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) regularLabel,
    required TResult Function(String text) string,
  }) {
    return regularLabel(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? regularLabel,
    TResult? Function(String text)? string,
  }) {
    return regularLabel?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? regularLabel,
    TResult Function(String text)? string,
    required TResult orElse(),
  }) {
    if (regularLabel != null) {
      return regularLabel(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SentenceLabel value) regularLabel,
    required TResult Function(_SentenceString value) string,
  }) {
    return regularLabel(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SentenceLabel value)? regularLabel,
    TResult? Function(_SentenceString value)? string,
  }) {
    return regularLabel?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SentenceLabel value)? regularLabel,
    TResult Function(_SentenceString value)? string,
    required TResult orElse(),
  }) {
    if (regularLabel != null) {
      return regularLabel(this);
    }
    return orElse();
  }
}

abstract class _SentenceLabel implements Sentence {
  factory _SentenceLabel({required final String text}) = _$SentenceLabelImpl;

  @override
  String get text;

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SentenceLabelImplCopyWith<_$SentenceLabelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SentenceStringImplCopyWith<$Res>
    implements $SentenceCopyWith<$Res> {
  factory _$$SentenceStringImplCopyWith(_$SentenceStringImpl value,
          $Res Function(_$SentenceStringImpl) then) =
      __$$SentenceStringImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$SentenceStringImplCopyWithImpl<$Res>
    extends _$SentenceCopyWithImpl<$Res, _$SentenceStringImpl>
    implements _$$SentenceStringImplCopyWith<$Res> {
  __$$SentenceStringImplCopyWithImpl(
      _$SentenceStringImpl _value, $Res Function(_$SentenceStringImpl) _then)
      : super(_value, _then);

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = null,
  }) {
    return _then(_$SentenceStringImpl(
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SentenceStringImpl implements _SentenceString {
  _$SentenceStringImpl({required this.text});

  @override
  final String text;

  @override
  String toString() {
    return 'Sentence.string(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SentenceStringImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SentenceStringImplCopyWith<_$SentenceStringImpl> get copyWith =>
      __$$SentenceStringImplCopyWithImpl<_$SentenceStringImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String text) regularLabel,
    required TResult Function(String text) string,
  }) {
    return string(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String text)? regularLabel,
    TResult? Function(String text)? string,
  }) {
    return string?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String text)? regularLabel,
    TResult Function(String text)? string,
    required TResult orElse(),
  }) {
    if (string != null) {
      return string(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SentenceLabel value) regularLabel,
    required TResult Function(_SentenceString value) string,
  }) {
    return string(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SentenceLabel value)? regularLabel,
    TResult? Function(_SentenceString value)? string,
  }) {
    return string?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SentenceLabel value)? regularLabel,
    TResult Function(_SentenceString value)? string,
    required TResult orElse(),
  }) {
    if (string != null) {
      return string(this);
    }
    return orElse();
  }
}

abstract class _SentenceString implements Sentence {
  factory _SentenceString({required final String text}) = _$SentenceStringImpl;

  @override
  String get text;

  /// Create a copy of Sentence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SentenceStringImplCopyWith<_$SentenceStringImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
