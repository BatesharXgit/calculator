import 'package:calculator/themes/theme.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class BottomContainer extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  BottomContainer({required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kTextColorGreen,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kbottomContainerHeight,
        padding: EdgeInsets.only(bottom: 15.0),
        child: Center(
          child: Text(
            text,
            style: klargeBottomButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
