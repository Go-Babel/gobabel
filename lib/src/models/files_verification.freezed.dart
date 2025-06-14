// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'files_verification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FilesVerification _$FilesVerificationFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'fromZero':
      return _FilesVerificationFromZero.fromJson(json);
    case 'fromLastCommit':
      return _FilesVerificationFromLastCommit.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'FilesVerification',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$FilesVerification {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fromZero,
    required TResult Function(List<String> changedFilesPath) fromLastCommit,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fromZero,
    TResult? Function(List<String> changedFilesPath)? fromLastCommit,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fromZero,
    TResult Function(List<String> changedFilesPath)? fromLastCommit,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilesVerificationFromZero value) fromZero,
    required TResult Function(_FilesVerificationFromLastCommit value)
    fromLastCommit,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilesVerificationFromZero value)? fromZero,
    TResult? Function(_FilesVerificationFromLastCommit value)? fromLastCommit,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilesVerificationFromZero value)? fromZero,
    TResult Function(_FilesVerificationFromLastCommit value)? fromLastCommit,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this FilesVerification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilesVerificationCopyWith<$Res> {
  factory $FilesVerificationCopyWith(
    FilesVerification value,
    $Res Function(FilesVerification) then,
  ) = _$FilesVerificationCopyWithImpl<$Res, FilesVerification>;
}

/// @nodoc
class _$FilesVerificationCopyWithImpl<$Res, $Val extends FilesVerification>
    implements $FilesVerificationCopyWith<$Res> {
  _$FilesVerificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilesVerification
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FilesVerificationFromZeroImplCopyWith<$Res> {
  factory _$$FilesVerificationFromZeroImplCopyWith(
    _$FilesVerificationFromZeroImpl value,
    $Res Function(_$FilesVerificationFromZeroImpl) then,
  ) = __$$FilesVerificationFromZeroImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FilesVerificationFromZeroImplCopyWithImpl<$Res>
    extends
        _$FilesVerificationCopyWithImpl<$Res, _$FilesVerificationFromZeroImpl>
    implements _$$FilesVerificationFromZeroImplCopyWith<$Res> {
  __$$FilesVerificationFromZeroImplCopyWithImpl(
    _$FilesVerificationFromZeroImpl _value,
    $Res Function(_$FilesVerificationFromZeroImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilesVerification
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
@JsonSerializable()
class _$FilesVerificationFromZeroImpl implements _FilesVerificationFromZero {
  _$FilesVerificationFromZeroImpl({final String? $type})
    : $type = $type ?? 'fromZero';

  factory _$FilesVerificationFromZeroImpl.fromJson(Map<String, dynamic> json) =>
      _$$FilesVerificationFromZeroImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'FilesVerification.fromZero()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilesVerificationFromZeroImpl);
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fromZero,
    required TResult Function(List<String> changedFilesPath) fromLastCommit,
  }) {
    return fromZero();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fromZero,
    TResult? Function(List<String> changedFilesPath)? fromLastCommit,
  }) {
    return fromZero?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fromZero,
    TResult Function(List<String> changedFilesPath)? fromLastCommit,
    required TResult orElse(),
  }) {
    if (fromZero != null) {
      return fromZero();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilesVerificationFromZero value) fromZero,
    required TResult Function(_FilesVerificationFromLastCommit value)
    fromLastCommit,
  }) {
    return fromZero(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilesVerificationFromZero value)? fromZero,
    TResult? Function(_FilesVerificationFromLastCommit value)? fromLastCommit,
  }) {
    return fromZero?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilesVerificationFromZero value)? fromZero,
    TResult Function(_FilesVerificationFromLastCommit value)? fromLastCommit,
    required TResult orElse(),
  }) {
    if (fromZero != null) {
      return fromZero(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FilesVerificationFromZeroImplToJson(this);
  }
}

abstract class _FilesVerificationFromZero implements FilesVerification {
  factory _FilesVerificationFromZero() = _$FilesVerificationFromZeroImpl;

  factory _FilesVerificationFromZero.fromJson(Map<String, dynamic> json) =
      _$FilesVerificationFromZeroImpl.fromJson;
}

/// @nodoc
abstract class _$$FilesVerificationFromLastCommitImplCopyWith<$Res> {
  factory _$$FilesVerificationFromLastCommitImplCopyWith(
    _$FilesVerificationFromLastCommitImpl value,
    $Res Function(_$FilesVerificationFromLastCommitImpl) then,
  ) = __$$FilesVerificationFromLastCommitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> changedFilesPath});
}

