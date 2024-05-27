import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_talk/repositories/just_talk/models/user_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/auth_provider.dart';

class LogoutPage extends StatefulWidget {
  @override
  _LogoutPageState createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {

  final authProvider = AuthProvider();

  @override
  Widget build(BuildContext context) {
    final prefs = SharedPreferences.getInstance();
    return Scaffold(
            appBar: AppBar(title: const Text('Вход')),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  FutureBuilder<UserModel?>(
                      future: authProvider.getUserInfo(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text(
                            'Ошибка: ${snapshot.error}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          );
                        } else if (snapshot.hasData && snapshot.data!=null){
                          return Text(
                            'Вы авторизованы под именем: ${snapshot.data!.firstName}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          );
                        } else {
                          return Text(
                            'Пользователь не найден: ${snapshot.data!.firstName}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          );
                        }
                      }
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await Provider.of<AuthProvider>(context, listen: false)
                          .logout();
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        shadowColor: Colors.grey,
                        elevation: 10.0
                    ),
                    child:Text('Выйти', style: Theme.of(context).textTheme.bodyLarge),
                  ),
                ],
              ),
            ),
          );
  }
}