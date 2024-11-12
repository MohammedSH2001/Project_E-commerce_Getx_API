import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/firebase_options.dart';
import 'package:flutter_api_getx_matjer/logic/controller/theme_controller.dart';
import 'package:flutter_api_getx_matjer/routes/routes.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.light,
      darkTheme: ThemeApp.dart,
      themeMode: ThemeController().themeDataGet,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>("auth") == true
          ? AppRoutes.mainSecreen
          : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
