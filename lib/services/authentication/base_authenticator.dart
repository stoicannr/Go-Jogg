import 'package:firebase_auth/firebase_auth.dart';

enum SocialType {
  google,
  facebook,
  apple
}

abstract class BaseAuthenticator {
  Stream<User?> get authStateChanged;
  Future<void> signInAnonymously();
  Future<void> signInEmail({required String email, required String password});
  Future<void> signUpEmail({required String email, required String password});
  Future<void> signInSocial({required SocialType type});
  User? getCurrentUser();
  Future<void> signOut();
}