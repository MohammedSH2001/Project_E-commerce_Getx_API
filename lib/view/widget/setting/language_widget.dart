import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/setteing_controller.dart';
import 'package:flutter_api_getx_matjer/utils/my_validation_string.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/list_notifier.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({super.key});
  final controller = Get.find<SetteingController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetteingController>(
        builder: (_) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Material(
                  color: Colors.transparent,
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(
                          6,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: languageSettings,
                        ),
                        child: const Icon(
                          Icons.language,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextUtils(
                        text: "Language".tr,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      )
                    ],
                  ),
                ),
                // SizedBox(
                //   width: 70,
                // ),
                Container(
                  width: 120,
                  height: 40,
                  padding: EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                    border: Border.all(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      width: 2,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconSize: 22,
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                      items: [
                        DropdownMenuItem(
                          child: Text(
                            english,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          value: eng,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            arabic,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          value: ara,
                        ),
                        DropdownMenuItem(
                          child: Text(
                            france,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          value: fra,
                        ),
                      ],
                      value: controller.langlocal,
                      onChanged: (String? value) {
                        controller.changeLanguage(value!);
                        Get.updateLocale(Locale(value));
                      },
                    ),
                  ),
                )
              ],
            ));
  }
}
