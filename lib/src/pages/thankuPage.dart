import 'package:gifty/src/config/appTheme.dart';
import 'package:gifty/src/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThankuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: Colors.green[400],
                  width: 2,
                ),
              ),
              child: Icon(
                Icons.done_rounded,
                size: 50,
                color: Colors.green[400],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Congratulations. \nYour order has been placed.',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'We will send you notification about the update',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    offset: Offset(0, 15),
                    blurRadius: 30.0,
                  )
                ],
              ),
              child: RaisedButton(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                color: AppTheme.color1,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Keep Shopping',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                onPressed: () {
                  Get.to(
                    HomePage(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
