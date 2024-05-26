import 'package:just_talk/repositories/just_talk/models/user_model.dart';

class RegisterModel {
  final String password;
  final String username;
  final String firstName;
  final String lastName;
  final String organization;
  final String orgPosition;
  final String eMail;
  final String phoneNumber;
  final String information;
  final String role;

  RegisterModel({
    required this.password,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.organization,
    required this.orgPosition,
    required this.eMail,
    required this.phoneNumber,
    required this.information,
    required this.role
    });


  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
        password: json['password'],
        username: json['username'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        organization: json['organization'],
        orgPosition: json['org_position'],
        eMail: json['eMail'],
        phoneNumber: json['phone_number'],
        information: json['information'],
        role: json['role']
    );
  }
}