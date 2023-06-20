import 'package:bdd_widget_test/step/i_wait.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iTapTheBackButton(WidgetTester tester) async {
  await tester.tap(find.widgetWithIcon(IconButton, Icons.arrow_back));
  await iWait(tester);
}
