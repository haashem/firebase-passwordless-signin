import 'package:bdd_widget_test/step/i_wait.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iShouldSeeEmailPage(WidgetTester tester) async {
  await iWait(tester);
  expect(
    find.text(
      'Log in without a password!',
    ),
    findsOneWidget,
  );
}
