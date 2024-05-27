import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final prefs = SharedPreferences.getInstance();
    return Scaffold(
          appBar: AppBar(title: const Text('Вход')),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _loginController,
                  decoration: InputDecoration(
                      labelText: 'Имя пользователя',
                      labelStyle: Theme.of(context).textTheme.labelSmall
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      labelText: 'Пароль',
                      labelStyle: Theme.of(context).textTheme.labelSmall),
                  style: Theme.of(context).textTheme.labelSmall,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        final login = _loginController.text;
                        final password = _passwordController.text;
                        await Provider.of<AuthProvider>(context, listen: false)
                            .login(login, password);
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          shadowColor: Colors.grey,
                          elevation: 10.0
                      ),
                      child:Text('Войти', style: Theme.of(context).textTheme.bodyLarge),
                    ),
                    TextButton(
                      onPressed: () async {
                        await Provider.of<AuthProvider>(context, listen: false)
                            .registerGuest().whenComplete(
                            Navigator.of(context).pushNamed('/') as FutureOr<void> Function()
                        );

                      },
                      child: Text('Я гость',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ],
                )


              ],
            ),
          ),
        );
  }
}