import 'package:flutter_test/flutter_test.dart';
import 'package:passwordless_signin/auth/passwordless_authenticator.dart';
import 'package:passwordless_signin/auth_provider_scope.dart';
import 'package:passwordless_signin/injection.dart';
import 'package:passwordless_signin/main.dart';

Future<void> launchTheApp(WidgetTester tester) async {
  await tester.pumpWidget(
    AuthProviderScope(
      authNotifier: AuthNotifier(
        getIt<PasswordlessAuthenticator>(),
      ),
      child: const MyApp(),
    ),
  );
}
