// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import './step/i_launch_the_app.dart';
import './step/im_not_signed_in.dart';
import './step/i_see_email_page.dart';

void main() {
  group('''Request signin link''', () {
    testWidgets('''Not signed in user are directed to the email page''', (tester) async {
      await iLaunchTheApp(tester);
      await imNotSignedIn(tester);
      await iSeeEmailPage(tester);
    });
  });
}
