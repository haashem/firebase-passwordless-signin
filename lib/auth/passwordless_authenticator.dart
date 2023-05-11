import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:fpdart/fpdart.dart';
import 'package:passwordless_signin/auth/email_secure_store.dart';
import 'package:passwordless_signin/auth/models/failure.dart';
import 'package:passwordless_signin/auth/models/sign_in_link_settings.dart';

class PasswordlessAuthenticator {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final EmailSecureStore _emailSecureStore;
  final SignInLinkSettings _signinLinkSettings;

  PasswordlessAuthenticator(
    this._firebaseAuth,
    this._emailSecureStore,
    this._signinLinkSettings,
  );

  Future<Either<Failure, Unit>> sendSignInLinkToEmail(
    String email,
  ) async {
    try {
      final actionCodeSttings = firebase_auth.ActionCodeSettings(
        url: _signinLinkSettings.url,
        handleCodeInApp: true,
        androidInstallApp: true,
        androidPackageName: _signinLinkSettings.androidPackageName,
        iOSBundleId: _signinLinkSettings.iOSBundleId,
        dynamicLinkDomain: _signinLinkSettings.dynamicLinkDomain,
      );
      await _emailSecureStore.setEmail(email);
      await _firebaseAuth.sendSignInLinkToEmail(
        email: email,
        actionCodeSettings: actionCodeSttings,
      );
      return right(unit);
    } on firebase_auth.FirebaseAuthException catch (e) {
      return left(Failure.unexpectedError(e.message));
    } catch (e) {
      return left(Failure.unexpectedError());
    }
  }

  Future<Either<EmailLinkFailure, Unit>> signInWithEmailLink(Uri link) async {
    try {
      //check that user is not signed in
      final user = _firebaseAuth.currentUser;
      if (user != null) {
       return left(const EmailLinkFailure.userAlreadySignedIn());
      }
      // check that email is set
      final email = await _emailSecureStore.getEmail();
      if (email == null) {
        return left(const EmailLinkFailure.emailNotSet());
      } else if (_firebaseAuth.isSignInWithEmailLink(link.toString())) {
        await _firebaseAuth.signInWithEmailLink(
          email: email,
          emailLink: link.toString(),
        );
        return right(unit);
      } else {
        return left(const EmailLinkFailure.isNotSignInWithEmailLink());
      }
    } on firebase_auth.FirebaseAuthException catch (e) {
      return left(EmailLinkFailure.signInFailed(e.message));
    } catch (e) {
      return left(EmailLinkFailure.signInFailed(e.toString()));
    }
  }
}
