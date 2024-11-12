
import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/model/model_product.dart';
import 'package:flutter_api_getx_matjer/routes/routes.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:get/get.dart';

class CardController extends GetxController {
  var productMap = {}.obs;

  void addProductCart(ProductModels productModels) {
    if (productMap.containsKey(productModels)) {
      productMap[productModels] += 1;
    } else {
      productMap[productModels] = 1;
    }
  }

  void removeProductFromCart(ProductModels productModels) {
    if (productMap.containsKey(productModels) &&
        productMap[productModels] == 1) {
      productMap.removeWhere((key, value) => key == productModels);
    } else {
      productMap[productModels] -= 1;
    }
  }

  void removeOneProduct(ProductModels productModels) {
    productMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProduct() {
    Get.defaultDialog(
        title: "Clear Products",
        titleStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        middleText: "Are you sure you need Clear Products",
        middleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
        textCancel: "No",
        cancelTextColor: Colors.white,
        onCancel: () {
          Get.toNamed(Routes.cardSecreen);
        },
        textConfirm: "Yes",
        confirmTextColor: Colors.white,
        onConfirm: () {
          productMap.clear();
          Get.back();
        },
        buttonColor: Colors.grey.shade500);
  }

  get productSubTotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, e) => value + e)
      .toStringAsFixed(2);

  int quantity() {
    if (productMap.isEmpty) {
      return 0;
    } else {
      return productMap.entries
          .map((e) => e.value)
          .toList()
          .reduce((value, e) => value + e);
    }
  }
}
