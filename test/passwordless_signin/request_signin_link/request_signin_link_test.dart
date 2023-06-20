// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import '../shared/sample_data.dart';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/i_launch_the_app.dart';
import './step/im_not_signed_in.dart';
import './step/i_see_email_page.dart';
import './step/im_on_the_email_page.dart';
import './step/i_enter_in_the_email_field.dart';
import './step/i_tap_the_button.dart';
import './step/i_see_loading_indicator.dart';
import './step/system_fails_to_sent_email_link.dart';
import './step/i_should_see_an_error_alert.dart';
import './step/loading_indicator_hides.dart';

void main() {
  group('''Request signin link''', () {
    testWidgets('''Not signed-in user is directed to the email page''', (tester) async {
      await iLaunchTheApp(tester);
      await imNotSignedIn(tester);
      await iSeeEmailPage(tester);
    });
    testWidgets('''On system failure to send sign in link, an error alert should be shown''', (tester) async {
      await imOnTheEmailPage(tester);
      await iEnterInTheEmailField(tester, validEmail);
      await iTapTheButton(tester, 'Sign in');
      await iSeeLoadingIndicator(tester);
      await systemFailsToSentEmailLink(tester);
      await iShouldSeeAnErrorAlert(tester);
      await loadingIndicatorHides(tester);
    });
  });
}