/// @nodoc
class __$$FilesVerificationFromLastCommitImplCopyWithImpl<$Res>
    extends
        _$FilesVerificationCopyWithImpl<
          $Res,
          _$FilesVerificationFromLastCommitImpl
        >
    implements _$$FilesVerificationFromLastCommitImplCopyWith<$Res> {
  __$$FilesVerificationFromLastCommitImplCopyWithImpl(
    _$FilesVerificationFromLastCommitImpl _value,
    $Res Function(_$FilesVerificationFromLastCommitImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FilesVerification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? changedFilesPath = null}) {
    return _then(
      _$FilesVerificationFromLastCommitImpl(
        changedFilesPath:
            null == changedFilesPath
                ? _value._changedFilesPath
                : changedFilesPath // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FilesVerificationFromLastCommitImpl
    implements _FilesVerificationFromLastCommit {
  _$FilesVerificationFromLastCommitImpl({
    required final List<String> changedFilesPath,
    final String? $type,
  }) : _changedFilesPath = changedFilesPath,
       $type = $type ?? 'fromLastCommit';

  factory _$FilesVerificationFromLastCommitImpl.fromJson(
    Map<String, dynamic> json,
  ) => _$$FilesVerificationFromLastCommitImplFromJson(json);

  final List<String> _changedFilesPath;
  @override
  List<String> get changedFilesPath {
    if (_changedFilesPath is EqualUnmodifiableListView)
      return _changedFilesPath;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_changedFilesPath);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'FilesVerification.fromLastCommit(changedFilesPath: $changedFilesPath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilesVerificationFromLastCommitImpl &&
            const DeepCollectionEquality().equals(
              other._changedFilesPath,
              _changedFilesPath,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_changedFilesPath),
  );

  /// Create a copy of FilesVerification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilesVerificationFromLastCommitImplCopyWith<
    _$FilesVerificationFromLastCommitImpl
  >
  get copyWith => __$$FilesVerificationFromLastCommitImplCopyWithImpl<
    _$FilesVerificationFromLastCommitImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fromZero,
    required TResult Function(List<String> changedFilesPath) fromLastCommit,
  }) {
    return fromLastCommit(changedFilesPath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fromZero,
    TResult? Function(List<String> changedFilesPath)? fromLastCommit,
  }) {
    return fromLastCommit?.call(changedFilesPath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fromZero,
    TResult Function(List<String> changedFilesPath)? fromLastCommit,
    required TResult orElse(),
  }) {
    if (fromLastCommit != null) {
      return fromLastCommit(changedFilesPath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FilesVerificationFromZero value) fromZero,
    required TResult Function(_FilesVerificationFromLastCommit value)
    fromLastCommit,
  }) {
    return fromLastCommit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FilesVerificationFromZero value)? fromZero,
    TResult? Function(_FilesVerificationFromLastCommit value)? fromLastCommit,
  }) {
    return fromLastCommit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FilesVerificationFromZero value)? fromZero,
    TResult Function(_FilesVerificationFromLastCommit value)? fromLastCommit,
    required TResult orElse(),
  }) {
    if (fromLastCommit != null) {
      return fromLastCommit(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FilesVerificationFromLastCommitImplToJson(this);
  }
}

abstract class _FilesVerificationFromLastCommit implements FilesVerification {
  factory _FilesVerificationFromLastCommit({
    required final List<String> changedFilesPath,
  }) = _$FilesVerificationFromLastCommitImpl;

  factory _FilesVerificationFromLastCommit.fromJson(Map<String, dynamic> json) =
      _$FilesVerificationFromLastCommitImpl.fromJson;

  List<String> get changedFilesPath;

  /// Create a copy of FilesVerification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilesVerificationFromLastCommitImplCopyWith<
    _$FilesVerificationFromLastCommitImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
