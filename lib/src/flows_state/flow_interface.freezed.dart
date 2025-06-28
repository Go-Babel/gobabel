// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flow_interface.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

IFlowInterface _$IFlowInterfaceFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'create':
      return IFlowInterfaceCreate.fromJson(json);
    case 'generate':
      return IFlowInterfaceGenerate.fromJson(json);
    case 'sync':
      return IFlowInterfaceSync.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'IFlowInterface',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$IFlowInterface {
  Object get state => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CreateFlowState state) create,
    required TResult Function(GenerateFlowState state) generate,
    required TResult Function(SyncFlowState state) sync,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowState state)? create,
    TResult? Function(GenerateFlowState state)? generate,
    TResult? Function(SyncFlowState state)? sync,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CreateFlowState state)? create,
    TResult Function(GenerateFlowState state)? generate,
    TResult Function(SyncFlowState state)? sync,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IFlowInterfaceCreate value) create,
    required TResult Function(IFlowInterfaceGenerate value) generate,
    required TResult Function(IFlowInterfaceSync value) sync,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IFlowInterfaceCreate value)? create,
    TResult? Function(IFlowInterfaceGenerate value)? generate,
    TResult? Function(IFlowInterfaceSync value)? sync,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IFlowInterfaceCreate value)? create,
    TResult Function(IFlowInterfaceGenerate value)? generate,
    TResult Function(IFlowInterfaceSync value)? sync,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this IFlowInterface to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IFlowInterfaceCopyWith<$Res> {
  factory $IFlowInterfaceCopyWith(
    IFlowInterface value,
    $Res Function(IFlowInterface) then,
  ) = _$IFlowInterfaceCopyWithImpl<$Res, IFlowInterface>;
}

/// @nodoc
class _$IFlowInterfaceCopyWithImpl<$Res, $Val extends IFlowInterface>
    implements $IFlowInterfaceCopyWith<$Res> {
  _$IFlowInterfaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IFlowInterface
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$IFlowInterfaceCreateImplCopyWith<$Res> {
  factory _$$IFlowInterfaceCreateImplCopyWith(
    _$IFlowInterfaceCreateImpl value,
    $Res Function(_$IFlowInterfaceCreateImpl) then,
  ) = __$$IFlowInterfaceCreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CreateFlowState state});

  $CreateFlowStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$IFlowInterfaceCreateImplCopyWithImpl<$Res>
    extends _$IFlowInterfaceCopyWithImpl<$Res, _$IFlowInterfaceCreateImpl>
    implements _$$IFlowInterfaceCreateImplCopyWith<$Res> {
  __$$IFlowInterfaceCreateImplCopyWithImpl(
    _$IFlowInterfaceCreateImpl _value,
    $Res Function(_$IFlowInterfaceCreateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IFlowInterface
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? state = null}) {
    return _then(
      _$IFlowInterfaceCreateImpl(
        state:
            null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                    as CreateFlowState,
      ),
    );
  }

  /// Create a copy of IFlowInterface
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateFlowStateCopyWith<$Res> get state {
    return $CreateFlowStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$IFlowInterfaceCreateImpl extends IFlowInterfaceCreate {
  const _$IFlowInterfaceCreateImpl({required this.state, final String? $type})
    : $type = $type ?? 'create',
      super._();

  factory _$IFlowInterfaceCreateImpl.fromJson(Map<String, dynamic> json) =>
      _$$IFlowInterfaceCreateImplFromJson(json);

  @override
  final CreateFlowState state;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'IFlowInterface.create(state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IFlowInterfaceCreateImpl &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, state);

  /// Create a copy of IFlowInterface
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IFlowInterfaceCreateImplCopyWith<_$IFlowInterfaceCreateImpl>
  get copyWith =>
      __$$IFlowInterfaceCreateImplCopyWithImpl<_$IFlowInterfaceCreateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CreateFlowState state) create,
    required TResult Function(GenerateFlowState state) generate,
    required TResult Function(SyncFlowState state) sync,
  }) {
    return create(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowState state)? create,
    TResult? Function(GenerateFlowState state)? generate,
    TResult? Function(SyncFlowState state)? sync,
  }) {
    return create?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CreateFlowState state)? create,
    TResult Function(GenerateFlowState state)? generate,
    TResult Function(SyncFlowState state)? sync,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IFlowInterfaceCreate value) create,
    required TResult Function(IFlowInterfaceGenerate value) generate,
    required TResult Function(IFlowInterfaceSync value) sync,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IFlowInterfaceCreate value)? create,
    TResult? Function(IFlowInterfaceGenerate value)? generate,
    TResult? Function(IFlowInterfaceSync value)? sync,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IFlowInterfaceCreate value)? create,
    TResult Function(IFlowInterfaceGenerate value)? generate,
    TResult Function(IFlowInterfaceSync value)? sync,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$IFlowInterfaceCreateImplToJson(this);
  }
}

