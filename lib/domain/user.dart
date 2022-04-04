
class User {
  String username;
  String password;
  String picurl;

  User(this.username, this.password, this.picurl);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          username == other.username;

  @override
  int get hashCode => username.hashCode;
}