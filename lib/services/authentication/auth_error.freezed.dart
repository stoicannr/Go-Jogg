// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthErrorTearOff {
  const _$AuthErrorTearOff();

  _Canceled canceled() {
    return const _Canceled();
  }

  _UnknownError unknownError() {
    return const _UnknownError();
  }

  _EmailUnverified emailUnverified() {
    return const _EmailUnverified();
  }

  _NoRecord noRecord() {
    return const _NoRecord();
  }

  _AlreadyRegistered alreadyRegistered() {
    return const _AlreadyRegistered();
  }

  _WrongCredentials wrongCredentials() {
    return const _WrongCredentials();
  }
}

/// @nodoc
const $AuthError = _$AuthErrorTearOff();

/// @nodoc
mixin _$AuthError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() canceled,
    required TResult Function() unknownError,
    required TResult Function() emailUnverified,
    required TResult Function() noRecord,
    required TResult Function() alreadyRegistered,
    required TResult Function() wrongCredentials,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? canceled,
    TResult Function()? unknownError,
    TResult Function()? emailUnverified,
    TResult Function()? noRecord,
    TResult Function()? alreadyRegistered,
    TResult Function()? wrongCredentials,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Canceled value) canceled,
    required TResult Function(_UnknownError value) unknownError,
    required TResult Function(_EmailUnverified value) emailUnverified,
    required TResult Function(_NoRecord value) noRecord,
    required TResult Function(_AlreadyRegistered value) alreadyRegistered,
    required TResult Function(_WrongCredentials value) wrongCredentials,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Canceled value)? canceled,
    TResult Function(_UnknownError value)? unknownError,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_NoRecord value)? noRecord,
    TResult Function(_AlreadyRegistered value)? alreadyRegistered,
    TResult Function(_WrongCredentials value)? wrongCredentials,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthErrorCopyWith<$Res> {
  factory $AuthErrorCopyWith(AuthError value, $Res Function(AuthError) then) =
      _$AuthErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthErrorCopyWithImpl<$Res> implements $AuthErrorCopyWith<$Res> {
  _$AuthErrorCopyWithImpl(this._value, this._then);

  final AuthError _value;
  // ignore: unused_field
  final $Res Function(AuthError) _then;
}

/// @nodoc
abstract class _$CanceledCopyWith<$Res> {
  factory _$CanceledCopyWith(_Canceled value, $Res Function(_Canceled) then) =
      __$CanceledCopyWithImpl<$Res>;
}

/// @nodoc
class __$CanceledCopyWithImpl<$Res> extends _$AuthErrorCopyWithImpl<$Res>
    implements _$CanceledCopyWith<$Res> {
  __$CanceledCopyWithImpl(_Canceled _value, $Res Function(_Canceled) _then)
      : super(_value, (v) => _then(v as _Canceled));

  @override
  _Canceled get _value => super._value as _Canceled;
}

/// @nodoc

class _$_Canceled implements _Canceled {
  const _$_Canceled();

  @override
  String toString() {
    return 'AuthError.canceled()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Canceled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() canceled,
    required TResult Function() unknownError,
    required TResult Function() emailUnverified,
    required TResult Function() noRecord,
    required TResult Function() alreadyRegistered,
    required TResult Function() wrongCredentials,
  }) {
    return canceled();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? canceled,
    TResult Function()? unknownError,
    TResult Function()? emailUnverified,
    TResult Function()? noRecord,
    TResult Function()? alreadyRegistered,
    TResult Function()? wrongCredentials,
    required TResult orElse(),
  }) {
    if (canceled != null) {
      return canceled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Canceled value) canceled,
    required TResult Function(_UnknownError value) unknownError,
    required TResult Function(_EmailUnverified value) emailUnverified,
    required TResult Function(_NoRecord value) noRecord,
    required TResult Function(_AlreadyRegistered value) alreadyRegistered,
    required TResult Function(_WrongCredentials value) wrongCredentials,
  }) {
    return canceled(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Canceled value)? canceled,
    TResult Function(_UnknownError value)? unknownError,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_NoRecord value)? noRecord,
    TResult Function(_AlreadyRegistered value)? alreadyRegistered,
    TResult Function(_WrongCredentials value)? wrongCredentials,
    required TResult orElse(),
  }) {
    if (canceled != null) {
      return canceled(this);
    }
    return orElse();
  }
}

