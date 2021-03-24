import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Aboutgifty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(
              left: 20,
              top: 35,
              right: 20,
              bottom: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
                Text(
                  'About gifty',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.shopping_bag_outlined,
                  size: 30,
                ),
              ],
            ),
          ),
          Center(
            child: Text('About gifty'),
          ),
        ],
      ),
    );
  }
}
