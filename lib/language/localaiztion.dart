import 'package:flutter_api_getx_matjer/language/arabic.dart';
import 'package:flutter_api_getx_matjer/language/english.dart';
import 'package:flutter_api_getx_matjer/language/france.dart';
import 'package:flutter_api_getx_matjer/utils/my_validation_string.dart';
import 'package:get/get.dart';

class LocalaiztionApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ara: ar,
        eng: en,
        fra: fr,
      };
}
