import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:starter_flutter/resources.dart';
import 'package:starter_flutter/services/authentication/auth_error.dart';

final authenticationExceptionProvider = StateProvider<AuthenticationException?>((ref) => null);


class AuthenticationException implements Exception {
  AuthenticationException(this._authError);

  final AuthError _authError;

  String get cause => _authError.when(
    canceled: () => AuthErrorStrings.canceled,
    alreadyRegistered: () => AuthErrorStrings.alreadyRegistered,
    wrongCredentials: () => AuthErrorStrings.wrongCredentials,
    noRecord: () => AuthErrorStrings.noRecord,
    emailUnverified: () => AuthErrorStrings.emailUnverified,
    unknownError: () => AuthErrorStrings.unknownError,
  );
}