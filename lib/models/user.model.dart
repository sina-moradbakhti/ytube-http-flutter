class User {
  final int id;
  final String fullname;
  final String username;
  final String avatar;

  User(
      {required this.id,
      required this.fullname,
      required this.avatar,
      required this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        fullname: json['fullname'],
        avatar: json['avatar'],
        username: json['username']);
  }
}
