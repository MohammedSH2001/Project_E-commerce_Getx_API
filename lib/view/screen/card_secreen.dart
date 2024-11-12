import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/card_controller.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/empty_card/card_total.dart';
import 'package:flutter_api_getx_matjer/view/widget/empty_card/cart_product_card.dart';
import 'package:flutter_api_getx_matjer/view/widget/empty_card/empty_card.dart';
import 'package:get/get.dart';

class CardSecreen extends StatelessWidget {
  CardSecreen({super.key});

  final controller = Get.find<CardController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(
            "Card Item",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          centerTitle: true,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
              size: 29,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                controller.clearAllProduct();
              },
              icon: Icon(
                Icons.backspace_rounded,
                color: Colors.white,
              ),
            )
          ],
        ),
        body: Obx(() {
          if (controller.productMap.isEmpty) {
            return const EmptyCard();
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            productModels:
                                controller.productMap.keys.toList()[index],
                            index: index,
                            quntity:
                                controller.productMap.values.toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 20,
                            ),
                        itemCount: controller.productMap.length),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: CardTotal(),
                  ),
                ],
              ),
            );
          }
        }));
  }
}
