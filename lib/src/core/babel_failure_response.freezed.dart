// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'babel_failure_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BabelFailureResponse _$BabelFailureResponseFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'onlyBabelException':
      return _BabelFailureResponseOnlyBabelException.fromJson(json);
    case 'withErrorAndStackTrace':
      return _BabelFailureResponseWithErrorAndStackTrace.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json,
          'runtimeType',
          'BabelFailureResponse',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$BabelFailureResponse {
  BabelException get exception => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BabelException exception) onlyBabelException,
    required TResult Function(
            BabelException exception,
            @ErrorObjectConverter() Object error,
            @StackTraceConverter() StackTrace stackTrace)
        withErrorAndStackTrace,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BabelException exception)? onlyBabelException,
    TResult? Function(
            BabelException exception,
            @ErrorObjectConverter() Object error,
            @StackTraceConverter() StackTrace stackTrace)?
        withErrorAndStackTrace,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BabelException exception)? onlyBabelException,
    TResult Function(
            BabelException exception,
            @ErrorObjectConverter() Object error,
            @StackTraceConverter() StackTrace stackTrace)?
        withErrorAndStackTrace,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BabelFailureResponseOnlyBabelException value)
        onlyBabelException,
    required TResult Function(_BabelFailureResponseWithErrorAndStackTrace value)
        withErrorAndStackTrace,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BabelFailureResponseOnlyBabelException value)?
        onlyBabelException,
    TResult? Function(_BabelFailureResponseWithErrorAndStackTrace value)?
        withErrorAndStackTrace,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BabelFailureResponseOnlyBabelException value)?
        onlyBabelException,
    TResult Function(_BabelFailureResponseWithErrorAndStackTrace value)?
        withErrorAndStackTrace,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this BabelFailureResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BabelFailureResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BabelFailureResponseCopyWith<BabelFailureResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BabelFailureResponseCopyWith<$Res> {
  factory $BabelFailureResponseCopyWith(BabelFailureResponse value,
          $Res Function(BabelFailureResponse) then) =
      _$BabelFailureResponseCopyWithImpl<$Res, BabelFailureResponse>;
  @useResult
  $Res call({BabelException exception});
}

