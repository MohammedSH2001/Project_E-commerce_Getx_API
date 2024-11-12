import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  final key = 'isDarkMode';
  saveThemeDataInBox(bool isDark) {
    boxStorage.write(key, isDark);
  }

  bool getThemeDataFromBox() {
    return boxStorage.read<bool>(key) ?? false;
  }

  ThemeMode get themeDataGet =>
      getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;

  void changesTheme() {
    Get.changeTheme(getThemeDataFromBox() ? ThemeApp.light : ThemeApp.dart);
    saveThemeDataInBox(!getThemeDataFromBox());
  }
}
