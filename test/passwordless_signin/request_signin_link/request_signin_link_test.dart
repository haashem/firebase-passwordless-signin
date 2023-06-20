// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import '../shared/sample_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/clean_up.dart';
import './step/i_launch_the_app.dart';
import './step/im_not_signed_in.dart';
import './step/i_see_email_page.dart';
import './step/im_on_the_email_page.dart';
import './step/i_enter_in_the_email_field.dart';
import './step/i_tap_the_button.dart';
import './step/i_see_loading_indicator.dart';
import './step/i_should_see_invalid_email_error_message.dart';
import './step/system_fails_to_sent_email_link.dart';
import './step/i_should_see_an_error_alert.dart';
import './step/loading_indicator_hides.dart';
import './step/i_should_be_able_to_retry.dart';

void main() {
  group('''Request signin link''', () {
    Future<void> bddTearDown(WidgetTester tester) async {
      await cleanUp(tester);
    }
    testWidgets('''Not signed-in user is directed to the email page''', (tester) async {
      try {
        await iLaunchTheApp(tester);
        await imNotSignedIn(tester);
        await iSeeEmailPage(tester);
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''Email should be validated''', (tester) async {
      try {
        await imOnTheEmailPage(tester);
        await iEnterInTheEmailField(tester, 'invalidEmail');
        await iTapTheButton(tester, 'Sign in');
        await iShouldSeeInvalidEmailErrorMessage(tester);
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''On system failure to send sign in link, an error alert should be shown''', (tester) async {
      try {
        await imOnTheEmailPage(tester);
        await iEnterInTheEmailField(tester, validEmail);
        await iTapTheButton(tester, 'Sign in');
        await iSeeLoadingIndicator(tester);
        await systemFailsToSentEmailLink(tester);
        await iShouldSeeAnErrorAlert(tester);
      await loadingIndicatorHides(tester);
      } finally {
        await bddTearDown(tester);
      }
    });
    testWidgets('''On system failure to send sign in link, user shoule be able to retry''', (tester) async {
      try {
        await imOnTheEmailPage(tester);
        await iEnterInTheEmailField(tester, validEmail);
        await iTapTheButton(tester, 'Sign in');
        await systemFailsToSentEmailLink(tester);
        await iShouldBeAbleToRetry(tester);
      } finally {
        await bddTearDown(tester);
      }
    });
  });
}
