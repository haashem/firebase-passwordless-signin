import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iDissmissTheAlert(WidgetTester tester) async {
   await tester.tap(find.widgetWithText(TextButton, 'OK'));
}
