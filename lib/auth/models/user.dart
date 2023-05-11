class User {
  final String id;
  factory User(String id) {
    return User._(id);
  }
  User._(this.id);
}
