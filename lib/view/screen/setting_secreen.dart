import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api_getx_matjer/logic/controller/auth_controller.dart';
import 'package:flutter_api_getx_matjer/logic/controller/theme_controller.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SettingSecreen extends StatelessWidget {
  const SettingSecreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: TextButton(
            onPressed: () {
              ThemeController().changesTheme();
            },
            child: Text(
              "Dark Mode",
              style: TextStyle(color: Colors.amberAccent),
            ),
          )),
          GetBuilder<AuthController>(builder: (controller) {
            return TextButton(
              onPressed: () {
                Get.defaultDialog(
                    title: "logout from App",
                    titleStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    middleText: "Are you sure you need to logout",
                    middleTextStyle: TextStyle(
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
                    buttonColor:Colors.grey.shade500 
                    );
              },
              child: Text(
                "Log Out",
                style: TextStyle(color: Colors.amberAccent),
              ),
            );
          })
        ],
      ),
    );
  }
}
