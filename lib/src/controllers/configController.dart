import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

class ConfigController extends GetxController {
  Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp();
  }
}
