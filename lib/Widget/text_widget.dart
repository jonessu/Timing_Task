import 'package:flutter/material.dart';

class Text_Widget extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color colour;
  //final String fontFamily;
  final FontWeight fontWeight;
  Text_Widget({
    required this.text,
    required this.fontSize,
    required this.colour,
    //required this.fontFamily,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: colour,
        //fontFamily: fontFamily,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
