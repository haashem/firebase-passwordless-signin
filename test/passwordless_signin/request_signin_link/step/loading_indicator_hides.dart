import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> loadingIndicatorHides(WidgetTester tester) async {
  expect(find.byType(CircularProgressIndicator), findsNothing);
}
