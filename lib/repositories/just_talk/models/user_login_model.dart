class UserLoginModel {
  final String token;

  UserLoginModel({
    required this.token,
  });

  factory UserLoginModel.fromJson(Map<String, dynamic> json) {
    return UserLoginModel(
      token: json['token'],
    );
  }
}