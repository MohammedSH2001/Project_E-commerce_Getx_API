import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/catogrey_controller.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/category/category_items.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});
  final controller = Get.find<CatogreyController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isCatogreyLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    controller.getCategoryIndex(index);
                    Get.to(() => CategoryItems(titleName: controller.gatogreyList[index],));
                  },
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                          controller.imageCategory[index],
                        ),
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        bottom: 10,
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Text(
                            controller.gatogreyList[index],
                            style: TextStyle(
                              backgroundColor: Colors.black38,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              itemCount: controller.gatogreyList.length),
        );
      }
    });
  }
}
