import 'package:flutter/material.dart';

const Color mainColor = Color(0xff00BE84);
const Color darkGreyClr = Color(0xff121212);
const Color pinkClr = Color(0xFFff4667);
const Color kCOlor1 = Color(0xff685959);
const Color kCOlor2 = Color(0xffADA79B);
const Color kCOlor3 = Color(0xffA5947f);
const Color kCOlor4 = Color(0xff738B71);
const Color kCOlor5 = Color(0xff6D454D);
// const Color backgroundColor = Colors.white;

class ThemeApp {
  static final light = ThemeData(
      primaryColor: mainColor,
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light);

  static final dart = ThemeData(
primaryColor: darkGreyClr,
  scaffoldBackgroundColor: darkGreyClr,
  brightness: Brightness.dark


  );
}
