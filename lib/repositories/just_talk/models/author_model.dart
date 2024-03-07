class AuthorModel {
  final String name;
  final String orgName;

  AuthorModel({
    required this.name,
    required this.orgName
  });

  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      name: json['name'],
      orgName: json['orgName'],
    );
  }
}