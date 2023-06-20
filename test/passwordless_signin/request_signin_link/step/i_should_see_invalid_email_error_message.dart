import 'package:bdd_widget_test/step/i_see_text.dart';
import 'package:bdd_widget_test/step/i_wait.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iShouldSeeInvalidEmailErrorMessage(WidgetTester tester) async {
  await iWait(tester);
  await iSeeText(
    tester,
    'Enter valid email',
  );
}
