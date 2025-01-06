import 'package:flutter/material.dart';

const Color mainColor = Color(0xff00BE84);
const Color darkGreyClr = Color(0xff121212);
const Color pinkClr = Color.fromARGB(255, 221, 141, 121);
const Color kCOlor1 = Color(0xff685959);
const Color kCOlor2 = Color(0xffADA79B);
const Color kCOlor3 = Color(0xffA5947f);
const Color kCOlor4 = Color(0xff738B71);
const Color kCOlor5 = Color(0xff6D454D);
const Color darkSettings = Color(0xff6132e4);
const Color accountSettings = Color(0xff73bc65);
const Color logOutSettings = Color(0xff5f95ef);
const Color notiSettings = Color(0xffdf5862);
const Color languageSettings = Color(0xffcb256c);

class ThemeApp {
  static final light = ThemeData(
      primaryColor: mainColor,
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light);

  static final dart = ThemeData(
      primaryColor: darkGreyClr,
      scaffoldBackgroundColor: darkGreyClr,
      brightness: Brightness.dark);
}
