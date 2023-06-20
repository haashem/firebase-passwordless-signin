import 'package:flutter_test/flutter_test.dart';
import 'package:passwordless_signin/passwordless_signin/widgets/primary_button.dart';

Future<void> iTapTheButton(WidgetTester tester, String buttonTitle) async {
  await tester.tap(find.widgetWithText(PrimaryButton, buttonTitle));
}