/// @nodoc
class _$BabelFailureResponseCopyWithImpl<$Res,
        $Val extends BabelFailureResponse>
    implements $BabelFailureResponseCopyWith<$Res> {
  _$BabelFailureResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BabelFailureResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_value.copyWith(
      exception: null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as BabelException,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BabelFailureResponseOnlyBabelExceptionImplCopyWith<$Res>
    implements $BabelFailureResponseCopyWith<$Res> {
  factory _$$BabelFailureResponseOnlyBabelExceptionImplCopyWith(
          _$BabelFailureResponseOnlyBabelExceptionImpl value,
          $Res Function(_$BabelFailureResponseOnlyBabelExceptionImpl) then) =
      __$$BabelFailureResponseOnlyBabelExceptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({BabelException exception});
}

/// @nodoc
class __$$BabelFailureResponseOnlyBabelExceptionImplCopyWithImpl<$Res>
    extends _$BabelFailureResponseCopyWithImpl<$Res,
        _$BabelFailureResponseOnlyBabelExceptionImpl>
    implements _$$BabelFailureResponseOnlyBabelExceptionImplCopyWith<$Res> {
  __$$BabelFailureResponseOnlyBabelExceptionImplCopyWithImpl(
      _$BabelFailureResponseOnlyBabelExceptionImpl _value,
      $Res Function(_$BabelFailureResponseOnlyBabelExceptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of BabelFailureResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$BabelFailureResponseOnlyBabelExceptionImpl(
      exception: null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as BabelException,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BabelFailureResponseOnlyBabelExceptionImpl
    implements _BabelFailureResponseOnlyBabelException {
  _$BabelFailureResponseOnlyBabelExceptionImpl(
      {required this.exception, final String? $type})
      : $type = $type ?? 'onlyBabelException';

  factory _$BabelFailureResponseOnlyBabelExceptionImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BabelFailureResponseOnlyBabelExceptionImplFromJson(json);

  @override
  final BabelException exception;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'BabelFailureResponse.onlyBabelException(exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BabelFailureResponseOnlyBabelExceptionImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, exception);

  /// Create a copy of BabelFailureResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BabelFailureResponseOnlyBabelExceptionImplCopyWith<
          _$BabelFailureResponseOnlyBabelExceptionImpl>
      get copyWith =>
          __$$BabelFailureResponseOnlyBabelExceptionImplCopyWithImpl<
              _$BabelFailureResponseOnlyBabelExceptionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BabelException exception) onlyBabelException,
    required TResult Function(
            BabelException exception,
            @ErrorObjectConverter() Object error,
            @StackTraceConverter() StackTrace stackTrace)
        withErrorAndStackTrace,
  }) {
    return onlyBabelException(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BabelException exception)? onlyBabelException,
    TResult? Function(
            BabelException exception,
            @ErrorObjectConverter() Object error,
            @StackTraceConverter() StackTrace stackTrace)?
        withErrorAndStackTrace,
  }) {
    return onlyBabelException?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BabelException exception)? onlyBabelException,
    TResult Function(
            BabelException exception,
            @ErrorObjectConverter() Object error,
            @StackTraceConverter() StackTrace stackTrace)?
        withErrorAndStackTrace,
    required TResult orElse(),
  }) {
    if (onlyBabelException != null) {
      return onlyBabelException(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BabelFailureResponseOnlyBabelException value)
        onlyBabelException,
    required TResult Function(_BabelFailureResponseWithErrorAndStackTrace value)
        withErrorAndStackTrace,
  }) {
    return onlyBabelException(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BabelFailureResponseOnlyBabelException value)?
        onlyBabelException,
    TResult? Function(_BabelFailureResponseWithErrorAndStackTrace value)?
        withErrorAndStackTrace,
  }) {
    return onlyBabelException?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BabelFailureResponseOnlyBabelException value)?
        onlyBabelException,
    TResult Function(_BabelFailureResponseWithErrorAndStackTrace value)?
        withErrorAndStackTrace,
    required TResult orElse(),
  }) {
    if (onlyBabelException != null) {
      return onlyBabelException(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BabelFailureResponseOnlyBabelExceptionImplToJson(
      this,
    );
  }
}

abstract class _BabelFailureResponseOnlyBabelException
    implements BabelFailureResponse {
  factory _BabelFailureResponseOnlyBabelException(
          {required final BabelException exception}) =
      _$BabelFailureResponseOnlyBabelExceptionImpl;

  factory _BabelFailureResponseOnlyBabelException.fromJson(
          Map<String, dynamic> json) =
      _$BabelFailureResponseOnlyBabelExceptionImpl.fromJson;

  @override
  BabelException get exception;

  /// Create a copy of BabelFailureResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BabelFailureResponseOnlyBabelExceptionImplCopyWith<
          _$BabelFailureResponseOnlyBabelExceptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BabelFailureResponseWithErrorAndStackTraceImplCopyWith<$Res>
    implements $BabelFailureResponseCopyWith<$Res> {
  factory _$$BabelFailureResponseWithErrorAndStackTraceImplCopyWith(
          _$BabelFailureResponseWithErrorAndStackTraceImpl value,
          $Res Function(_$BabelFailureResponseWithErrorAndStackTraceImpl)
              then) =
      __$$BabelFailureResponseWithErrorAndStackTraceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {BabelException exception,
      @ErrorObjectConverter() Object error,
      @StackTraceConverter() StackTrace stackTrace});
}

/// @nodoc
class __$$BabelFailureResponseWithErrorAndStackTraceImplCopyWithImpl<$Res>
    extends _$BabelFailureResponseCopyWithImpl<$Res,
        _$BabelFailureResponseWithErrorAndStackTraceImpl>
    implements _$$BabelFailureResponseWithErrorAndStackTraceImplCopyWith<$Res> {
  __$$BabelFailureResponseWithErrorAndStackTraceImplCopyWithImpl(
      _$BabelFailureResponseWithErrorAndStackTraceImpl _value,
      $Res Function(_$BabelFailureResponseWithErrorAndStackTraceImpl) _then)
      : super(_value, _then);

  /// Create a copy of BabelFailureResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(_$BabelFailureResponseWithErrorAndStackTraceImpl(
      exception: null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as BabelException,
      error: null == error ? _value.error : error,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BabelFailureResponseWithErrorAndStackTraceImpl
    implements _BabelFailureResponseWithErrorAndStackTrace {
  _$BabelFailureResponseWithErrorAndStackTraceImpl(
      {required this.exception,
      @ErrorObjectConverter() required this.error,
      @StackTraceConverter() required this.stackTrace,
      final String? $type})
      : $type = $type ?? 'withErrorAndStackTrace';

  factory _$BabelFailureResponseWithErrorAndStackTraceImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$BabelFailureResponseWithErrorAndStackTraceImplFromJson(json);

  @override
  final BabelException exception;
  @override
  @ErrorObjectConverter()
  final Object error;
  @override
  @StackTraceConverter()
  final StackTrace stackTrace;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'BabelFailureResponse.withErrorAndStackTrace(exception: $exception, error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BabelFailureResponseWithErrorAndStackTraceImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, exception,
      const DeepCollectionEquality().hash(error), stackTrace);

  /// Create a copy of BabelFailureResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BabelFailureResponseWithErrorAndStackTraceImplCopyWith<
          _$BabelFailureResponseWithErrorAndStackTraceImpl>
      get copyWith =>
          __$$BabelFailureResponseWithErrorAndStackTraceImplCopyWithImpl<
                  _$BabelFailureResponseWithErrorAndStackTraceImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(BabelException exception) onlyBabelException,
    required TResult Function(
            BabelException exception,
            @ErrorObjectConverter() Object error,
            @StackTraceConverter() StackTrace stackTrace)
        withErrorAndStackTrace,
  }) {
    return withErrorAndStackTrace(exception, error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(BabelException exception)? onlyBabelException,
    TResult? Function(
            BabelException exception,
            @ErrorObjectConverter() Object error,
            @StackTraceConverter() StackTrace stackTrace)?
        withErrorAndStackTrace,
  }) {
    return withErrorAndStackTrace?.call(exception, error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(BabelException exception)? onlyBabelException,
    TResult Function(
            BabelException exception,
            @ErrorObjectConverter() Object error,
            @StackTraceConverter() StackTrace stackTrace)?
        withErrorAndStackTrace,
    required TResult orElse(),
  }) {
    if (withErrorAndStackTrace != null) {
      return withErrorAndStackTrace(exception, error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BabelFailureResponseOnlyBabelException value)
        onlyBabelException,
    required TResult Function(_BabelFailureResponseWithErrorAndStackTrace value)
        withErrorAndStackTrace,
  }) {
    return withErrorAndStackTrace(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_BabelFailureResponseOnlyBabelException value)?
        onlyBabelException,
    TResult? Function(_BabelFailureResponseWithErrorAndStackTrace value)?
        withErrorAndStackTrace,
  }) {
    return withErrorAndStackTrace?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BabelFailureResponseOnlyBabelException value)?
        onlyBabelException,
    TResult Function(_BabelFailureResponseWithErrorAndStackTrace value)?
        withErrorAndStackTrace,
    required TResult orElse(),
  }) {
    if (withErrorAndStackTrace != null) {
      return withErrorAndStackTrace(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BabelFailureResponseWithErrorAndStackTraceImplToJson(
      this,
    );
  }
}

abstract class _BabelFailureResponseWithErrorAndStackTrace
    implements BabelFailureResponse {
  factory _BabelFailureResponseWithErrorAndStackTrace(
          {required final BabelException exception,
          @ErrorObjectConverter() required final Object error,
          @StackTraceConverter() required final StackTrace stackTrace}) =
      _$BabelFailureResponseWithErrorAndStackTraceImpl;

  factory _BabelFailureResponseWithErrorAndStackTrace.fromJson(
          Map<String, dynamic> json) =
      _$BabelFailureResponseWithErrorAndStackTraceImpl.fromJson;

  @override
  BabelException get exception;
  @ErrorObjectConverter()
  Object get error;
  @StackTraceConverter()
  StackTrace get stackTrace;

  /// Create a copy of BabelFailureResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BabelFailureResponseWithErrorAndStackTraceImplCopyWith<
          _$BabelFailureResponseWithErrorAndStackTraceImpl>
      get copyWith => throw _privateConstructorUsedError;
}
