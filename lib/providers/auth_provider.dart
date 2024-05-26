import 'package:flutter/material.dart';
import 'package:just_talk/repositories/just_talk/models/register_model.dart';
import 'package:just_talk/repositories/just_talk/models/user_login_model.dart';
import 'package:just_talk/repositories/just_talk/models/user_model.dart';
import 'package:just_talk/services/login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class AuthProvider with ChangeNotifier {
  UserLoginModel? _user;
  UserModel? _userModel;
  final AuthService _authService = AuthService();

  UserLoginModel? get user => _user;
  bool get isLogged => _user != null;

  Future<void> login(String login, String password) async {
    UserLoginModel? user = await _authService.login(login, password);
    if (user != null) {
      _user = user;
      notifyListeners();
    }
    else{
      print("Login is wrong token is null");
    }
  }
  Future<void> register(RegisterModel regModel) async {
    UserModel? user = await _authService.register(regModel);
    print("Register user ${regModel.username}");
    if (user!=null){
      print("Register user ${regModel.username} done");
      login(regModel.username, regModel.password);
    }
  }

  Future<void> registerGuest() async{

    RegisterModel registerModel = RegisterModel(
        password: "93847236123",
        username: const Uuid().v1(),
        firstName: "Guest",
        lastName: "Guest",
        organization: "Guest",
        orgPosition: "Guest",
        eMail: "Guest",
        phoneNumber: "Guest",
        information: "Guest",
        role: "GUEST");
    print("Register user ${registerModel.username}");
    UserModel? user = await _authService.register(registerModel);
    if (user!=null){
      print("Register user ${registerModel.username} done");
      login(registerModel.username, registerModel.password);
    }
  }

  Future<void> logout() async {
    _user = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    String? token = await _authService.getToken();
    if (token != null) {
      _userModel = await _authService.getUserInfo(token);
      notifyListeners();
    }
  }
}