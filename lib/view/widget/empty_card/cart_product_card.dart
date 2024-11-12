import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/card_controller.dart';
import 'package:flutter_api_getx_matjer/model/model_product.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:get/get.dart';

class CartProductCard extends StatelessWidget {
  final ProductModels productModels;
  final int index;
  final int quntity;

  CartProductCard(
      {super.key, required this.productModels, required this.index, required this.quntity});
  final controller = Get.find<CardController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
          color: Get.isDarkMode
              ? pinkClr.withOpacity(0.7)
              : mainColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Container(
            height: 140,
            width: 100,
            margin: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: NetworkImage(
                    productModels.image,
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            flex: 15,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productModels.title,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "\$ ${controller.productSubTotal[index].toStringAsFixed(2)}",
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Get.isDarkMode ? Colors.white : Colors.black),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      controller.removeProductFromCart(productModels);
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  Text(
                    quntity.toString(),
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Get.isDarkMode ? Colors.white : Colors.black),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.addProductCart(productModels);
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  controller.removeOneProduct(productModels);
                },
                icon: Icon(
                  Icons.delete,
                  color: Get.isDarkMode ? Colors.black : Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
