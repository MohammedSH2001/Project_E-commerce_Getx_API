import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/auth_controller.dart';
import 'package:flutter_api_getx_matjer/main.dart';
import 'package:flutter_api_getx_matjer/routes/routes.dart';
import 'package:flutter_api_getx_matjer/utils/my_validation_string.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/auth/auth_button.dart';
import 'package:flutter_api_getx_matjer/view/widget/auth/auth_text_from_field.dart';
import 'package:flutter_api_getx_matjer/view/widget/auth/chek_widget.dart';
import 'package:flutter_api_getx_matjer/view/widget/auth/container_under.dart';
import 'package:flutter_api_getx_matjer/view/widget/sherd/snak_bar.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool visibilaty = true;
  final controller = Get.find<AuthController>();
  final GlobalKey<FormState> fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        ),
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                                text: "SIGN",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode ? mainColor : pinkClr),
                            SizedBox(
                              width: 5,
                            ),
                            TextUtils(
                                text: "UP",
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white),
                          ],
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        AuthTextFromField(
                          controller: nameController,
                          keyboardType: TextInputType.text,
                          obscureText: false,
                          validator: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name';
                            } else
                              return null;
                          },
                          prefixIcon: Get.isDarkMode
                              ? Image.asset("2.1 images/images/user.png")
                              : Icon(
                                  Icons.person,
                                  color: pinkClr,
                                  size: 30,
                                ),
                          suffixIcon: Text(""),
                          hintText: "User Name",
                        ),
                        const SizedBox(
                          height: 25,
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
                          height: 25,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthTextFromField(
                            controller: passwordController,
                            keyboardType: TextInputType.text,
                            obscureText: controller.isVisibality ? false : true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null; // إذا كانت القيمة صحيحة
                            },
                            prefixIcon: Get.isDarkMode
                                ? Image.asset("2.1 images/images/lock.png")
                                : Icon(
                                    Icons.lock,
                                    color: pinkClr,
                                    size: 30,
                                  ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                // visibilaty = !visibilaty;
                                // setState(() {});
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
                          height: 25,
                        ),
                        ChekWidget(),
                        SizedBox(
                          height: 25,
                        ),
                        GetBuilder<AuthController>(builder: (_) {
                          return AuthButton(
                            onPressed: () {
                              if (controller.isCheck == false) {
                                Get.snackbar(
                                  'Check Box',
                                  'Please, Accept Terms & condition',
                                  snackPosition: SnackPosition.TOP,
                                  backgroundColor: mainColor,
                                  colorText: Colors.white,
                                );
                              } else if (fromKey.currentState!.validate()) {
                                String name = nameController.text.trim();
                                String email = emailController.text.trim();
                                String password = passwordController.text;
                                controller.signUpusingFirebase(
                                    name: name,
                                    email: email,
                                    password: password);
                                controller.isCheck = true;
                              }
                            },
                            text: "SIGN UP",
                          );
                        })
                      ],
                    ),
                  ),
                ),
              ),
              ContainerUnder(
                text: "Already an Account",
                textType: "Log in",
                onPressed: () {
                  Get.offNamed(Routes.loginScreen);
                },
              ),
            ],
          ),
        ));
  }
}
