import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/card_controller.dart';
import 'package:flutter_api_getx_matjer/model/model_product.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;
  AddCart({super.key, required this.price, required this.productModels});
  final controller = Get.find<CardController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUtils(
                text: "price",
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
              Text(
                "\$$price",
                style: TextStyle(
                  fontSize: 20,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  height: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 0,
                  backgroundColor: Get.isDarkMode ? pinkClr : mainColor,
                ),
                onPressed: () {
                  controller.addProductCart(productModels);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shopping_cart_outlined,color: Colors.white,)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
