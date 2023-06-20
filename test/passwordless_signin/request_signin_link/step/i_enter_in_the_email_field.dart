import 'package:bdd_widget_test/step/i_enter_into_input_field.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> iEnterInTheEmailField(WidgetTester tester, String email) async {
  await iEnterIntoInputField(tester, email, 0);
}
