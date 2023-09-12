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

//dark                                           //white
//#353A40    grey, result page                  //#FEFEFE 
//#212429    dark grey, main colour             //#F1F1F1
//#23262B    fill colour                        //#F0F0F0
//#F56A7A    red colour                         
//#6BD66A    green colour
