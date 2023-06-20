import 'package:flutter_test/flutter_test.dart';

Future<void> iSeeEmailPage(WidgetTester tester) async {
  expect(
    find.text(
      'Log in without a password!',
    ),
    findsOneWidget,
  );
}
