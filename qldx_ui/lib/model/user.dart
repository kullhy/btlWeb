class User {
  final String username;
  final String password;

  User({required this.username, required this.password});
  Map<String, dynamic> toJson() => {
        'email': username,
        'password': password,
      };
}