import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:passwordless_signin/auth/email_secure_store.dart';
import 'package:passwordless_signin/auth/models/sign_in_link_settings.dart';
import 'package:passwordless_signin/auth/passwordless_authenticator.dart';
import 'package:passwordless_signin/auth_provider_scope.dart';
import 'package:passwordless_signin/injection.dart';
import 'package:passwordless_signin/main.dart';

import '../../auth/mocks/firebase_auth_spy.dart';

class MockFirebaseDynamicLinks extends Mock implements FirebaseDynamicLinks {}

class MockEmailSecureStorage extends Fake implements EmailSecureStore {
  @override
  Future<String?> getEmail() async {
    return 'myId@email.com';
  }
}

Future<void> appLaunchesWithValidSigninLink(WidgetTester tester) async {
  _setupDependencyConatiner();
  _setupMockBehavior();

  getIt<PasswordlessAuthenticator>().checkEmailLink();

  await tester.pumpWidget(
    AuthProviderScope(
      authNotifier: AuthNotifier(
        getIt<PasswordlessAuthenticator>(),
      ),
      child: const MyApp(),
    ),
  );
}

void _setupDependencyConatiner() {
  final FirebaseAuthSpy firebaseAuth = FirebaseAuthSpy();
  final FirebaseDynamicLinks firebaseDynamicLinks = MockFirebaseDynamicLinks();
  final EmailSecureStore emailSecureStore = MockEmailSecureStorage();
  final signinLinkSettings = SignInLinkSettings(
    url: 'https://a-url.com',
    androidPackageName: 'com.name.android',
    iOSBundleId: 'com.name.ios',
    dynamicLinkDomain: 'subdomian.page.link',
  );
  final PasswordlessAuthenticator authenticator = PasswordlessAuthenticator(
    firebaseAuth,
    firebaseDynamicLinks,
    emailSecureStore,
    signinLinkSettings,
  );

  getIt.registerLazySingleton<PasswordlessAuthenticator>(
    () => authenticator,
  );
  getIt.registerLazySingleton<EmailSecureStore>(
    () => emailSecureStore,
  );
  getIt.registerLazySingleton<FirebaseDynamicLinks>(
    () => firebaseDynamicLinks,
  );
  getIt.registerLazySingleton<FirebaseAuth>(
    () => firebaseAuth,
  );
}

void _setupMockBehavior() {
  final signinLink = Uri.https('sigin-link.com');

  when(() => getIt<FirebaseDynamicLinks>().onLink).thenAnswer(
    (_) => StreamController<PendingDynamicLinkData>().stream,
  );
  when(() => getIt<FirebaseDynamicLinks>().getInitialLink())
      .thenAnswer((_) async => PendingDynamicLinkData(link: signinLink));

  when(() => getIt<FirebaseAuth>().currentUser).thenReturn(null);
  when(() => getIt<FirebaseAuth>().isSignInWithEmailLink(signinLink.toString()))
      .thenReturn(true);
}
