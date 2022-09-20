import 'package:flutter/material.dart';

class AppTheme {
  static const double _elevation = 2;

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.grey.shade800,
    appBarTheme: AppBarTheme(
      color: Colors.grey.shade800,
      elevation: _elevation,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.grey.shade800,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: _elevation,
      backgroundColor: Colors.grey.shade800,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.grey.shade800,
        elevation: _elevation,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle(
        color: Colors.grey.shade800,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.grey.shade800,
    appBarTheme: lightTheme.appBarTheme,
    scaffoldBackgroundColor: Colors.black,
    textButtonTheme: lightTheme.textButtonTheme,
    floatingActionButtonTheme: lightTheme.floatingActionButtonTheme,
    elevatedButtonTheme: lightTheme.elevatedButtonTheme,
  );
}
