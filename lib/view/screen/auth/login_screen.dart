import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/auth_controller.dart';
import 'package:flutter_api_getx_matjer/routes/routes.dart';
import 'package:flutter_api_getx_matjer/utils/my_validation_string.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/auth/auth_button.dart';
import 'package:flutter_api_getx_matjer/view/widget/auth/auth_text_from_field.dart';
import 'package:flutter_api_getx_matjer/view/widget/auth/chek_widget.dart';
import 'package:flutter_api_getx_matjer/view/widget/auth/container_under.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  bool visibilaty = true;

  final controller = Get.find<AuthController>();

  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text("Sign Up"),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? darkGreyClr : Colors.white,
        ),
        // backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: EdgeInsets.only(top: 40, left: 25, right: 25),
                  child: Form(
                    key: fromKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              TextUtils(
                                  text: "LOG",
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  color: Get.isDarkMode ? pinkClr : mainColor),
                              SizedBox(
                                width: 5,
                              ),
                              TextUtils(
                                  text: "IN",
                                  fontSize: 28,
                                  fontWeight: FontWeight.w500,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black),
                            ],
                          ),
                          const SizedBox(
                            height: 100,
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
                                ? Icon(
                                    Icons.email,
                                    color: pinkClr,
                                    size: 28,
                                  )
                                : Image.asset("2.1 images/images/email.png"),
                            suffixIcon: Text(""),
                            hintText: "Email",
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return AuthTextFromField(
                              controller: passwordController,
                              keyboardType: TextInputType.text,
                              obscureText:
                                  controller.isVisibality ? false : true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a password';
                                } else if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                              prefixIcon: Get.isDarkMode
                                  ? Icon(
                                      Icons.lock,
                                      color: pinkClr,
                                      size: 30,
                                    )
                                  : Image.asset("2.1 images/images/lock.png"),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.visibality();
                                },
                                icon: controller.isVisibality
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off),
                              ),
                              hintText: "Password",
                            );
                          }),
                          SizedBox(
                            height: 80,
                          ),
                          GetBuilder<AuthController>(builder: (_) {
                            return AuthButton(
                              onPressed: () {
                                if (fromKey.currentState!.validate()) {
                                  String email = emailController.text.trim();
                                  String password = passwordController.text;
                                  controller.logINusingFirebase(
                                      email: email, password: password);
                                }
                              },
                              text: "LOG IN",
                            );
                          }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.forgotPasswordSecreen);
                                },
                                child: TextUtils(
                                  text: "ForgotPassword?",
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                  underline: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "OR",
                            style: TextStyle(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GetBuilder<AuthController>(builder: (_) {
                                return InkWell(
                                  onTap: () {
                                    controller.googleSignUpApp();
                                  },
                                  child: Image.asset(
                                      "2.1 images/images/google.png"),
                                );
                              }),
                              SizedBox(
                                width: 15,
                              ),
                              Image.asset("2.1 images/images/facebook.png"),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: "Don't have Account",
                textType: "Sign up",
                onPressed: () {
                  Get.offNamed(Routes.signupScreen);
                },
              ),
            ],
          ),
        ));
  }
}
