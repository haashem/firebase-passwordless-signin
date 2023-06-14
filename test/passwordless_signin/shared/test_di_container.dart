import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:passwordless_signin/auth/email_secure_store.dart';
import 'package:passwordless_signin/auth/models/sign_in_link_settings.dart';
import 'package:passwordless_signin/auth/passwordless_authenticator.dart';
import 'package:passwordless_signin/injection.dart';
import 'package:passwordless_signin/utilities/mailapp_launcher.dart';

import '../../auth/mocks/firebase_auth_spy.dart';

class MockFirebaseDynamicLinks extends Mock implements FirebaseDynamicLinks {}

class FakeEmailSecureStorage extends Fake implements EmailSecureStore {
  @override
  Future<String?> getEmail() async {
    return 'myId@email.com';
  }

  @override
  Future<void> setEmail(String email) async {}
}

class MailAppLauncherSpy extends Fake implements MailAppLauncher {
  int launchCount = 0;
  @override
  Future<void> launch() async {
    launchCount += 1;
  }
}

void setupTestDependencyConatiner() {
  final FirebaseAuthSpy firebaseAuth = FirebaseAuthSpy();
  final FirebaseDynamicLinks firebaseDynamicLinks = MockFirebaseDynamicLinks();
  final EmailSecureStore emailSecureStore = FakeEmailSecureStorage();
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
  getIt.registerFactory<MailAppLauncher>(
    () => MailAppLauncherSpy(),
  );
}
