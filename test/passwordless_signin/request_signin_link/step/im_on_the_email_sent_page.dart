import 'package:bdd_widget_test/step/i_wait.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:passwordless_signin/routes/routes.dart';

import 'i_launch_the_app.dart';

Future<void> imOnTheEmailSentPage(WidgetTester tester) async {
  await iLaunchTheApp(tester);
  AppRouter.router.goNamed(Routes.emailSent.name);
  await iWait(tester);
}
