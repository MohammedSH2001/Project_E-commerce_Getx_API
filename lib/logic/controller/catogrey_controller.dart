import 'package:flutter_api_getx_matjer/model/model_product.dart';
import 'package:flutter_api_getx_matjer/services/catogrey_service.dart';
import 'package:get/get.dart';

class CatogreyController extends GetxController {
  var gatogreyList = <String>[].obs;
  var isCatogreyLoading = false.obs;
  var isAllCatogrey = false.obs;

  var catogreyMyList = <ProductModels>[].obs;

  List<String> imageCategory = [
    "https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
  ];

  @override
  void onInit() {
    super.onInit();
    getCatogreys();
  }

  void getCatogreys() async {
    var catogreyName = await CatogreyService.getGatogrey();

    try {
      isCatogreyLoading(true);
      if (catogreyName.isNotEmpty) {
        gatogreyList.addAll(catogreyName);
      }
    } finally {
      isCatogreyLoading(false);
    }
  }

  getAllCatogreys(String nameCatogry) async {
    isAllCatogrey(true);
    catogreyMyList.value = await AllCategoryService.getCatogery(nameCatogry);
    isAllCatogrey(false);
  }

  getCategoryIndex(int index) async {
    var catogeryAllName = await getAllCatogreys(gatogreyList[index]);
    if (catogeryAllName != null) {
      catogreyMyList = catogeryAllName;
    }
  }
}
