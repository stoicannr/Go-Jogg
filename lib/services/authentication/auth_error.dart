import 'package:freezed_annotation/freezed_annotation.dart';

//name of the file.freezed.dart
part 'auth_error.freezed.dart';

//this is a union

@freezed
@immutable
abstract class AuthError with _$AuthError {
  const factory AuthError.canceled() = _Canceled;
  const factory AuthError.unknownError() = _UnknownError;
  const factory AuthError.emailUnverified() = _EmailUnverified;
  const factory AuthError.noRecord() = _NoRecord;
  const factory AuthError.alreadyRegistered() = _AlreadyRegistered;
  const factory AuthError.wrongCredentials() = _WrongCredentials;
}