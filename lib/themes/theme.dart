import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Color(0xFF131321),
    primary: Color(0xFFE6EDFF),
    secondary: Colors.grey,
    tertiary: Color(0xFF1E1E2A),
  ),
  iconTheme: IconThemeData(color: Colors.white),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF131321),
    selectedItemColor: Color(0xFFE1E9F0),
    unselectedItemColor: Colors.grey,
  ),
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      background: Color(0xFFE6EDFF),
      primary: Color(0xFF131321),
      secondary: Colors.grey,
      tertiary: Color(0xFFDCE2FA)),
  iconTheme: IconThemeData(
    color: Color(0xFF131321),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFE1E9F0),
    selectedItemColor: Color(0xFF131321),
    unselectedItemColor: Colors.grey,
  ),
);
