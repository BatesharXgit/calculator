import 'package:calculator/bmi/Screens/input_page.dart';
import 'package:calculator/calculator/pages/MainPage.dart';
import 'package:calculator/unitConverter/converter.dart';
import 'package:calculator/unitConverter/converterCategory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => Get.to(InputPage()),
              child: Text("BMI Calculator"),
            ),
            ElevatedButton(
              onPressed: () => Get.to(UnitConverterPage()),
              child: Text("Unit Converter"),
            ),
            ElevatedButton(
              onPressed: () => Get.to(CalculatorPage(
                title: '',
              )),
              child: Text("Unit Converter"),
            ),
            ElevatedButton(
              onPressed: () => Get.to(LengthConverterPage()),
              child: Text("Length Calculator"),
            ),
          ],
        ),
      )),
    );
  }
}
