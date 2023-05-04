import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:passwordless_signin/auth/models/failure.dart';
import 'package:passwordless_signin/auth/models/sign_in_link_settings.dart';
import 'package:passwordless_signin/auth/models/user.dart';

class FirebaseAuthenticator {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthenticator(this._firebaseAuth);

  Future<Either<Failure, Unit>> sendSignInLinkToEmail(
    String email,
    SignInLinkSettings settings,
  ) async {
    try {
      final actionCodeSttings = ActionCodeSettings(
        url: settings.url,
        handleCodeInApp: true,
        androidInstallApp: true,
        androidPackageName: settings.androidPackageName,
        iOSBundleId: settings.iOSBundleId,
        dynamicLinkDomain: settings.dynamicLinkDomain,
      );
      await _firebaseAuth.sendSignInLinkToEmail(
        email: email,
        actionCodeSettings: actionCodeSttings,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(Failure.unexpectedError(e.message));
    } catch (e) {
      return left(Failure.unexpectedError());
    }
  }

  Future<Either<Failure, Unit>> signInWithEmailAndLink({
    required String email,
    required Uri link,
  }) async {
    // Confirm the link is a sign-in with email link.
    if (isSignInWithEmailLink(link)) {
      try {
        // The client SDK will parse the code from the link for you.
        await _firebaseAuth.signInWithEmailLink(
          email: email,
          emailLink: link.toString(),
        );
        return right(unit);
      } on FirebaseException catch (e) {
        return left(Failure.unexpectedError(e.message));
      } catch (e) {
        return left(
          Failure.unexpectedError(e.toString()),
        );
      }
    } else {
      return left(
        Failure.unexpectedError('Link is invalid'),
      );
    }
  }

  bool isSignInWithEmailLink(Uri link) {
    return _firebaseAuth.isSignInWithEmailLink(link.toString());
  }

  Option<User> getSignedInUser() =>
      optionOf(_firebaseAuth.currentUser?.toDomain());

  Stream<Option<User>> authStateChanges() {
    return _firebaseAuth
        .authStateChanges()
        .map((user) => optionOf(user?.toDomain()));
  }
}
