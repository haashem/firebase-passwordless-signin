import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:passwordless_signin/auth/models/failure.dart';

import 'package:passwordless_signin/auth/passwordless_authenticator.dart';

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
  final PasswordlessAuthenticator _auth;
  bool isSignedIn = false;
  bool isSigninInProgress = false;
  ValueChanged<EmailLinkFailure>? onError;

  bool _alertIsPresented = false;
  set alertIsPresented(bool value) {
    _alertIsPresented = value;
    notifyListeners();
  }

  bool get alertIsPresented {
    return _alertIsPresented;
  }

  StreamSubscription? _isLoadingSubscription;
  AuthNotifier(
    this._auth,
  ) {
    _auth.authStateChanges().listen((user) {
      isSignedIn = user.isSome();
      notifyListeners();
    });

    _isLoadingSubscription = _auth.isLoading.listen((newValue) {
      if (newValue != isSigninInProgress) {
        isSigninInProgress = newValue;
        notifyListeners();
      }
    });

    _auth.onSigninFailure = (value){
      onError?.call(value);
    };
  }

  @override
  void dispose() {
    _isLoadingSubscription?.cancel();
    super.dispose();
  }
}
