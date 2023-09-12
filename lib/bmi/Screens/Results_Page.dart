import 'package:calculator/bmi/Components/BottomContainer_Button.dart';
import 'package:calculator/bmi/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Components/bmiContainer.dart';

class ResultPage extends StatelessWidget {
  final String resultText;
  final String bmi;
  final String advise;
  final Color textColor;

  ResultPage(
      {required this.textColor,
      required this.resultText,
      required this.bmi,
      required this.advise});

  @override
  Widget build(BuildContext context) {
    Color backgroundColour = Theme.of(context).colorScheme.background;
    Color primaryColour = Theme.of(context).colorScheme.primary;
    Color secondaryColour = Theme.of(context).colorScheme.secondary;
    Color tertiaryColour = Theme.of(context).colorScheme.tertiary;
    return Scaffold(
      appBar: null,
      backgroundColor: backgroundColour,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Your Result',
                  style: ktitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: BMIContainer(
                colour: primaryColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 27.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      bmi,
                      style: kBMITextStyle,
                    ),
                    Text(
                      'Normal BMI range:',
                      style: klabelTextStyle,
                    ),
                    Text(
                      '18.5 - 25 kg/m2',
                      style: kBodyTextStyle,
                    ),
                    Text(
                      advise,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    // RawMaterialButton(
                    //   onPressed: () {},
                    //   constraints: BoxConstraints.tightFor(
                    //     width: 200.0,
                    //     height: 56.0,
                    //   ),
                    //   fillColor: Color(0xFF4C4F5E),
                    //   elevation: 0.0,
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10.0)),
                    //   child: Text(
                    //     'SAVE RESULT',
                    //     style: kBodyTextStyle,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            BottomContainer(
                text: 'RE-CALCULATE',
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
