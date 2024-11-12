import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/product_controller.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/text_utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final String titel;
  final int productId;
  final double rate;
  final String description;
  ClothesInfo(
      {super.key,
      required this.titel,
      required this.productId,
      required this.rate,
      required this.description});
  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  titel,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Obx(() {
                return Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode
                        ? Colors.white.withOpacity(0.9)
                        : Colors.grey.withOpacity(0.4),
                    shape: BoxShape.circle,
                  ),
                  child: InkWell(
                    onTap: () {
                      controller.managefavorites(productId);
                    },
                    child: controller.isFavorites(productId)
                        ? Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 20,
                          )
                        : Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                            size: 20,
                          ),
                  ),
                );
              })
            ],
          ),
          Row(
            children: [
              TextUtils(
                text: "$rate",
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              RatingBar(
                initialRating: rate,
                minRating: 1,
                maxRating: 5,
                itemCount: 5,
                itemSize: 25,
                itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                ratingWidget: RatingWidget(
                  full: Icon(Icons.star, color: Colors.amber),
                  half: Icon(Icons.star_half, color: Colors.amber),
                  empty: Icon(Icons.star_border, color: Colors.amber),
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ReadMoreText(
            description,
            trimLength: 200,
            textAlign: TextAlign.justify,
            lessStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            moreStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
            style: TextStyle(
              fontSize: 16,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
