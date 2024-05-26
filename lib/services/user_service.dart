import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:just_talk/repositories/just_talk/models/user_model.dart';

class ApiService {
  static const String apiUrl = 'http://192.168.50.4:8083/api/v1/auth/info';

  Future<UserModel> fetchUserInfo() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user info');
    }
  }
}