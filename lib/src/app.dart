import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gifty/src/GetXHelper/InstanceBinding.dart';
import 'package:gifty/src/GetXHelper/isSignedIn.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'gifty',
      debugShowCheckedModeBanner: false,
      initialBinding: InstanceBinding(),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    displaySplash();
  }

  displaySplash() {
    Timer(Duration(seconds: 1020), () async {
      Get.to(
        () => IsSignedIn(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Container(
            child: Image.asset(
              'assets/images/gifty.png',
              width: 200,
            ),
            // child: SvgPicture.asset(
            //   'assets/svg/logo.svg',
            //   width: 250,
            // ),
          ),
        ),
      ),
    );
  }
}
