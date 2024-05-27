import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:just_talk/repositories/just_talk/models/register_model.dart';
import 'package:just_talk/repositories/just_talk/models/user_login_model.dart';
import 'package:just_talk/repositories/just_talk/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String apiUrl = 'http://192.168.50.193:8083/api/v1/auth';

  Future<UserModel?> register(RegisterModel regModel) async {
    Map<String,dynamic> body ={
      "username": regModel.username,
      "password": regModel.password,
      "first_name": regModel.firstName,
      "last_name": regModel.lastName,
      "organization": regModel.organization,
      "org_position": regModel.orgPosition,
      "email": regModel.eMail,
      "phone_number": regModel.phoneNumber,
      "information": regModel.information,
      "role": regModel.role
    };

    if (kDebugMode) {
      print("Request body ${body.toString()}");
    }
    final response = await Dio().post('$apiUrl/register', data: body);

    if (kDebugMode) {
      print("Response ${response.toString()}");
    }
    if (response.statusCode == 200) {
      UserModel user = UserModel.fromJson(response. data);
      return user;
    } else {
      throw Exception('Failed registration');
    }
  }

  Future<UserLoginModel?> login(login, password) async {
    Map<String, String> body = {
      "username": login.toString(),
      "password": password.toString()
    };

    final response = await Dio().post('$apiUrl/login', data: body);

    if (response.statusCode == 200) {
      UserLoginModel user = UserLoginModel.fromJson(response. data);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', user.token);
      return user;
    } else {
      throw Exception('Failed authorization with login/pass');
    }
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }


  Future<UserModel?> getUserInfo(token) async{
    final headers = {
      'Authorization': 'Bearer $token'
    };

    final response = await Dio().get('$apiUrl/info',
    options: Options(
        headers: headers
    )
    );

    if (response.statusCode==200) {
      return UserModel.fromJson(response.data);
    }
    else {
      print("Failed to load user info");
      throw Exception('Failed to load user info');
    }
  }
}