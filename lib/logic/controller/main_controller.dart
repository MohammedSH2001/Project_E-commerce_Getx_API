import 'package:flutter_api_getx_matjer/view/screen/catogery_secreen.dart';
import 'package:flutter_api_getx_matjer/view/screen/favorites_secreen.dart';
import 'package:flutter_api_getx_matjer/view/screen/home_secreen.dart';
import 'package:flutter_api_getx_matjer/view/screen/setting_secreen.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeSecreen(),
    CatogerySecreen(),
    FavoritesSecreen(),
    SettingSecreen(),
  ].obs;

  final title = [
    "Suiko Shop",
    "Catogrey",
    "Favorites",
    "Setting",
  ].obs;
}
