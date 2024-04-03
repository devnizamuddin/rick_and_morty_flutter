import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData _themeData = ThemeData(
      useMaterial3: true,
      colorScheme: _colorScheme,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff191D29),
        unselectedItemColor: Colors.white,
      ));
  ThemeData get themeData => _themeData;

  static const ColorScheme _colorScheme = ColorScheme.light(
    primary: Color(0xff9DFE00),
    secondary: Color(0xff13D9E5),
  );
}
