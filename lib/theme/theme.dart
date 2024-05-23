import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF84A295);
const Color primaryLightColor = Color(0xFFB7CDC2);
const Color backgroundLightColor = Color(0xFFEAE6DA);
const Color surfaceLightColor = Color(0xFFF7F6EE);
const Color secondaryLightColor = Color(0xFFEFDB96);

const Color primaryDarkColor = Color(0xFF263238);
const Color backgroundDarkColor = Color(0xFF121212);
const Color surfaceDarkColor = Color(0xFF1F1F1F);
const Color secondaryDarkColor = Color(0xFFBB86FC);
const Color errorColor = Color(0xB6C30025);

final lightTheme = ThemeData(

  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: primaryColor,
      onPrimary: primaryLightColor,
      secondary: secondaryLightColor,
      onSecondary: secondaryLightColor,
      error: errorColor,
      onError: errorColor,
      surface: surfaceLightColor,
      onSurface: surfaceLightColor

  ),

    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w700, color: primaryDarkColor),
      color: primaryLightColor
    ),

    buttonTheme: const ButtonThemeData(
      buttonColor: primaryLightColor,
      hoverColor: primaryColor,
    ),

    textTheme: const TextTheme(

      labelLarge: TextStyle(
        color: Colors.white60,
        fontWeight: FontWeight.w700,
        fontSize: 25,
      ),

      bodySmall: TextStyle(
        color: Colors.black54,
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),

      bodyLarge: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w700,
        fontSize: 25,
      ),

        bodyMedium: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),

        labelSmall: TextStyle(
          color: Colors.black38,
          fontWeight: FontWeight.w700,
          fontSize: 14,
        ),

    ),

);
