import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
// import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:starter_flutter/providers/service_providers.dart';
import 'package:starter_flutter/resources.dart';
import 'package:starter_flutter/services/authentication/auth_error.dart';
import 'package:starter_flutter/services/authentication/authentication_exception.dart';
import 'package:starter_flutter/services/authentication/base_authenticator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


final firebaseAuthenticatorProvider = Provider<FirebaseAuthenticator>(
    (ref) => FirebaseAuthenticator((ref.read))..init()
);


class FirebaseAuthenticator implements BaseAuthenticator {
  FirebaseAuthenticator(this._reader);

  final Reader _reader;

  @override
  Stream<User?> get authStateChanged => _reader(firebaseAuthProvider).authStateChanges();
  FirebaseAuth get _instance => _reader(firebaseAuthProvider);

   late FacebookLogin _facebookLogin;
   late GoogleSignIn _googleSignIn;
   GoogleSignInAccount? _currentGoogleUser;

  void init() {
    _facebookLogin = FacebookLogin();
    _googleSignIn = GoogleSignIn(
        signInOption: SignInOption.standard,
        scopes: ["email"]
    );
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      if (account != null) {
        _currentGoogleUser = account;
        _completeGoogleSignIn();
      }
    });
  }

  @override
  User? getCurrentUser() {
    try {
      return _instance.currentUser;
    } on FirebaseAuthException catch (e) {
      throw AuthenticationException(const AuthError.unknownError());
    }
  }

  @override
  Future<void> signInAnonymously() async {
    try {
      await _instance.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      throw AuthenticationException(const AuthError.unknownError());
    }
  }

  @override
  Future<void> signInEmail({required String email, required String password}) async {
    try {
      final userCredential = await _instance.signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user?.email != null) {
        if (!userCredential.user!.emailVerified) {
          throw AuthenticationException(const AuthError.emailUnverified());
        }
      } else {
        throw AuthenticationException(const AuthError.unknownError());
      }
    } on FirebaseAuthException catch (e){
      if (e.code == "user-not-found" || e.code == "wrong-password") {
        throw AuthenticationException(const AuthError.wrongCredentials());
      }
      throw AuthenticationException(const AuthError.unknownError());
    }
  }

  @override
  Future<void> signUpEmail({required String email, required String password}) async {
    try {
      final userCredential = await _instance.createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user?.sendEmailVerification();
    } on FirebaseAuthException catch(e) {
      if (e.code == "email-already-in-use") {
        throw AuthenticationException(const AuthError.alreadyRegistered());
      }
      throw AuthenticationException(const AuthError.unknownError());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _reader(firebaseAuthProvider).signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthenticationException(const AuthError.wrongCredentials());
    }
  }

  Future<void> _completeGoogleSignIn() async {
    try {
      var googleAuth = await _currentGoogleUser!.authentication;
      var googleCredential = GoogleAuthProvider.credential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      await _instance.signInWithCredential(googleCredential);
    } on Exception catch (e) {
      throw AuthenticationException(const AuthError.unknownError());
    }
  }

  Future<void> _signInGoogle() async {
    try {
      if (_currentGoogleUser == null) {
        var googleUser = await _googleSignIn.signIn();
        if (googleUser == null) {
          throw AuthenticationException(const AuthError.unknownError());
        }
      }
    } catch (e) {
      throw AuthenticationException(const AuthError.unknownError());
    }
  }

  Future<void> _signInFacebook() async {
    try {
      var facebookLoginResult = await _facebookLogin.logIn(permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ]);
      switch (facebookLoginResult.status) {
        case FacebookLoginStatus.error:
          throw AuthenticationException(const AuthError.unknownError());
        case FacebookLoginStatus.cancel:
          throw AuthenticationException(const AuthError.canceled());
        case FacebookLoginStatus.success:
          final token = facebookLoginResult.accessToken!.token;
          var fbCredential = FacebookAuthProvider.credential(token);
          await _instance.signInWithCredential(fbCredential);
      }
      throw AuthenticationException(const AuthError.unknownError());
    } catch (e) {
      throw AuthenticationException(const AuthError.unknownError());

    }
  }

  Future<void> _signInApple() async {
    // try {
    //   var isAppleAvailable = await SignInWithApple.isAvailable();
    //   if (isAppleAvailable) {
    //     final appleCredentials = await SignInWithApple.getAppleIDCredential(
    //       webAuthenticationOptions: WebAuthenticationOptions(
    //           clientId: AuthConfigStrings.appleClientId,
    //           redirectUri: Uri.parse(AuthConfigStrings.appleReturnUrl)
    //       ),
    //       scopes: [
    //         AppleIDAuthorizationScopes.email,
    //         AppleIDAuthorizationScopes.fullName,
    //       ],
    //     );
    //     final oAuthProvider = OAuthProvider(AuthConfigStrings.appleProvider);
    //     final credential = oAuthProvider.credential(
    //       idToken: appleCredentials.identityToken,
    //       accessToken: appleCredentials.authorizationCode,
    //     );
    //     await _instance.signInWithCredential(credential);
    //   }
    //   throw AuthenticationException(const AuthError.unknownError());
    // } on SignInWithAppleAuthorizationException catch(e) {
    //   if (e.code == AuthorizationErrorCode.canceled) {
    //     throw AuthenticationException(const AuthError.canceled());
    //   } else {
    //     throw AuthenticationException(const AuthError.unknownError());
    //   }
    // }
  }

  @override
  Future<void> signInSocial({required SocialType type}) async {
    if (type == SocialType.google) {
      await _signInGoogle();
    } else if (type == SocialType.facebook) {
      await _signInFacebook();
    } else if (type == SocialType.apple) {
      await _signInApple();
    }
  }

}