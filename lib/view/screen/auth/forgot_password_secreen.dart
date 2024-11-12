import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/auth_controller.dart';
import 'package:flutter_api_getx_matjer/main.dart';
import 'package:flutter_api_getx_matjer/utils/my_validation_string.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/auth/auth_button.dart';
import 'package:flutter_api_getx_matjer/view/widget/auth/auth_text_from_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ForgotPasswordSecreen extends StatelessWidget {
  ForgotPasswordSecreen({super.key});
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final controller = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        title: Text(
          "Forgot Password",
          style: TextStyle(color: Get.isDarkMode ? mainColor : pinkClr),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode ? Colors.black : Colors.white,
          ),
        ),
      ),
      backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
      body: Form(
        key: fromKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.close,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    "If you want to recover your account, then please provide  your email ID below..",
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        fontSize: 16),
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "2.1 images/images/forgetpass copy.png",
                  width: 280,
                ),
                SizedBox(
                  height: 10,
                ),
                AuthTextFromField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  validator: (value) {
                    if (!RegExp(validationEmail).hasMatch(value)) {
                      return 'Enter valid name';
                    } else
                      null;
                  },
                  prefixIcon: Get.isDarkMode
                      ? Image.asset("2.1 images/images/email.png")
                      : Icon(
                          Icons.email,
                          color: pinkClr,
                          size: 28,
                        ),
                  suffixIcon: Text(""),
                  hintText: "Email",
                ),
                const SizedBox(
                  height: 30,
                ),
                GetBuilder<AuthController>(builder: (_) {
                  return AuthButton(
                      text: "SEND",
                      onPressed: () {
                        if (fromKey.currentState!.validate()) {
                          String email = emailController.text.trim();
                          controller.resetPassword(email);
                        }
                      });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
