import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_getx_matjer/routes/routes.dart';
import 'package:flutter_api_getx_matjer/utils/them.dart';
import 'package:flutter_api_getx_matjer/view/widget/sherd/snak_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  bool isVisibality = false;
  bool isCheck = false;
  var displyUserName = '';
  FirebaseAuth auth = FirebaseAuth.instance;
  var googleSignIn = GoogleSignIn();
  String displyUserPhote = '';
  var isSignedIn = false;
  final GetStorage authBox = GetStorage();

  void visibality() {
    isVisibality = !isVisibality;
    update();
  }

  void check() {
    isCheck = !isCheck;
    update();
  }

  void signUpusingFirebase(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displyUserName = name;
        auth.currentUser!.updateDisplayName(name);
      });

      update();
      Get.offNamed(Routes.mainSecreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll('-', ' ').capitalize!;
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'ERROR',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    }
  }

  void logINusingFirebase(
      {required String email, required String password}) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => displyUserName = auth.currentUser!.displayName!);
      isSignedIn = true;
      authBox.write("auth", isSignedIn);

      update();
      Get.offNamed(Routes.mainSecreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll('-', ' ').capitalize!;
      String message = '';
      if (e.code == 'email-already-in-use') {
        message =
            'Account dors not exists for thet $email ..Create your account by sign up ..';
      } else if (e.code == 'weak-password') {
        message = 'Invalid Password...Please try agin!';
      } else {
        message = e.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'ERROR!',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);

      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll('-', ' ').capitalize!;
      String message = '';
      if (e.code == 'email-already-in-use') {
        message =
            'Account dors not exists for thet $email ..Create your account by sign up ..';
      } else {
        message = e.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'ERROR!',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    }
  }

  void googleSignUpApp() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      displyUserName = googleUser!.displayName!;
      displyUserPhote = googleUser.photoUrl!;
      isSignedIn = true;
      authBox.write("auth", isSignedIn);

      update();
      Get.offNamed(Routes.mainSecreen);
    } catch (e) {
      Get.snackbar(
        'ERROR!',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    }
  }

  void faceBookSignUpApp() {}

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      displyUserName = '';
      displyUserPhote = '';
      isSignedIn = false;
      authBox.remove("auth");

      update();
      Get.offNamed(Routes.welcomeSecreen);
    } catch (e) {
      Get.snackbar(
        'ERROR!',
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: mainColor,
        colorText: Colors.white,
      );
    }
  }
}
