import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iShouldSeeAnErrorMessage(
  WidgetTester tester,
  String message,
) async {
  await tester.pump();
  expect(find.widgetWithText(AlertDialog, message), findsOneWidget);
}