abstract class _Canceled implements AuthError {
  const factory _Canceled() = _$_Canceled;
}

/// @nodoc
abstract class _$UnknownErrorCopyWith<$Res> {
  factory _$UnknownErrorCopyWith(
          _UnknownError value, $Res Function(_UnknownError) then) =
      __$UnknownErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$UnknownErrorCopyWithImpl<$Res> extends _$AuthErrorCopyWithImpl<$Res>
    implements _$UnknownErrorCopyWith<$Res> {
  __$UnknownErrorCopyWithImpl(
      _UnknownError _value, $Res Function(_UnknownError) _then)
      : super(_value, (v) => _then(v as _UnknownError));

  @override
  _UnknownError get _value => super._value as _UnknownError;
}

/// @nodoc

class _$_UnknownError implements _UnknownError {
  const _$_UnknownError();

  @override
  String toString() {
    return 'AuthError.unknownError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _UnknownError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() canceled,
    required TResult Function() unknownError,
    required TResult Function() emailUnverified,
    required TResult Function() noRecord,
    required TResult Function() alreadyRegistered,
    required TResult Function() wrongCredentials,
  }) {
    return unknownError();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? canceled,
    TResult Function()? unknownError,
    TResult Function()? emailUnverified,
    TResult Function()? noRecord,
    TResult Function()? alreadyRegistered,
    TResult Function()? wrongCredentials,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Canceled value) canceled,
    required TResult Function(_UnknownError value) unknownError,
    required TResult Function(_EmailUnverified value) emailUnverified,
    required TResult Function(_NoRecord value) noRecord,
    required TResult Function(_AlreadyRegistered value) alreadyRegistered,
    required TResult Function(_WrongCredentials value) wrongCredentials,
  }) {
    return unknownError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Canceled value)? canceled,
    TResult Function(_UnknownError value)? unknownError,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_NoRecord value)? noRecord,
    TResult Function(_AlreadyRegistered value)? alreadyRegistered,
    TResult Function(_WrongCredentials value)? wrongCredentials,
    required TResult orElse(),
  }) {
    if (unknownError != null) {
      return unknownError(this);
    }
    return orElse();
  }
}

abstract class _UnknownError implements AuthError {
  const factory _UnknownError() = _$_UnknownError;
}

/// @nodoc
abstract class _$EmailUnverifiedCopyWith<$Res> {
  factory _$EmailUnverifiedCopyWith(
          _EmailUnverified value, $Res Function(_EmailUnverified) then) =
      __$EmailUnverifiedCopyWithImpl<$Res>;
}

/// @nodoc
class __$EmailUnverifiedCopyWithImpl<$Res> extends _$AuthErrorCopyWithImpl<$Res>
    implements _$EmailUnverifiedCopyWith<$Res> {
  __$EmailUnverifiedCopyWithImpl(
      _EmailUnverified _value, $Res Function(_EmailUnverified) _then)
      : super(_value, (v) => _then(v as _EmailUnverified));

  @override
  _EmailUnverified get _value => super._value as _EmailUnverified;
}

/// @nodoc

class _$_EmailUnverified implements _EmailUnverified {
  const _$_EmailUnverified();

  @override
  String toString() {
    return 'AuthError.emailUnverified()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _EmailUnverified);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() canceled,
    required TResult Function() unknownError,
    required TResult Function() emailUnverified,
    required TResult Function() noRecord,
    required TResult Function() alreadyRegistered,
    required TResult Function() wrongCredentials,
  }) {
    return emailUnverified();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? canceled,
    TResult Function()? unknownError,
    TResult Function()? emailUnverified,
    TResult Function()? noRecord,
    TResult Function()? alreadyRegistered,
    TResult Function()? wrongCredentials,
    required TResult orElse(),
  }) {
    if (emailUnverified != null) {
      return emailUnverified();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Canceled value) canceled,
    required TResult Function(_UnknownError value) unknownError,
    required TResult Function(_EmailUnverified value) emailUnverified,
    required TResult Function(_NoRecord value) noRecord,
    required TResult Function(_AlreadyRegistered value) alreadyRegistered,
    required TResult Function(_WrongCredentials value) wrongCredentials,
  }) {
    return emailUnverified(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Canceled value)? canceled,
    TResult Function(_UnknownError value)? unknownError,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_NoRecord value)? noRecord,
    TResult Function(_AlreadyRegistered value)? alreadyRegistered,
    TResult Function(_WrongCredentials value)? wrongCredentials,
    required TResult orElse(),
  }) {
    if (emailUnverified != null) {
      return emailUnverified(this);
    }
    return orElse();
  }
}

