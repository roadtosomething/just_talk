import 'package:flutter/material.dart';
import 'package:just_talk/features/login_page/login_page.dart';
import 'package:just_talk/features/main_page/main_page.dart';
import 'package:just_talk/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class JustTalkApp extends StatelessWidget {
  const JustTalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> AuthProvider()..checkAuthStatus(),
      child: MaterialApp(
        title: 'Just talk',
        theme: lightTheme,
        routes: routes,
      )
    );
  }
}