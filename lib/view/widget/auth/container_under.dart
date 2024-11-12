import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType;
  final Function() onPressed;
  const ContainerUnder(
      {super.key, required this.text, required this.onPressed, required this.textType});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color:Get.isDarkMode?  pinkClr:mainColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white),
          TextButton(
            onPressed: onPressed,
            child: TextUtils(
                text: textType,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
          )
        ],
      ),
    );
  }
}