abstract class _EmailUnverified implements AuthError {
  const factory _EmailUnverified() = _$_EmailUnverified;
}

/// @nodoc
abstract class _$NoRecordCopyWith<$Res> {
  factory _$NoRecordCopyWith(_NoRecord value, $Res Function(_NoRecord) then) =
      __$NoRecordCopyWithImpl<$Res>;
}

/// @nodoc
class __$NoRecordCopyWithImpl<$Res> extends _$AuthErrorCopyWithImpl<$Res>
    implements _$NoRecordCopyWith<$Res> {
  __$NoRecordCopyWithImpl(_NoRecord _value, $Res Function(_NoRecord) _then)
      : super(_value, (v) => _then(v as _NoRecord));

  @override
  _NoRecord get _value => super._value as _NoRecord;
}

/// @nodoc

class _$_NoRecord implements _NoRecord {
  const _$_NoRecord();

  @override
  String toString() {
    return 'AuthError.noRecord()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _NoRecord);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() canceled,
    required TResult Function() unknownError,
    required TResult Function() emailUnverified,
    required TResult Function() noRecord,
    required TResult Function() alreadyRegistered,
    required TResult Function() wrongCredentials,
  }) {
    return noRecord();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? canceled,
    TResult Function()? unknownError,
    TResult Function()? emailUnverified,
    TResult Function()? noRecord,
    TResult Function()? alreadyRegistered,
    TResult Function()? wrongCredentials,
    required TResult orElse(),
  }) {
    if (noRecord != null) {
      return noRecord();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Canceled value) canceled,
    required TResult Function(_UnknownError value) unknownError,
    required TResult Function(_EmailUnverified value) emailUnverified,
    required TResult Function(_NoRecord value) noRecord,
    required TResult Function(_AlreadyRegistered value) alreadyRegistered,
    required TResult Function(_WrongCredentials value) wrongCredentials,
  }) {
    return noRecord(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Canceled value)? canceled,
    TResult Function(_UnknownError value)? unknownError,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_NoRecord value)? noRecord,
    TResult Function(_AlreadyRegistered value)? alreadyRegistered,
    TResult Function(_WrongCredentials value)? wrongCredentials,
    required TResult orElse(),
  }) {
    if (noRecord != null) {
      return noRecord(this);
    }
    return orElse();
  }
}

abstract class _NoRecord implements AuthError {
  const factory _NoRecord() = _$_NoRecord;
}

/// @nodoc
abstract class _$AlreadyRegisteredCopyWith<$Res> {
  factory _$AlreadyRegisteredCopyWith(
          _AlreadyRegistered value, $Res Function(_AlreadyRegistered) then) =
      __$AlreadyRegisteredCopyWithImpl<$Res>;
}

/// @nodoc
class __$AlreadyRegisteredCopyWithImpl<$Res>
    extends _$AuthErrorCopyWithImpl<$Res>
    implements _$AlreadyRegisteredCopyWith<$Res> {
  __$AlreadyRegisteredCopyWithImpl(
      _AlreadyRegistered _value, $Res Function(_AlreadyRegistered) _then)
      : super(_value, (v) => _then(v as _AlreadyRegistered));

  @override
  _AlreadyRegistered get _value => super._value as _AlreadyRegistered;
}

/// @nodoc

class _$_AlreadyRegistered implements _AlreadyRegistered {
  const _$_AlreadyRegistered();

