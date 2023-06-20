import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:passwordless_signin/injection.dart';

Future<void> imNotSignedIn(WidgetTester tester) async {
  getIt<FirebaseAuth>().signOut();
}
