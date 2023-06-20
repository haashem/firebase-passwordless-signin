import 'package:bdd_widget_test/step/i_see_text.dart';
import 'package:bdd_widget_test/step/i_wait.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iShouldNavigateToTheEmailSentPage(WidgetTester tester) async {
  await iWait(tester);
  iSeeText(
    tester,
    "We sent an email to  with a magic link that'll log you in.",
  );
}
