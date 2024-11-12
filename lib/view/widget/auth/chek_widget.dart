import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/auth_controller.dart';
import 'package:flutter_api_getx_matjer/main.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChekWidget extends StatelessWidget {
  ChekWidget({super.key});
  final controllerCheck = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controllerCheck.check();
            },
            child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: controllerCheck.isCheck
                    ? Get.isDarkMode
                        ?  Image.asset("2.1 images/images/check.png")
                        : const  Icon(
                            Icons.done,
                            color: pinkClr,size: 30,
                          )
                    : Container()),
          ),
          SizedBox(
            width: 10,
          ),
          TextUtils(
              text: "I accept ",
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Get.isDarkMode ? Colors.black : Colors.white),
          TextUtils(
            text: "Terms & condition",
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: Get.isDarkMode ? Colors.black : Colors.white,
            underline: TextDecoration.underline,
          ),
        ],
      );
    });
  }
}
