import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/routes/routes.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              '2.1 images/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 200,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 190,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextUtils(
                    text: "Welcome",
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 240,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextUtils(
                        text: "Suiko",
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      TextUtils(
                        text: "Shop",
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  ),
                  onPressed: () {
                    Get.offNamed(Routes.loginScreen);
                  },
                  child: TextUtils(
                    text: "Get Start",
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                // SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextUtils(
                      text: "Dont't have an Account?",
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                    TextButton(
                        onPressed: () {
                          Get.offNamed(Routes.signupScreen);
                        },
                        child: TextUtils(
                          text: "Sign up",
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          underline: TextDecoration.underline,
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
