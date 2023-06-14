// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/clean_up.dart';
import './step/app_launches_with_valid_signin_link.dart';
import './step/a_loading_indicator_is_displayed.dart';
import './step/signin_verification_completes_successfully.dart';
import './step/i_should_sign_in_automatically.dart';
import './step/i_should_see_home_page.dart';
import './step/app_launches_with_invalid_signin_link.dart';
import './step/signin_verification_completes_with_failure.dart';
import './step/i_should_see_an_error_message.dart';
import './step/i_dissmiss_the_alert.dart';
import './step/i_should_see_email_page.dart';

void main() {
  group('''Passwordless signin''', () {
    Future<void> bddTearDown(WidgetTester tester) async {
      await cleanUp(tester);
    }
    testWidgets('''Successful sign-in using a sign-in link''', (tester) async {
      try {
        await appLaunchesWithValidSigninLink(tester);
        await aLoadingIndicatorIsDisplayed(tester);
        await signinVerificationCompletesSuccessfully(tester);
        await iShouldSignInAutomatically(tester);
        await iShouldSeeHomePage(tester);
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Failure sign-in using an invalid sign-in link''', (tester) async {
      try {
        await appLaunchesWithInvalidSigninLink(tester);
        await signinVerificationCompletesWithFailure(tester);
        await iShouldSeeAnErrorMessage(tester, "Couldn't sign in with the link");
        await iDissmissTheAlert(tester);
        await iShouldSeeEmailPage(tester);
      } finally {
        await bddTearDown(tester);
      }
    });
  });
}
