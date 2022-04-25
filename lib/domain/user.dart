
class User {
  String username;
  String password;
  String picurl;

  User(this.username, this.password, this.picurl);

  User.fromJson(Map<String, dynamic> json) : this(
      json['username'], json['password'], json['picurl']
  );

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
      "picurl": picurl
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          username == other.username;

  @override
  int get hashCode => username.hashCode;
}