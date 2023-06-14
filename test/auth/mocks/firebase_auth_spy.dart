import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rxdart/subjects.dart';

class FakeUserCredentials extends Fake implements UserCredential {
  @override
  User? get user => FakeUser();
}

class FakeUser extends Fake implements User {
  @override
  String get uid => '1';
}

class FirebaseAuthSpy extends Mock implements FirebaseAuth {
  List<(String, ActionCodeSettings)> sendSignInLinkMessages = [];
  List<(String, String)> signInMessages = [];
  bool signoutCalled = false;
  Completer<void> sendSigninLinkCompleter = Completer<void>();
  Completer<UserCredential> signInWithEmailLinkCompleter =
      Completer<UserCredential>();
  BehaviorSubject<User?> userController = BehaviorSubject();

  @override
  Future<void> sendSignInLinkToEmail({
    required String email,
    required ActionCodeSettings actionCodeSettings,
  }) async {
    sendSignInLinkMessages.add((email, actionCodeSettings));
    return sendSigninLinkCompleter.future;
  }

  void completeSendLinkWithSuccess([int index = 0]) {
    sendSigninLinkCompleter.complete();
  }

  void completeSendLinkWithFailure(Exception error, [int index = 0]) {
    sendSigninLinkCompleter.completeError(error);
  }

  @override
  Future<UserCredential> signInWithEmailLink({
    required String email,
    required String emailLink,
  }) async {
    signInMessages.add((email, emailLink));
    return signInWithEmailLinkCompleter.future;
  }

  void completeSigninWithLinkWithSuccess([int index = 0]) {
    final UserCredential userCredential = FakeUserCredentials();
    userController.add(userCredential.user);
    signInWithEmailLinkCompleter.complete(userCredential);
  }

  void completeSigninWithLinkWithFailure(Exception error, [int index = 0]) {
    signInWithEmailLinkCompleter.completeError(error);
  }

  @override
  Future<void> signOut() async {
    signoutCalled = true;
    userController.add(null);
  }

  @override
  Stream<User?> authStateChanges() => userController.stream;
}
