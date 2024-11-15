import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextUtils extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration underline;
  const TextUtils(
      {super.key,
      required this.text,
      required this.fontSize,
      required this.fontWeight,
      required this.color,
      this.underline = TextDecoration.none});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          decoration: underline,
          decorationColor: Colors.black,
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight),
    );
  }
}
