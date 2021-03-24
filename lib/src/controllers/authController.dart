import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gifty/src/pages/homePage.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;

// for registration
  final fullName = ''.obs;
  final email = ''.obs;
  final password = ''.obs;

  // -------------------------------

// for login

  final emailLogin = ''.obs;
  final passwordLogin = ''.obs;
  // -------------------------------

  void login() async {
    try {
      final authResult = await _auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      if (authResult != null) {
        Get.offAll(HomePage());
      } else {
        Get.snackbar("Email or password wrong", '');
      }
    } catch (e) {
      Get.snackbar("Email or password wrong", '');
    }
  }

  void register() async {
    try {
      final user = (await _auth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      ))
          .user;

      if (user != null) {
        Map<String, dynamic> userdata = {
          'uid': user.uid,
          "fullName": fullName.value,
          "email": email.value,
          "imgUrl": null,
          "phone": null,
          "address": null,
        };
        await FirebaseFirestore.instance.collection("users").add(userdata);
        Get.offAll(HomePage());
      } else {
        Get.snackbar("Error while creating account ", '');
      }
    } catch (e) {
      Get.snackbar("Unknown error", '');
    }
  }
}
