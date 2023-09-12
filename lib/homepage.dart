import 'package:calculator/bmi/Screens/input_page.dart';
import 'package:calculator/calculator/constants.dart';
import 'package:calculator/calculator/modules/ReplaceHumanReadableChars.dart';
import 'package:calculator/calculator/widgets/CalculatorButton.dart';
import 'package:calculator/themes/theme.dart';
import 'package:calculator/util/settings.dart';
import 'package:calculator/unitConverter/converterCategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _history = '';
  String _expression = '';
  bool _isDecimalUsed = false;
  bool _isCalculated = false;

  bool isAnOperator(String number) {
    return "/%√×-+".contains(number);
  }

  void onAllClearClick(String ac) {
    setState(() {
      _history = '';
      _expression = '';
      _isDecimalUsed = false;
    });
  }

  void onClearClick(String c) {
    setState(() {
      _expression = '';
      _isDecimalUsed = false;
    });
  }

  void onBackSpaceClick() {
    if (_expression != '' && _expression.length > 0) {
      if (_expression.substring(_expression.length - 1, _expression.length) ==
          '.') {
        setState(() {
          _isDecimalUsed = false;
        });
      }
      setState(() {
        _expression = _expression.substring(0, _expression.length - 1);
      });
    }
  }

  void onNumberClick(String number) {
    if (isAnOperator(number)) {
      setState(() {
        _isDecimalUsed = false;
      });
    }
    if (number == '.' && !_isDecimalUsed) {
      setState(() {
        _isDecimalUsed = true;
        _expression += number;
      });
    }
    if (!_isDecimalUsed || number != '.') {
      setState(() {
        if (_isCalculated) {
          _history = _expression;
          _expression = number;
          _isCalculated = false;
        } else {
          _expression += number;
        }
      });
    }
  }

  void calculate(String equal) {
    String input = replaceHumanReadableChars(_expression);

    Parser parser = Parser();
    Expression expression = parser.parse(input);
    ContextModel contextModel = ContextModel();
    double calculated = expression.evaluate(EvaluationType.REAL, contextModel);

    String result =
        calculated.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");

    setState(() {
      if (_isCalculated) {
        _history = _expression + ' = ' + _history;
      } else {
        _history = _expression;
      }
      _expression = result;
      _isCalculated = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColour = Theme.of(context).colorScheme.background;
    Color primaryColour = Theme.of(context).colorScheme.primary;
    Color secondaryColour = Theme.of(context).colorScheme.secondary;
    Color tertiaryColour = Theme.of(context).colorScheme.tertiary;
    return Scaffold(
      backgroundColor: backgroundColour,
      body: SafeArea(
        child: Stack(
          children: [
            topBar(),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.515,
                decoration: BoxDecoration(
                  color: primaryColour,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  _history,
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(fontSize: 24), color: kHistoryColor),
                ),
                alignment: Alignment(1, 1),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Text(
                  _expression,
                  style: GoogleFonts.rubik(
                      textStyle: TextStyle(fontSize: 48),
                      color: tertiaryColour),
                ),
                alignment: kExpressionAligment,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalculatorButtonRed(
                      label: 'AC',
                      // fillColor: secondaryColour,
                      textSize: 22,
                      callback: onAllClearClick),
                  CalculatorButtonGreen(
                    label: 'C',
                    // fillColor: secondaryColour,
                    callback: onClearClick,
                  ),
                  SizedBox(
                    width: 85,
                  ),
                  SizedBox(
                    width: 85,
                  ),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButtonGreen(
                      label: '%',
                      // fillColor: kOperationButtonsColor,
                      // textColor: kOperationButtonTextColor,
                      callback: onNumberClick,
                    ),
                    CalculatorButtonGreen(
                      label: '/',
                      // fillColor: kOperationButtonsColor,
                      // textColor: kOperationButtonTextColor,
                      callback: onNumberClick,
                    ),
                    CalculatorButtonGreen(
                      label: '√',
                      // fillColor: secondaryColour,
                      // textColor: kOperationButtonTextColor,
                      callback: onNumberClick,
                    ),
                    MaterialButton(
                      // Backspace Button

                      onPressed: onBackSpaceClick,
                      color: secondaryColour,
                      textColor: Color(kOperationButtonTextColor),
                      child: Icon(
                        Icons.backspace_rounded,
                        size: 20,
                        color: kTextColorRed,
                      ),
                      padding: EdgeInsets.all(20),
                      shape: CircleBorder(),
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                      label: '7',
                      callback: onNumberClick,
                      // fillColor: 0xFFE0E0E0,
                    ),
                    CalculatorButton(
                      label: '8',
                      callback: onNumberClick,
                    ),
                    CalculatorButton(
                      label: '9',
                      callback: onNumberClick,
                    ),
                    CalculatorButtonRed(
                      label: '×',
                      // fillColor: kOperationButtonsColor,
                      // textColor: kOperationButtonTextColor,
                      callback: onNumberClick,
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                      label: '4',
                      callback: onNumberClick,
                    ),
                    CalculatorButton(
                      label: '5',
                      callback: onNumberClick,
                    ),
                    CalculatorButton(
                      label: '6',
                      callback: onNumberClick,
                    ),
                    CalculatorButtonRed(
                      label: '-',
                      // fillColor: kOperationButtonsColor,
                      // textColor: kOperationButtonTextColor,
                      callback: onNumberClick,
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                      label: '1',
                      callback: onNumberClick,
                    ),
                    CalculatorButton(
                      label: '2',
                      callback: onNumberClick,
                    ),
                    CalculatorButton(
                      label: '3',
                      callback: onNumberClick,
                    ),
                    CalculatorButtonRed(
                      label: '+',
                      // fillColor: kOperationButtonsColor,
                      // textColor: kOperationButtonTextColor,
                      callback: onNumberClick,
                    ),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    CalculatorButton(
                      label: '.',
                      callback: onNumberClick,
                    ),
                    CalculatorButton(
                      label: '0',
                      callback: onNumberClick,
                    ),
                    CalculatorButton(
                      label: '00',
                      textSize: 22,
                      callback: onNumberClick,
                    ),
                    CalculatorButtonRed(
                      label: '=',

                      // fillColor: kOperationButtonsColor,
                      // textColor: kOperationButtonTextColor,
                      callback: calculate,
                    ),
                  ]),
            ]),
          ],
        ),
      ),
    );
  }

  Widget topBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: () => Get.to(BMICalculator()),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'BMI',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        IconButton(
          iconSize: 30,
          icon: Icon(Icons.category_outlined),
          onPressed: () => Get.to(UnitConverterPage()),
        ),
        // SizedBox(width: 5),
        IconButton(
          iconSize: 30,
          icon: Icon(Icons.menu),
          onPressed: () => Get.to(SettingsPage()),
        ),
      ],
    );
  }
}