abstract class IFlowInterfaceCreate extends IFlowInterface {
  const factory IFlowInterfaceCreate({required final CreateFlowState state}) =
      _$IFlowInterfaceCreateImpl;
  const IFlowInterfaceCreate._() : super._();

  factory IFlowInterfaceCreate.fromJson(Map<String, dynamic> json) =
      _$IFlowInterfaceCreateImpl.fromJson;

  @override
  CreateFlowState get state;

  /// Create a copy of IFlowInterface
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IFlowInterfaceCreateImplCopyWith<_$IFlowInterfaceCreateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IFlowInterfaceGenerateImplCopyWith<$Res> {
  factory _$$IFlowInterfaceGenerateImplCopyWith(
    _$IFlowInterfaceGenerateImpl value,
    $Res Function(_$IFlowInterfaceGenerateImpl) then,
  ) = __$$IFlowInterfaceGenerateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GenerateFlowState state});

  $GenerateFlowStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$IFlowInterfaceGenerateImplCopyWithImpl<$Res>
    extends _$IFlowInterfaceCopyWithImpl<$Res, _$IFlowInterfaceGenerateImpl>
    implements _$$IFlowInterfaceGenerateImplCopyWith<$Res> {
  __$$IFlowInterfaceGenerateImplCopyWithImpl(
    _$IFlowInterfaceGenerateImpl _value,
    $Res Function(_$IFlowInterfaceGenerateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IFlowInterface
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? state = null}) {
    return _then(
      _$IFlowInterfaceGenerateImpl(
        state:
            null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                    as GenerateFlowState,
      ),
    );
  }

  /// Create a copy of IFlowInterface
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GenerateFlowStateCopyWith<$Res> get state {
    return $GenerateFlowStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$IFlowInterfaceGenerateImpl extends IFlowInterfaceGenerate {
  const _$IFlowInterfaceGenerateImpl({required this.state, final String? $type})
    : $type = $type ?? 'generate',
      super._();

  factory _$IFlowInterfaceGenerateImpl.fromJson(Map<String, dynamic> json) =>
      _$$IFlowInterfaceGenerateImplFromJson(json);

  @override
  final GenerateFlowState state;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'IFlowInterface.generate(state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IFlowInterfaceGenerateImpl &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, state);

  /// Create a copy of IFlowInterface
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IFlowInterfaceGenerateImplCopyWith<_$IFlowInterfaceGenerateImpl>
  get copyWith =>
      __$$IFlowInterfaceGenerateImplCopyWithImpl<_$IFlowInterfaceGenerateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CreateFlowState state) create,
    required TResult Function(GenerateFlowState state) generate,
    required TResult Function(SyncFlowState state) sync,
  }) {
    return generate(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowState state)? create,
    TResult? Function(GenerateFlowState state)? generate,
    TResult? Function(SyncFlowState state)? sync,
  }) {
    return generate?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CreateFlowState state)? create,
    TResult Function(GenerateFlowState state)? generate,
    TResult Function(SyncFlowState state)? sync,
    required TResult orElse(),
  }) {
    if (generate != null) {
      return generate(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IFlowInterfaceCreate value) create,
    required TResult Function(IFlowInterfaceGenerate value) generate,
    required TResult Function(IFlowInterfaceSync value) sync,
  }) {
    return generate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IFlowInterfaceCreate value)? create,
    TResult? Function(IFlowInterfaceGenerate value)? generate,
    TResult? Function(IFlowInterfaceSync value)? sync,
  }) {
    return generate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IFlowInterfaceCreate value)? create,
    TResult Function(IFlowInterfaceGenerate value)? generate,
    TResult Function(IFlowInterfaceSync value)? sync,
    required TResult orElse(),
  }) {
    if (generate != null) {
      return generate(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$IFlowInterfaceGenerateImplToJson(this);
  }
}

abstract class IFlowInterfaceGenerate extends IFlowInterface {
  const factory IFlowInterfaceGenerate({
    required final GenerateFlowState state,
  }) = _$IFlowInterfaceGenerateImpl;
  const IFlowInterfaceGenerate._() : super._();

  factory IFlowInterfaceGenerate.fromJson(Map<String, dynamic> json) =
      _$IFlowInterfaceGenerateImpl.fromJson;

  @override
  GenerateFlowState get state;

  /// Create a copy of IFlowInterface
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IFlowInterfaceGenerateImplCopyWith<_$IFlowInterfaceGenerateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IFlowInterfaceSyncImplCopyWith<$Res> {
  factory _$$IFlowInterfaceSyncImplCopyWith(
    _$IFlowInterfaceSyncImpl value,
    $Res Function(_$IFlowInterfaceSyncImpl) then,
  ) = __$$IFlowInterfaceSyncImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SyncFlowState state});

  $SyncFlowStateCopyWith<$Res> get state;
}

