import 'package:flutter/material.dart';

const kHistoryColor = Color(0xFF545F61);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Color(0xFF292D32),
    primary: Color(0xFF21252A),
    secondary: Color.fromARGB(255, 30, 34, 39),
    tertiary: Color(0xFFECECEC),
  ),
  iconTheme: IconThemeData(color: Colors.white),
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
      background: Color(0xFFECECEC),
      primary: Color(0xFFC5C5C5),
      secondary: Colors.grey,
      tertiary: Color(0xFF292D32)),
  iconTheme: IconThemeData(
    color: Color(0xFF131321),
  ),
);
