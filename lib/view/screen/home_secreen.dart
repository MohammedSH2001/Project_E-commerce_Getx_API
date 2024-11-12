import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/home/card_item.dart';
import 'package:flutter_api_getx_matjer/view/widget/home/search_text.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';

class HomeSecreen extends StatelessWidget {
  const HomeSecreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.scaffoldBackgroundColor,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGreyClr : mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextUtils(
                        text: "Find Your",
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                    SizedBox(
                      height: 5,
                    ),
                    TextUtils(
                        text: "INSPIRATOIN",
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                    SizedBox(
                      height: 20,
                    ),
                    SearchText(),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: TextUtils(
                    text: "Catogries",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            CardItem(),
          ],
        ),
      ),
    );
  }
}
