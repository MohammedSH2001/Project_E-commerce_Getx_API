import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/auth_controller.dart';
import 'package:flutter_api_getx_matjer/logic/controller/setteing_controller.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({super.key});
  final controller = Get.find<SetteingController>();
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          return Row(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage("https://images.unsplash.com/photo-1730774344169-154bc63978d9?q=80&w=1885&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                    text: controller
                        .capitlize(authController.displyUserName.value),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                  TextUtils(
                    text: controller
                        .capitlize(authController.displyUserEmail.value),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ],
              ),
            ],
          );
        })
      ],
    );
  }
}
