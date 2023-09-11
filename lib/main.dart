import 'package:calculator/bmi/Screens/input_page.dart';
import 'package:calculator/unitConverter/unitPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: UnitConverterPage(),
    );
  }
}
