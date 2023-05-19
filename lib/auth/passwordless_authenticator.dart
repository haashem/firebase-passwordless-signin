import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:fpdart/fpdart.dart';
import 'package:passwordless_signin/auth/email_secure_store.dart';
import 'package:passwordless_signin/auth/models/failure.dart';
import 'package:passwordless_signin/auth/models/sign_in_link_settings.dart';
import 'package:passwordless_signin/auth/models/user.dart';

class PasswordlessAuthenticator {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseDynamicLinks _firebaseDynamicLinks;
  final EmailSecureStore _emailSecureStore;
  final SignInLinkSettings _signinLinkSettings;
  void Function(EmailLinkFailure value)? onSigninFailure;

  PasswordlessAuthenticator(
    this._firebaseAuth,
    this._firebaseDynamicLinks,
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

  /// Sets up listeners to process all links from [FirebaseDynamicLinks.instance.getInitialLink()] and [FirebaseDynamicLinks.instance.onLink]
  Future<void> checkEmailLink() async {
    // Listen to incoming links when the app is open
    _firebaseDynamicLinks.onLink.listen(
      (event) async {
        final result = await signInWithEmailLink(event.link);
        result.fold((failure) => onSigninFailure?.call(failure), (_) => null);
      },
      onError: _handleLinkError,
    );

    try {
      // Check dynamic link once on app startup.
      // This is required to process any dynamic links that are opened when the app was closed
      final linkData = await _firebaseDynamicLinks.getInitialLink();
      final link = linkData?.link.toString();
      if (link != null) {
        signInWithEmailLink(linkData!.link);
      }
    } catch (e) {
      _handleLinkError(e);
    }
  }

  void _handleLinkError(Object error) {
    onSigninFailure?.call(EmailLinkFailure.linkError(error.toString()));
  }

  Stream<Option<User>> authStateChanges() {
    return _firebaseAuth
        .authStateChanges()
        .map((user) => optionOf(user?.toDomain()));
  }

  Future<void> signout() => _firebaseAuth.signOut();
}

extension FirebaseUserDomain on firebase_auth.User {
  User toDomain() {
    return User(uid);
  }
}
