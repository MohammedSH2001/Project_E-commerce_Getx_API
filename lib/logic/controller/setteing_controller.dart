import 'package:flutter_api_getx_matjer/utils/my_validation_string.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SetteingController extends GetxController {
  var switchValue = false.obs;
  var storage = GetStorage();
  var langlocal = eng;
  String capitlize(String profileName) {
    return profileName.split(" ").map((name) => name.capitalize).join(" ");
  }

//language

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    langlocal = await getLanguage;
  }

  void saveLanguage(String lang) async {
    await storage.write("lang", lang);
  }

  Future<String>get getLanguage async {
    return await storage.read("lang");
  }

  void changeLanguage(String typeLanguage) {
    if (langlocal == typeLanguage) {
      return;
    } else if (typeLanguage == fra) {
      langlocal = fra;
      saveLanguage(fra);
    } else if (typeLanguage == ara) {
      langlocal = ara;
      saveLanguage(ara);
    } else {
      langlocal = eng;
      saveLanguage(eng);
    }
    update();
  }
}
