import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iSeeLoadingIndicator(WidgetTester tester) async {
  await tester.pump();
  expect(find.byType(CircularProgressIndicator), findsOneWidget);
}
