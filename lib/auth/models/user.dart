// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String id;
  factory User(String id) {
    return User._(id);
  }
  User._(this.id);

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
