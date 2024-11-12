import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/card_controller.dart';
import 'package:flutter_api_getx_matjer/logic/controller/product_controller.dart';
import 'package:flutter_api_getx_matjer/model/model_product.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/screen/product_details_secreen.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:get/get.dart';

class CardItem extends StatelessWidget {
  CardItem({super.key});

  final controller = Get.find<ProductController>();
  final controllerCart = Get.find<CardController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoding.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: GridView.builder(
              itemCount: controller.productList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.8,
                mainAxisSpacing: 9.0,
                crossAxisSpacing: 6.0,
                maxCrossAxisExtent: 200,
              ),
              itemBuilder: (context, index) {
                return buildCardItem(
                    image: controller.productList[index].image,
                    price: controller.productList[index].price,
                    rate: controller.productList[index].rating.rate,
                    productID: controller.productList[index].id,
                    productModels: controller.productList[index],
                    onTap: () {
                      Get.to(() => ProductDetailsSecreen(productModels: controller.productList[index],),
                      );
                      
                    },
                  
                    );
              }),
        );
      }
    });
  }

  Widget buildCardItem({
    required String image,
    required double price,
    required double rate,
    required int productID,
    required ProductModels productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 4.0,
                  blurRadius: 5.0),
            ],
          ),
          child: Column(
            children: [
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.managefavorites(productID);
                      },
                      icon: controller.isFavorites(productID)
                          ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(
                              Icons.favorite_border_outlined,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        controllerCart.addProductCart(productModels);
                      },
                      icon: Icon(
                        Icons.add_shopping_cart_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(
                  image,
                  fit: BoxFit.fitHeight,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$ $price',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Container(
                      height: 20,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Get.isDarkMode ? pinkClr : mainColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 3, right: 2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextUtils(
                                text: "$rate",
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            Icon(
                              Icons.star_outlined,
                              color: Colors.amber,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
