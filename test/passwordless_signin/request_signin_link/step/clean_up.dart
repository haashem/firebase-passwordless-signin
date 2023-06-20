import 'package:flutter_test/flutter_test.dart';
import 'package:passwordless_signin/injection.dart';

Future<void> cleanUp(WidgetTester tester) async {
  await getIt.reset();
}
