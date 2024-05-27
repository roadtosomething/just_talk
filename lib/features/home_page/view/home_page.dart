import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_talk/features/login_page/login_page.dart';
import 'package:just_talk/features/login_page/logout_page/logout_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/auth_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prefs = SharedPreferences.getInstance();
    return Consumer<AuthProvider>(
        builder: (context,authProvider,child) {
          return authProvider.isLogged ?
          LogoutPage() : LoginPage();
        }
    );
  }
}