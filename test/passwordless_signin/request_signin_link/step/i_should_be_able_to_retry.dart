import 'package:bdd_widget_test/step/i_wait.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:passwordless_signin/injection.dart';

import '../../../auth/mocks/firebase_auth_spy.dart';
import 'i_tap_the_button.dart';

Future<void> iShouldBeAbleToRetry(WidgetTester tester) async {
  await iWait(tester);
  await tester.tap(find.widgetWithText(TextButton, 'OK'));
  await iWait(tester);
  await iTapTheButton(tester, 'Sign in');
  expect((getIt<FirebaseAuth>() as FirebaseAuthSpy).sendSignInLinkMessages.length, 2);
}
