import 'package:bdd_widget_test/step/i_wait.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iShouldSeeAnErrorAlert(WidgetTester tester) async {
  await iWait(tester);
  expect(
    find.byWidgetPredicate((widget) => widget is AlertDialog),
    findsOneWidget,
  );
}
