// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/app_launches_with_valid_signin_link.dart';
import './step/a_loading_indicator_is_displayed.dart';
import './step/signin_verification_completes_successfully.dart';
import './step/i_should_sign_in_automatically.dart';
import './step/i_should_see_home_page.dart';

void main() {
  group('''Passwordless signin''', () {
    testWidgets('''Successful sign-in using a sign-in link''', (tester) async {
      await appLaunchesWithValidSigninLink(tester);
      await aLoadingIndicatorIsDisplayed(tester);
      await signinVerificationCompletesSuccessfully(tester);
      await iShouldSignInAutomatically(tester);
      await iShouldSeeHomePage(tester);
    });
  });
}
