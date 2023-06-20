import 'package:flutter_test/flutter_test.dart';

import '../../shared/launch_the_app.dart';
import '../../shared/test_di_container.dart';

Future<void> iLaunchTheApp(WidgetTester tester) async {
  setupTestDependencyConatiner();
  await launchTheApp(tester);
}
