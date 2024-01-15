// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'id_scanning_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$IdScanningState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noScanned,
    required TResult Function(DroppedFile droppedFile) scanned,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noScanned,
    TResult? Function(DroppedFile droppedFile)? scanned,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noScanned,
    TResult Function(DroppedFile droppedFile)? scanned,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoScanned value) noScanned,
    required TResult Function(_Scanned value) scanned,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoScanned value)? noScanned,
    TResult? Function(_Scanned value)? scanned,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoScanned value)? noScanned,
    TResult Function(_Scanned value)? scanned,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IdScanningStateCopyWith<$Res> {
  factory $IdScanningStateCopyWith(
          IdScanningState value, $Res Function(IdScanningState) then) =
      _$IdScanningStateCopyWithImpl<$Res, IdScanningState>;
}

/// @nodoc
class _$IdScanningStateCopyWithImpl<$Res, $Val extends IdScanningState>
    implements $IdScanningStateCopyWith<$Res> {
  _$IdScanningStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NoScannedImplCopyWith<$Res> {
  factory _$$NoScannedImplCopyWith(
          _$NoScannedImpl value, $Res Function(_$NoScannedImpl) then) =
      __$$NoScannedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoScannedImplCopyWithImpl<$Res>
    extends _$IdScanningStateCopyWithImpl<$Res, _$NoScannedImpl>
    implements _$$NoScannedImplCopyWith<$Res> {
  __$$NoScannedImplCopyWithImpl(
      _$NoScannedImpl _value, $Res Function(_$NoScannedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoScannedImpl implements _NoScanned {
  const _$NoScannedImpl();

  @override
  String toString() {
    return 'IdScanningState.noScanned()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NoScannedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noScanned,
    required TResult Function(DroppedFile droppedFile) scanned,
  }) {
    return noScanned();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noScanned,
    TResult? Function(DroppedFile droppedFile)? scanned,
  }) {
    return noScanned?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noScanned,
    TResult Function(DroppedFile droppedFile)? scanned,
    required TResult orElse(),
  }) {
    if (noScanned != null) {
      return noScanned();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoScanned value) noScanned,
    required TResult Function(_Scanned value) scanned,
  }) {
    return noScanned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoScanned value)? noScanned,
    TResult? Function(_Scanned value)? scanned,
  }) {
    return noScanned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoScanned value)? noScanned,
    TResult Function(_Scanned value)? scanned,
    required TResult orElse(),
  }) {
    if (noScanned != null) {
      return noScanned(this);
    }
    return orElse();
  }
}

abstract class _NoScanned implements IdScanningState {
  const factory _NoScanned() = _$NoScannedImpl;
}

/// @nodoc
abstract class _$$ScannedImplCopyWith<$Res> {
  factory _$$ScannedImplCopyWith(
          _$ScannedImpl value, $Res Function(_$ScannedImpl) then) =
      __$$ScannedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DroppedFile droppedFile});
}

/// @nodoc
class __$$ScannedImplCopyWithImpl<$Res>
    extends _$IdScanningStateCopyWithImpl<$Res, _$ScannedImpl>
    implements _$$ScannedImplCopyWith<$Res> {
  __$$ScannedImplCopyWithImpl(
      _$ScannedImpl _value, $Res Function(_$ScannedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? droppedFile = null,
  }) {
    return _then(_$ScannedImpl(
      droppedFile: null == droppedFile
          ? _value.droppedFile
          : droppedFile // ignore: cast_nullable_to_non_nullable
              as DroppedFile,
    ));
  }
}

/// @nodoc

class _$ScannedImpl implements _Scanned {
  const _$ScannedImpl({required this.droppedFile});

  @override
  final DroppedFile droppedFile;

  @override
  String toString() {
    return 'IdScanningState.scanned(droppedFile: $droppedFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScannedImpl &&
            (identical(other.droppedFile, droppedFile) ||
                other.droppedFile == droppedFile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, droppedFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ScannedImplCopyWith<_$ScannedImpl> get copyWith =>
      __$$ScannedImplCopyWithImpl<_$ScannedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noScanned,
    required TResult Function(DroppedFile droppedFile) scanned,
  }) {
    return scanned(droppedFile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? noScanned,
    TResult? Function(DroppedFile droppedFile)? scanned,
  }) {
    return scanned?.call(droppedFile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noScanned,
    TResult Function(DroppedFile droppedFile)? scanned,
    required TResult orElse(),
  }) {
    if (scanned != null) {
      return scanned(droppedFile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NoScanned value) noScanned,
    required TResult Function(_Scanned value) scanned,
  }) {
    return scanned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NoScanned value)? noScanned,
    TResult? Function(_Scanned value)? scanned,
  }) {
    return scanned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NoScanned value)? noScanned,
    TResult Function(_Scanned value)? scanned,
    required TResult orElse(),
  }) {
    if (scanned != null) {
      return scanned(this);
    }
    return orElse();
  }
}

abstract class _Scanned implements IdScanningState {
  const factory _Scanned({required final DroppedFile droppedFile}) =
      _$ScannedImpl;

  DroppedFile get droppedFile;
  @JsonKey(ignore: true)
  _$$ScannedImplCopyWith<_$ScannedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
