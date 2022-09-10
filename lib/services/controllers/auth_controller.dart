// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:starter_flutter/services/authentication/authentication_exception.dart';
// import 'package:starter_flutter/services/authentication/base_authenticator.dart';
// import 'package:starter_flutter/services/authentication/firebase_authenticator.dart';
//
// import 'dart:async';
//
//
// final authControllerProvider = StateNotifierProvider<AuthController, User?>((ref) => AuthController(ref.read));
//
//
// class AuthController extends StateNotifier<User?> {
//   AuthController(this._reader) : super(null) {
//     _authStateChangedSubscription?.cancel();
//     _authStateChangedSubscription = _authenticator.authStateChanged.listen((user) => state = user);
//   }
//
//   final Reader _reader;
//
//   StreamSubscription<User?>? _authStateChangedSubscription;
//
//   FirebaseAuthenticator get _authenticator => _reader(firebaseAuthenticatorProvider);
//   StateController get _exceptionController => _reader(authenticationExceptionProvider);
//
//   @override
//   void dispose() {
//     super.dispose();
//     _authStateChangedSubscription?.cancel();
//   }
//
//   Future<void> signInAnonimously() async {
//     try {
//       await _authenticator.signInAnonymously();
//     } on AuthenticationException catch (e) {
//       _exceptionController.state = e;
//     }
//   }
//
//   Future<void> signInEmail({required String email, required String password}) async {
//     try {
//       await _authenticator.signInEmail(email: email, password: password);
//     } on AuthenticationException catch (e) {
//       _exceptionController.state = e;
//     }
//   }
//
//   Future<void> signInSocial({required SocialType type}) async {
//     try {
//       await _authenticator.signInSocial(type: type);
//     } on AuthenticationException catch (e) {
//       _exceptionController.state = e;
//     }
//   }
//
//   Future<void> signOut() async {
//     try {
//       await _authenticator.signOut();
//     } on AuthenticationException catch (e) {
//       _exceptionController.state = e;
//     }
//   }
// }