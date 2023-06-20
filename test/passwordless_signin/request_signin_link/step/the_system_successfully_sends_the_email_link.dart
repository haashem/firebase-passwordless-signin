import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:passwordless_signin/injection.dart';

import '../../../auth/mocks/firebase_auth_spy.dart';

Future<void> theSystemSuccessfullySendsTheEmailLink(WidgetTester tester) async {
  (getIt<FirebaseAuth>() as FirebaseAuthSpy).completeSendLinkWithSuccess();
}
