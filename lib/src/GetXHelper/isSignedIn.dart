import 'package:gifty/src/controllers/firebaseController.dart';
import 'package:gifty/src/pages/homePage.dart';
import 'package:gifty/src/pages/loginPage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class IsSignedIn extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Get.find<FirebaseController>().user != null
          ? HomePage()
          : LoginPage();
    });
  }
}
