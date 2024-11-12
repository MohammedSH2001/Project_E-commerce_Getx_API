import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AuthButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
          minimumSize: const Size(360, 50)),
      child: TextUtils(
          text: text,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    );
  }
}
