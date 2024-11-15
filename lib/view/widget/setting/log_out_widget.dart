import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/auth_controller.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({super.key});
  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_) => Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            BorderRadius.circular(22);
            Get.defaultDialog(
                title: "logout from App",
                titleStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                middleText: "Are you sure you need to logout",
                middleTextStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                textCancel: "No",
                cancelTextColor: Colors.white,
                onCancel: () {
                  Get.back();
                },
                textConfirm: "Yes",
                confirmTextColor: Colors.white,
                onConfirm: () {
                  controller.signOutFromApp();
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
                  color: logOutSettings,
                ),
                child: const Icon(
                  Icons.login,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextUtils(
                text: "Logout".tr,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
