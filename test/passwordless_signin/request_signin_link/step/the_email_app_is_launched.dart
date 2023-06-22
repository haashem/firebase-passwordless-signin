import 'package:flutter_test/flutter_test.dart';
import 'package:passwordless_signin/injection.dart';
import 'package:passwordless_signin/utilities/mailapp_launcher.dart';

import '../../shared/test_di_container.dart';

Future<void> theEmailAppIsLaunched(WidgetTester tester) async {
  (getIt<MailAppLauncher>() as MailAppLauncherSpy).launchCount = 1;
}
