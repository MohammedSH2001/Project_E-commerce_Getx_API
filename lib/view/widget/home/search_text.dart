import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/logic/controller/product_controller.dart';
import 'package:get/get.dart';

class SearchText extends StatelessWidget {
  SearchText({super.key});

  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (_) => TextField(
        controller: controller.searchTextController,
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        onChanged: (searchName) {
          controller.addSearchToList(searchName);
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.red,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon:controller.searchTextController.text.isNotEmpty? IconButton(
            onPressed: () {
              controller.clearSearch();
            },
            icon: Icon(Icons.close)
          ):null,
          hintText: "Search' with name & price",
          hintStyle: TextStyle(
            color: Colors.black45,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(13)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(13)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(13)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(13)),
        ),
      ),
    );
  }
}
