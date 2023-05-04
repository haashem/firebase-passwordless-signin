import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:passwordless_signin/auth/email_secure_store.dart';
import 'package:passwordless_signin/auth/firebase_authenticator.dart';
import 'package:passwordless_signin/auth/models/failure.dart';

class FirebaseEmailLinkHandler {
  final FirebaseAuthenticator _auth;
  final FirebaseDynamicLinks firebaseDynamicLinks;
  final EmailSecureStore _emailStore;

  StreamSubscription? _onLinkSubscription;

  FirebaseEmailLinkHandler({
    required FirebaseAuthenticator auth,
    required EmailSecureStore emailStore,
    required this.firebaseDynamicLinks,
  })  : _auth = auth,
        _emailStore = emailStore;

  /// Clients can listen to this stream and show error alerts when dynamic link processing fails
  final StreamController<EmailLinkFailure> _errorController =
      StreamController<EmailLinkFailure>();
  Stream<EmailLinkFailure> get errorStream => _errorController.stream;

  /// Clients can listen to this stream and show a loading indicator while sign in is in progress
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  /// Sets up listeners to process all links from [FirebaseDynamicLinks.instance.getInitialLink()] and [FirebaseDynamicLinks.instance.onLink]
  Future<void> checkEmailLink() async {
    // Listen to incoming links when the app is open
    _onLinkSubscription = firebaseDynamicLinks.onLink.listen(
      (event) {
        _processDynamicLink(event.link);
      },
      onError: _handleLinkError,
    );

    try {
      // Check dynamic link once on app startup.
      // This is required to process any dynamic links that are opened when the app was closed
      final linkData = await firebaseDynamicLinks.getInitialLink();
      final link = linkData?.link.toString();
      if (link != null) {
        await _processDynamicLink(linkData!.link);
      }
    } catch (e) {
      _handleLinkError(e);
    }
  }

  void _handleLinkError(Object error) {
    _errorController.add(EmailLinkFailure.linkError(error.toString()));
  }

  Future<void> _processDynamicLink(Uri deepLink) async {
    return _signInWithEmail(deepLink);
  }

  Future<void> _signInWithEmail(Uri link) async {
    try {
      isLoading.value = true;
      // check that user is not signed in
      final user = _auth.getSignedInUser();
      if (user.isSome()) {
        _errorController.add(const EmailLinkFailure.userAlreadySignedIn());
        return;
      }
      // check that email is set
      final email = await _emailStore.getEmail();
      if (email == null) {
        _errorController.add(const EmailLinkFailure.emailNotSet());
        return;
      }
      // sign in
      if (_auth.isSignInWithEmailLink(link)) {
        await _auth.signInWithEmailAndLink(email: email, link: link);
      } else {
        _errorController.add(const EmailLinkFailure.isNotSignInWithEmailLink());
      }
    } on PlatformException catch (e) {
      _errorController.add(EmailLinkFailure.signInFailed(e.message));
    } finally {
      isLoading.value = false;
    }
  }

  void dispose() {
    _errorController.close();
    isLoading.dispose();
    _onLinkSubscription?.cancel();
  }
}
