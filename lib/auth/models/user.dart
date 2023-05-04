import 'package:firebase_auth/firebase_auth.dart' as firebase;

class User {
  final String id;
  factory User(String id) {
    return User._(id);
  }
  User._(this.id);
}

extension FirebaseUserDomain on firebase.User {
  User toDomain() {
    return User(uid);
  }
}
