import 'package:flutter_test/flutter_test.dart';

Future<void> iShouldSeeHomePage(WidgetTester tester) async {
  await tester.pumpAndSettle();
  expect(
    find.text(
      'Welcome!',
    ),
    findsOneWidget,
  );
}
