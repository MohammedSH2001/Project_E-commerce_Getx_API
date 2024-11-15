import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/model/model_product.dart';
import 'package:flutter_api_getx_matjer/services/product_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var isLoding = true.obs;
  var favoritesList = <ProductModels>[].obs;
  var storage = GetStorage();

  //Search
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    List? storsgeShoppings = storage.read<List>("isFavoritesList");
    if (storsgeShoppings != null) {
      favoritesList =
          storsgeShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getproduct();
  }

  void getproduct() async {
    var products = await ProductService.getProduct();

    try {
      isLoding(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoding(false);
    }
    ;
  }

  void managefavorites(int productID) async {
    var existingIndex =
        favoritesList.indexWhere((element) => element.id == productID);
    if (existingIndex >= 0) {
      favoritesList.removeAt(existingIndex);
      await storage.remove("isFavoritesList");
    } else {
      favoritesList
          .add(productList.firstWhere((element) => element.id == productID));
      await storage.write("isFavoritesList", favoritesList);
    }
  }

  bool isFavorites(int productID) {
    return favoritesList.any((element) => element.id == productID);
  }




// Search bar logic

  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();
    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSearchToList("");
  }
}
