import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';

class HelpWidget extends StatelessWidget {
  const HelpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        BorderRadius.circular(22);
        Get.defaultDialog(
            title: "Help from App",
            titleStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            middleText: "قيد التطوير",
            middleTextStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
            textCancel: "Tankes",
            cancelTextColor: Colors.white,
            onCancel: () {
              Get.back();
            },
            buttonColor: Colors.grey.shade500);
      },
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(
              6,
            ),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color.fromARGB(255, 90, 245, 12),
            ),
            child: const Icon(
              Icons.help_outline,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
            text: "Help".tr,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          )
        ],
      ),
    );
  }
}