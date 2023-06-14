import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:passwordless_signin/auth/models/user.dart';
import 'package:passwordless_signin/auth/passwordless_authenticator.dart';
import 'package:passwordless_signin/injection.dart';

Future<void> iShouldSignInAutomatically(WidgetTester tester) async {
  expect(
    getIt<PasswordlessAuthenticator>().authStateChanges(),
    emits(Some(User('1'))),
  );
}