  @override
  String toString() {
    return 'AuthError.alreadyRegistered()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _AlreadyRegistered);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() canceled,
    required TResult Function() unknownError,
    required TResult Function() emailUnverified,
    required TResult Function() noRecord,
    required TResult Function() alreadyRegistered,
    required TResult Function() wrongCredentials,
  }) {
    return alreadyRegistered();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? canceled,
    TResult Function()? unknownError,
    TResult Function()? emailUnverified,
    TResult Function()? noRecord,
    TResult Function()? alreadyRegistered,
    TResult Function()? wrongCredentials,
    required TResult orElse(),
  }) {
    if (alreadyRegistered != null) {
      return alreadyRegistered();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Canceled value) canceled,
    required TResult Function(_UnknownError value) unknownError,
    required TResult Function(_EmailUnverified value) emailUnverified,
    required TResult Function(_NoRecord value) noRecord,
    required TResult Function(_AlreadyRegistered value) alreadyRegistered,
    required TResult Function(_WrongCredentials value) wrongCredentials,
  }) {
    return alreadyRegistered(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Canceled value)? canceled,
    TResult Function(_UnknownError value)? unknownError,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_NoRecord value)? noRecord,
    TResult Function(_AlreadyRegistered value)? alreadyRegistered,
    TResult Function(_WrongCredentials value)? wrongCredentials,
    required TResult orElse(),
  }) {
    if (alreadyRegistered != null) {
      return alreadyRegistered(this);
    }
    return orElse();
  }
}

abstract class _AlreadyRegistered implements AuthError {
  const factory _AlreadyRegistered() = _$_AlreadyRegistered;
}

/// @nodoc
abstract class _$WrongCredentialsCopyWith<$Res> {
  factory _$WrongCredentialsCopyWith(
          _WrongCredentials value, $Res Function(_WrongCredentials) then) =
      __$WrongCredentialsCopyWithImpl<$Res>;
}

/// @nodoc
class __$WrongCredentialsCopyWithImpl<$Res>
    extends _$AuthErrorCopyWithImpl<$Res>
    implements _$WrongCredentialsCopyWith<$Res> {
  __$WrongCredentialsCopyWithImpl(
      _WrongCredentials _value, $Res Function(_WrongCredentials) _then)
      : super(_value, (v) => _then(v as _WrongCredentials));

  @override
  _WrongCredentials get _value => super._value as _WrongCredentials;
}

/// @nodoc

class _$_WrongCredentials implements _WrongCredentials {
  const _$_WrongCredentials();

  @override
  String toString() {
    return 'AuthError.wrongCredentials()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _WrongCredentials);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() canceled,
    required TResult Function() unknownError,
    required TResult Function() emailUnverified,
    required TResult Function() noRecord,
    required TResult Function() alreadyRegistered,
    required TResult Function() wrongCredentials,
  }) {
    return wrongCredentials();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? canceled,
    TResult Function()? unknownError,
    TResult Function()? emailUnverified,
    TResult Function()? noRecord,
    TResult Function()? alreadyRegistered,
    TResult Function()? wrongCredentials,
    required TResult orElse(),
  }) {
    if (wrongCredentials != null) {
      return wrongCredentials();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Canceled value) canceled,
    required TResult Function(_UnknownError value) unknownError,
    required TResult Function(_EmailUnverified value) emailUnverified,
    required TResult Function(_NoRecord value) noRecord,
    required TResult Function(_AlreadyRegistered value) alreadyRegistered,
    required TResult Function(_WrongCredentials value) wrongCredentials,
  }) {
    return wrongCredentials(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Canceled value)? canceled,
    TResult Function(_UnknownError value)? unknownError,
    TResult Function(_EmailUnverified value)? emailUnverified,
    TResult Function(_NoRecord value)? noRecord,
    TResult Function(_AlreadyRegistered value)? alreadyRegistered,
    TResult Function(_WrongCredentials value)? wrongCredentials,
    required TResult orElse(),
  }) {
    if (wrongCredentials != null) {
      return wrongCredentials(this);
    }
    return orElse();
  }
}

abstract class _WrongCredentials implements AuthError {
  const factory _WrongCredentials() = _$_WrongCredentials;
}
