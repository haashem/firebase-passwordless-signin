import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:passwordless_signin/auth/passwordless_authenticator.dart';
import 'package:passwordless_signin/auth_provider_scope.dart';
import 'package:passwordless_signin/injection.dart';
import 'package:passwordless_signin/main.dart';

import '../shared/test_di_container.dart';

Future<void> appLaunchesWithInvalidSigninLink(WidgetTester tester) async {
  setupTestDependencyConatiner();
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
