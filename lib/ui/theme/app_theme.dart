import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF382469),
      onPrimary: Colors.white,
      secondary: Color(0xFF8762FF),
      onSecondary: Colors.white,
      error: Colors.red,
      onError: Colors.white,
      background: Colors.white,
      onBackground: Colors.black,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Comfortaa",
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        color: Color(0xFF382469),
        fontWeight: FontWeight.bold,
        fontSize: 60.0,
      ),
      headlineMedium: TextStyle(
        color: Color(0xFF382469),
        fontWeight: FontWeight.bold,
        fontSize: 24.0,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 20.0,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 16.0,
      ),
      bodySmall: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
      ),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xFF382469),
      selectionHandleColor: Color(0xFF382469),
      selectionColor: Color(0x1F382469),
    ),
  );
}
