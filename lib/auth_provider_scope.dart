import 'package:flutter/widgets.dart';

import 'package:passwordless_signin/auth/firebase_authenticator.dart';
import 'package:passwordless_signin/auth/firebase_email_link_handler.dart';

/// A scope that provides [FirebaseAuthenticator] for the subtree.
class AuthProviderScope extends InheritedNotifier<AuthNotifier> {
  const AuthProviderScope({
    super.key,
    required super.child,
    required AuthNotifier authNotifier,
  }) : super(notifier: authNotifier);

  /// Gets the [FirebaseAuthenticator].
  static AuthNotifier of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AuthProviderScope>()!
        .notifier!;
  }
}

/// A class that converts [FirebaseAuthenticator] into a [ChangeNotifier].
class AuthNotifier extends ChangeNotifier {
  final FirebaseAuthenticator _auth;
  final FirebaseEmailLinkHandler _dynamicLinkHandler;
  bool isSignedIn = false;
  bool isSigninWithPasswordLessLinkInProgress = false;
  AuthNotifier(this._auth, this._dynamicLinkHandler) {
    _auth.authStateChanges().listen((user) {
      isSignedIn = user.isSome();
      notifyListeners();
    });

    _dynamicLinkHandler.isLoading.addListener(() {
      isSigninWithPasswordLessLinkInProgress =
          _dynamicLinkHandler.isLoading.value;
      notifyListeners();
    });
  }
}
