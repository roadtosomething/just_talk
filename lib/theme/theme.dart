import 'package:flutter/material.dart';

final lightTheme = ThemeData(
    dividerTheme: const DividerThemeData(
      space: 0,
      color: Color(0xFF4A544A),
    ),
    listTileTheme: const ListTileThemeData(
      tileColor: Color(0x88FFd96A),
      iconColor: Color(0xFF4A544A),
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
      backgroundColor: Colors.orange,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        color: Color(0xFF4A544A),
        fontWeight: FontWeight.w700,
        fontSize: 25,
      ),
        bodyMedium: TextStyle(
          color: Color(0xFF4A544A),
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
        labelSmall: TextStyle(
          color: Color(0xAA4A544A),
          fontWeight: FontWeight.w700,
          fontSize: 14,
        )
    ),
);
