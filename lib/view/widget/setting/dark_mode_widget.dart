import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/setteing_controller.dart';
import 'package:flutter_api_getx_matjer/logic/controller/theme_controller.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';

class DarkModeWidget extends StatelessWidget {
  DarkModeWidget({super.key});
  final controller = Get.find<SetteingController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildIconWidget(),
            Switch(
              activeTrackColor: Get.isDarkMode ? pinkClr : mainColor,
              // activeColor: Get.isDarkMode?pinkClr:mainColor,
              value: controller.switchValue.value,
              onChanged: (value) {
                ThemeController().changesTheme();
                controller.switchValue.value = value;
              },
            ),
          ],
        ));
  }

  Widget buildIconWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: darkSettings,
            ),
            child: const Icon(
              Icons.dark_mode,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          TextUtils(
            text: "Dark Mode".tr,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ],
      ),
    );
  }
}
