import 'package:flutter_api_getx_matjer/logic/controller/card_controller.dart';
import 'package:flutter_api_getx_matjer/logic/controller/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    Get.lazyPut(() => CardController());
  }
}