/// @nodoc
class __$$IFlowInterfaceSyncImplCopyWithImpl<$Res>
    extends _$IFlowInterfaceCopyWithImpl<$Res, _$IFlowInterfaceSyncImpl>
    implements _$$IFlowInterfaceSyncImplCopyWith<$Res> {
  __$$IFlowInterfaceSyncImplCopyWithImpl(
    _$IFlowInterfaceSyncImpl _value,
    $Res Function(_$IFlowInterfaceSyncImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IFlowInterface
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? state = null}) {
    return _then(
      _$IFlowInterfaceSyncImpl(
        state:
            null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                    as SyncFlowState,
      ),
    );
  }

  /// Create a copy of IFlowInterface
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SyncFlowStateCopyWith<$Res> get state {
    return $SyncFlowStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$IFlowInterfaceSyncImpl extends IFlowInterfaceSync {
  const _$IFlowInterfaceSyncImpl({required this.state, final String? $type})
    : $type = $type ?? 'sync',
      super._();

  factory _$IFlowInterfaceSyncImpl.fromJson(Map<String, dynamic> json) =>
      _$$IFlowInterfaceSyncImplFromJson(json);

  @override
  final SyncFlowState state;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'IFlowInterface.sync(state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IFlowInterfaceSyncImpl &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, state);

  /// Create a copy of IFlowInterface
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IFlowInterfaceSyncImplCopyWith<_$IFlowInterfaceSyncImpl> get copyWith =>
      __$$IFlowInterfaceSyncImplCopyWithImpl<_$IFlowInterfaceSyncImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CreateFlowState state) create,
    required TResult Function(GenerateFlowState state) generate,
    required TResult Function(SyncFlowState state) sync,
  }) {
    return sync(state);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(CreateFlowState state)? create,
    TResult? Function(GenerateFlowState state)? generate,
    TResult? Function(SyncFlowState state)? sync,
  }) {
    return sync?.call(state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CreateFlowState state)? create,
    TResult Function(GenerateFlowState state)? generate,
    TResult Function(SyncFlowState state)? sync,
    required TResult orElse(),
  }) {
    if (sync != null) {
      return sync(state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(IFlowInterfaceCreate value) create,
    required TResult Function(IFlowInterfaceGenerate value) generate,
    required TResult Function(IFlowInterfaceSync value) sync,
  }) {
    return sync(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(IFlowInterfaceCreate value)? create,
    TResult? Function(IFlowInterfaceGenerate value)? generate,
    TResult? Function(IFlowInterfaceSync value)? sync,
  }) {
    return sync?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(IFlowInterfaceCreate value)? create,
    TResult Function(IFlowInterfaceGenerate value)? generate,
    TResult Function(IFlowInterfaceSync value)? sync,
    required TResult orElse(),
  }) {
    if (sync != null) {
      return sync(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$IFlowInterfaceSyncImplToJson(this);
  }
}

abstract class IFlowInterfaceSync extends IFlowInterface {
  const factory IFlowInterfaceSync({required final SyncFlowState state}) =
      _$IFlowInterfaceSyncImpl;
  const IFlowInterfaceSync._() : super._();

  factory IFlowInterfaceSync.fromJson(Map<String, dynamic> json) =
      _$IFlowInterfaceSyncImpl.fromJson;

  @override
  SyncFlowState get state;

  /// Create a copy of IFlowInterface
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IFlowInterfaceSyncImplCopyWith<_$IFlowInterfaceSyncImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
