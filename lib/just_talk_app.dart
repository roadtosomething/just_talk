import 'package:flutter/material.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class JustTalkApp extends StatelessWidget {
  const JustTalkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Just talk',
      theme: lightTheme,
      routes: routes,
    );
  }
}