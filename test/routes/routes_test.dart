import 'dart:async';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:passwordless_signin/auth/email_secure_store.dart';
import 'package:passwordless_signin/auth/models/sign_in_link_settings.dart';
import 'package:passwordless_signin/auth/passwordless_authenticator.dart';
import 'package:passwordless_signin/auth_provider_scope.dart';
import 'package:passwordless_signin/injection.dart';
import 'package:passwordless_signin/main.dart';
import 'package:passwordless_signin/utilities/mailapp_launcher.dart';

import '../auth/mocks/firebase_auth_spy.dart';

class MockFirebaseDynamicLinks extends Mock implements FirebaseDynamicLinks {}

class FakeEmailSecureStorage extends Fake implements EmailSecureStore {
  @override
  Future<String?> getEmail() async {
    return 'myId@email.com';
  }
}

class FakeMailAppLauncher extends Fake implements MailAppLauncher {
  @override
  Future<void> launch() async {}
}

void main() {
  late FirebaseAuthSpy firebaseAuth;
  late FirebaseDynamicLinks firebaseDynamicLinks;
  late EmailSecureStore emailSecureStore;
  late PasswordlessAuthenticator sut;

  final signinLinkSettings = SignInLinkSettings(
    url: 'https://a-url.com',
    androidPackageName: 'com.name.android',
    iOSBundleId: 'com.name.ios',
    dynamicLinkDomain: 'subdomian.page.link',
  );

  setUp(() {
    firebaseAuth = FirebaseAuthSpy();
    firebaseDynamicLinks = MockFirebaseDynamicLinks();
    emailSecureStore = FakeEmailSecureStorage();

    sut = PasswordlessAuthenticator(
      firebaseAuth,
      firebaseDynamicLinks,
      emailSecureStore,
      signinLinkSettings,
    );

    getIt.registerLazySingleton<PasswordlessAuthenticator>(
      () => sut,
    );
    getIt.registerLazySingleton<MailAppLauncher>(() => FakeMailAppLauncher());
  });

  tearDown(() {
    getIt.reset();
  });

  group('Redirect', () {
    testWidgets('Routes to Sign-in page when user is not signed-in',
        (tester) async {
      await tester.pumpWidget(
        AuthProviderScope(
          authNotifier: AuthNotifier(
            sut,
          ),
          child: const MyApp(),
        ),
      );
      expect(
        find.text(
          'Log in without a password!',
        ),
        findsOneWidget,
      );
    });

    testWidgets('Routes to verification page when sign-in is in progress',
        (tester) async {
      final signinLink = Uri.https('sigin-link.com');

      when(() => firebaseDynamicLinks.onLink).thenAnswer(
        (_) => StreamController<PendingDynamicLinkData>().stream,
      );
      when(() => firebaseDynamicLinks.getInitialLink())
          .thenAnswer((_) async => PendingDynamicLinkData(link: signinLink));

      when(() => firebaseAuth.currentUser).thenReturn(null);
      when(() => firebaseAuth.isSignInWithEmailLink(signinLink.toString()))
          .thenReturn(true);

      sut.checkEmailLink();

      await tester.pumpWidget(
        AuthProviderScope(
          authNotifier: AuthNotifier(
            sut,
          ),
          child: const MyApp(),
        ),
      );
      await tester.pump();

      expect(
        find.byType(CircularProgressIndicator),
        findsOneWidget,
      );
    });

    testWidgets('Routes to Home page when user is signed-in', (tester) async {
      firebaseAuth.completeSigninWithLinkWithSuccess();

      await tester.pumpWidget(
        AuthProviderScope(
          authNotifier: AuthNotifier(
            sut,
          ),
          child: const MyApp(),
        ),
      );
      expect(
        find.text(
          'Welcome!',
        ),
        findsOneWidget,
      );
    });
  });
}
