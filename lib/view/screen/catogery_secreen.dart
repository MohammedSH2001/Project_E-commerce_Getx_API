import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/view/widget/category/category_widget.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';

class CatogerySecreen extends StatelessWidget {
  const CatogerySecreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: 15,
          top: 15,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: TextUtils(
                  text: "Category",
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
        const    SizedBox(height: 20,),
            CategoryWidget(),
          ],
        ),
      ),
    );
  }
}
