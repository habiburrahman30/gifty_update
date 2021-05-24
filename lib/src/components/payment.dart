import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gifty/src/config/appTheme.dart';
import 'package:gifty/src/controllers/orderController.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final _orderC = Get.put(OrderController());

  @override
  void dispose() {
    _orderC.cashOnDelivery.value = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Obx(
        () => Column(
          children: [
            SizedBox(
              height: 100.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    offset: Offset(0, 8),
                    blurRadius: 30.0,
                  ),
                ],
              ),
              width: Get.width,
              child: TextButton(
                style: TextButton.styleFrom(
                  // backgroundColor: AppTheme.color1,
                  backgroundColor: Colors.white,
                  primary: Colors.black,
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  shadowColor: Colors.black.withOpacity(.2),
                ),
                onPressed: () {
                  print('Ok:Habib');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Checkbox(
                    //   value: true,
                    //   onChanged: (v) {},
                    // ),
                    Text(
                      'bKash payment',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    SvgPicture.asset(
                      'assets/svg/BKashLogo.svg',
                      height: 65,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    offset: Offset(0, 8),
                    blurRadius: 30.0,
                  ),
                ],
              ),
              width: Get.width,
              child: TextButton(
                style: TextButton.styleFrom(
                  // backgroundColor: AppTheme.color1,
                  backgroundColor: Colors.white,
                  primary: Colors.black,
                  padding: EdgeInsets.symmetric(
                    vertical: 22.0,
                    horizontal: 20.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  shadowColor: Colors.black.withOpacity(.2),
                ),
                onPressed: () {
                  _orderC.manageCashOnDelivery();
                  print(_orderC.checkCashOnDelivery());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: _orderC.cashOnDelivery.value,
                      onChanged: (v) {
                        _orderC.manageCashOnDelivery();
                        print('Cash on Delivery');
                      },
                    ),
                    Text(
                      'Cash on Delivery',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      width: 30.0,
                    ),
                    Icon(
                      Icons.payment,
                      size: 35.0,
                      color: AppTheme.color1.withOpacity(.9),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Container(
              width: Get.width / 3.3,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    offset: Offset(0, 8),
                    blurRadius: 30.0,
                  ),
                ],
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  // backgroundColor: AppTheme.color1,
                  backgroundColor: _orderC.checkCashOnDelivery()
                      ? AppTheme.color1.withOpacity(.6)
                      : AppTheme.color1,
                  primary: Colors.white,
                  padding: EdgeInsets.symmetric(
                    vertical: 6.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35.0),
                  ),
                ),
                onPressed: _orderC.checkCashOnDelivery()
                    ? null
                    : () => _orderC.next(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Next',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Icon(
                      Icons.trending_flat,
                      color: Colors.white,
                      size: 35,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
