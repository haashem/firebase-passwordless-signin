import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:passwordless_signin/auth/email_secure_store.dart';
import 'package:passwordless_signin/auth/models/sign_in_link_settings.dart';
import 'package:passwordless_signin/auth/passwordless_authenticator.dart';
import 'package:passwordless_signin/utilities/mailapp_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

final GetIt getIt = GetIt.instance;
Future<void> configureInjection() async {
  await Firebase.initializeApp();

  final packageInfo = await PackageInfo.fromPlatform();
  const emailStore = EmailSecureStore(FlutterSecureStorage());
  final authenticator = PasswordlessAuthenticator(
    FirebaseAuth.instance,
    FirebaseDynamicLinks.instance,
    emailStore,
    SignInLinkSettings(
      url: 'https://one-menu-a58ad.firebaseapp.com',
      androidPackageName: packageInfo.packageName,
      iOSBundleId: packageInfo.packageName,
      dynamicLinkDomain: 'onemenu2.page.link',
    ),
  )..checkEmailLink();

  // Register PasswordlessAuthenticator
  getIt.registerLazySingleton<PasswordlessAuthenticator>(
    () => authenticator,
  );
  getIt.registerFactory<MailAppLauncher>(
    () => MailAppLauncher(
      platform: defaultTargetPlatform,
      urlLauncher: launchUrl,
    ),
  );
}
