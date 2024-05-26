
class UserModel {
  final String firstName;
  final String lastName;
  final String organization;
  final String orgPosition;
  final String eMail;
  final String phoneNumber;
  final String information;
  final String role;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.organization,
    required this.orgPosition,
    required this.eMail,
    required this.phoneNumber,
    required this.information,
    required this.role
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      organization: json['organization'],
      orgPosition: json['org_position'],
      eMail: json['email'],
      phoneNumber: json['phone_number'],
      information: json['information'],
      role: json['role']
    );
  }
}

