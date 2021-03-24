import 'package:gifty/src/app.dart';
import 'package:gifty/src/controllers/configController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  await Get.put(ConfigController()).initApp();

  runApp(App());
}
