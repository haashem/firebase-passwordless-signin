import 'package:flutter_test/flutter_test.dart';

import 'i_launch_the_app.dart';
import 'im_not_signed_in.dart';

Future<void> imOnTheEmailPage(WidgetTester tester) async {
  await iLaunchTheApp(tester);
  await imNotSignedIn(tester);
}
