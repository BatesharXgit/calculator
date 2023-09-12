import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  CalculatorButton(
      {required this.label,
      // this.textColor = 0xFFFFFFFF,
      // this.fillColor = 0x00ffffff,
      this.textSize = 26,
      required this.callback});
  final String label;
  // final int textColor;
  // final int fillColor;

  final double textSize;
  final Function callback;
  @override
  Widget build(BuildContext context) {
    Color secondaryColour = Theme.of(context).colorScheme.secondary;
    Color tertiaryColour = Theme.of(context).colorScheme.tertiary;
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
          width: 60,
          height: 60,
          child: TextButton(
            onPressed: () {
              callback(label);
            },
            child: Text(label,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(fontSize: textSize))),
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.fromLTRB(15, 5, 15, 5)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(secondaryColour),
                foregroundColor:
                    MaterialStateProperty.all<Color>(tertiaryColour),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ))),
          )),
    );
  }
}

class CalculatorButtonRed extends StatelessWidget {
  CalculatorButtonRed(
      {required this.label,
      // this.textColor = 0xFFFFFFFF,
      // this.fillColor = 0x00ffffff,
      this.kTextColorRed = 0xFFF56A7A,
      this.textSize = 26,
      required this.callback});
  final String label;
  // final int textColor;
  // final int fillColor;
  final kTextColorRed;
  final double textSize;
  final Function callback;
  @override
  Widget build(BuildContext context) {
    Color secondaryColour = Theme.of(context).colorScheme.secondary;
    // Color tertiaryColour = Theme.of(context).colorScheme.tertiary;
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
          width: 60,
          height: 60,
          child: TextButton(
            onPressed: () {
              callback(label);
            },
            child: Text(label,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(fontSize: textSize))),
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.fromLTRB(15, 5, 15, 5)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(secondaryColour),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Color(kTextColorRed)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ))),
          )),
    );
  }
}

class CalculatorButtonGreen extends StatelessWidget {
  CalculatorButtonGreen(
      {required this.label,
      // this.textColor = 0xFFFFFFFF,
      // this.fillColor = 0x00ffffff,
      this.kTextColorGreen = 0xFF6BD66A,
      this.textSize = 26,
      required this.callback});
  final String label;
  // final int textColor;
  // final int fillColor;
  final kTextColorGreen;
  final double textSize;
  final Function callback;
  @override
  Widget build(BuildContext context) {
    Color secondaryColour = Theme.of(context).colorScheme.secondary;

    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
          width: 60,
          height: 60,
          child: TextButton(
            onPressed: () {
              callback(label);
            },
            child: Text(label,
                style: GoogleFonts.rubik(
                    textStyle: TextStyle(fontSize: textSize))),
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.fromLTRB(15, 5, 15, 5)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(secondaryColour),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Color(kTextColorGreen)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ))),
          )),
    );
  }
}
