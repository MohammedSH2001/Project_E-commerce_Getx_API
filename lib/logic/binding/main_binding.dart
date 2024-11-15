import 'package:flutter_api_getx_matjer/logic/controller/main_controller.dart';
import 'package:flutter_api_getx_matjer/logic/controller/payment_controller.dart';
import 'package:flutter_api_getx_matjer/logic/controller/setteing_controller.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(SetteingController());
    Get.put(PaymentController(),permanent: true);
  }
}
