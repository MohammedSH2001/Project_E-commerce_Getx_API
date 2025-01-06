import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/profile_widget.dart';
import 'package:flutter_api_getx_matjer/view/widget/setting/about.dart';
import 'package:flutter_api_getx_matjer/view/widget/setting/dark_mode_widget.dart';
import 'package:flutter_api_getx_matjer/view/widget/setting/language_widget.dart';
import 'package:flutter_api_getx_matjer/view/widget/setting/log_out_widget.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';

class SettingSecreen extends StatelessWidget {
  const SettingSecreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(
          24,
        ),
        children: [
          ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Colors.grey,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          TextUtils(
            text: "GENERAL".tr,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
          const SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          LogOutWidget(),
          const SizedBox(
            height: 20,
          ),
          About(),
        ],
      ),
    );
  }
}
