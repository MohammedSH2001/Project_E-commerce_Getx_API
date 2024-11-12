import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_api_getx_matjer/logic/controller/product_controller.dart';
import 'package:get/get.dart';

class FavoritesSecreen extends StatelessWidget {
  FavoritesSecreen({super.key});
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Obx(() {
        if (controller.favoritesList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('2.1 images/images/heart.png'),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Please, Add you Favorites Products.",
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        } else {
          return ListView.separated(
              itemBuilder: (context, index) {
                return BuilddFavItem(
                  image: controller.favoritesList[index].image,
                  title: controller.favoritesList[index].title,
                  price: controller.favoritesList[index].price,
                  productID: controller.favoritesList[index].id,
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey,
                  thickness: 2,
                );
              },
              itemCount: controller.favoritesList.length);
        }
      }),
    );
  }

  Widget BuilddFavItem(
      {required String image,
      required String title,
      required double price,
      required int productID}) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            SizedBox(
              child: Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$ $price",
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ],
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                controller.managefavorites(productID);
              },
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
