import 'package:calculator/homepage.dart';
import 'package:calculator/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: HomePage(
        title: 'Calculator',
      ),
    );
  }
}
