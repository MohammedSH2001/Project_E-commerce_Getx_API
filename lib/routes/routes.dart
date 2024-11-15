import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/binding/auth_binding.dart';
import 'package:flutter_api_getx_matjer/logic/binding/main_binding.dart';
import 'package:flutter_api_getx_matjer/logic/binding/product_binding.dart';
import 'package:flutter_api_getx_matjer/view/screen/auth/forgot_password_secreen.dart';
import 'package:flutter_api_getx_matjer/view/screen/auth/login_screen.dart';
import 'package:flutter_api_getx_matjer/view/screen/auth/signup_screen.dart';
import 'package:flutter_api_getx_matjer/view/screen/card_secreen.dart';
import 'package:flutter_api_getx_matjer/view/screen/main_secreen.dart';
import 'package:flutter_api_getx_matjer/view/screen/pay_ment_secreen.dart';
import 'package:flutter_api_getx_matjer/view/screen/welcome_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  //      initialRoute
  static const welcome = Routes.welcomeSecreen;
  static const mainSecreen = Routes.mainSecreen;

  //    getPages

  static final routes = [
    GetPage(
      name: Routes.welcomeSecreen,
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signupScreen,
      page: () => SignupScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordSecreen,
      page: () => ForgotPasswordSecreen(),
      binding: AuthBinding(),
    ),
    GetPage(name: Routes.mainSecreen, page: () => MainSecreen(), bindings: [
      AuthBinding(),
      MainBinding(),
      ProductBinding(),
    ]),
    GetPage(
      name: Routes.cardSecreen,
      page: () => CardSecreen(),
      bindings: [
        AuthBinding(),
        ProductBinding(),
      ],
    ),
    GetPage(
        name: Routes.payMentSecreen,
        page: () => PayMentSecreen(),
        bindings: [
          AuthBinding(),
          ProductBinding(),
          MainBinding(),
        ]),
  ];
}

class Routes {
  static const welcomeSecreen = '/welcomeSecreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const forgotPasswordSecreen = '/forgotPasswordSecreen';
  static const mainSecreen = '/mainSecreen';
  static const cardSecreen = '/cardSecreen';
  static const payMentSecreen = '/payMentSecreen';
}
