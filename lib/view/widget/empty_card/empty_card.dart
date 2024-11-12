import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api_getx_matjer/routes/routes.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:get/get.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart,
              size: 160,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            SizedBox(
              height: 40,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Your Card is ",
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Empty",
                    style: TextStyle(
                        color: Get.isDarkMode ? pinkClr : mainColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Add ithem to get Started",
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
            SizedBox(height: 25,),
            SizedBox(
              height: 45,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                  backgroundColor: Get.isDarkMode? pinkClr:mainColor,
                ),
                
                onPressed: () {
                  Get.toNamed(Routes.mainSecreen);
                },
                child: Text("Go to Home",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
