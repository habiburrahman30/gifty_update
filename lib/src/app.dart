import 'package:gifty/src/GetXHelper/InstanceBinding.dart';
import 'package:gifty/src/GetXHelper/isSignedIn.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'gifty',
      debugShowCheckedModeBanner: false,
      initialBinding: InstanceBinding(),
      home: IsSignedIn(),
    );
  }
}
