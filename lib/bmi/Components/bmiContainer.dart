import 'package:flutter/material.dart';

class BMIContainer extends StatelessWidget {
  // ignore: non_constant_identifier_names
  BMIContainer(
      {required this.colour, required this.cardChild}); //remove required
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}
