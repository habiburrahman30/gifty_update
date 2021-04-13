import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gifty/src/components/order.dart';
import 'package:gifty/src/components/shipping.dart';
import 'package:gifty/src/config/appTheme.dart';
import 'package:gifty/src/controllers/orderController.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final _orderC = Get.put(OrderController());

  @override
  void dispose() {
    _orderC.cashOnDelivery.value = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: AppTheme.color1.withOpacity(.9),
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 17,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Shipping',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.payments_outlined,
                            size: 17,
                            color: Colors.white.withOpacity(.8),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Payment',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withOpacity(.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Icon(
                            Icons.shopping_basket_outlined,
                            color: Colors.white.withOpacity(.8),
                            size: 17,
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            'Order',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withOpacity(.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Obx(
            () => LinearPercentIndicator(
              width: Get.width,
              lineHeight: 6,
              percent: _orderC.getProgress(),
              backgroundColor: Colors.grey.withOpacity(.4),
              progressColor: Color(0xFFCA1F50),
              padding: EdgeInsets.zero,
            ),
          ),
          // ignore: missing_return
          Obx(() {
            if (_orderC.step.value == 1)
              return Expanded(
                child: Shipping(),
              );
            if (_orderC.step.value == 2)
              return Expanded(
                child: Column(
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
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            SvgPicture.asset(
                              'assets/svg/BKashLogo.svg',
                              height: 80,
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
                          // _orderC.manageCashOnDelivery();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Checkbox(
                              value: _orderC.cashOnDelivery.value,
                              onChanged: (v) {
                                _orderC.manageCashOnDelivery();
                              },
                            ),
                            Text(
                              'Cash on Delivery',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // SizedBox(
                            //   width: 30.0,
                            // ),
                            Icon(
                              Icons.payment,
                              size: 45.0,
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
                          backgroundColor: _orderC.checkValidation()
                              ? AppTheme.color1
                              : AppTheme.color1.withOpacity(.6),
                          primary: Colors.white,
                          padding: EdgeInsets.symmetric(
                            vertical: 6.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(35.0),
                          ),
                        ),
                        onPressed: () => _orderC.next(3),
                        // onPressed: _orderC.checkCashOnDelivery()
                        //     ? null
                        //     : () => _orderC.next(3),
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
                    // SizedBox(
                    //   height: 50.0,
                    // ),
                    // Center(
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(30),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.grey.withOpacity(0.6),
                    //           offset: Offset(0, 15),
                    //           blurRadius: 30.0,
                    //         )
                    //       ],
                    //     ),
                    //     child: TextButton.icon(
                    //       onPressed: () => _orderC.next(3),
                    //       style: ButtonStyle(
                    //         backgroundColor: MaterialStateProperty.all<Color>(
                    //           _orderC.checkValidation()
                    //               ? AppTheme.color1
                    //               : AppTheme.color1.withOpacity(.6),
                    //         ),
                    //         shape: MaterialStateProperty.all(
                    //           StadiumBorder(),
                    //         ),
                    //         padding: MaterialStateProperty.all<EdgeInsets>(
                    //           EdgeInsets.symmetric(
                    //             horizontal: 14,
                    //             vertical: 5,
                    //           ),
                    //         ),
                    //       ),
                    //       icon: Icon(
                    //         Icons.trending_flat,
                    //         color: Colors.white,
                    //         size: 35,
                    //       ),
                    //       label: Text(
                    //         'Next',
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 18,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              );
            if (_orderC.step.value == 3)
              return Expanded(
                child: Order(),
              );
            // return Expanded(
            //   child: Column(
            //     children: [
            //       Center(
            //         child: Text('Order step'),
            //       ),
            //       Center(
            //         child: Container(
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(30),
            //             boxShadow: [
            //               BoxShadow(
            //                 color: Colors.grey.withOpacity(0.6),
            //                 offset: Offset(0, 15),
            //                 blurRadius: 30.0,
            //               )
            //             ],
            //           ),
            //           child: TextButton.icon(
            //             onPressed: _orderC.checkValidation()
            //                 ? () => _orderC.orderNow()
            //                 : null,
            //             style: ButtonStyle(
            //               backgroundColor: MaterialStateProperty.all<Color>(
            //                 _orderC.checkValidation()
            //                     ? AppTheme.color1
            //                     : AppTheme.color1.withOpacity(.6),
            //               ),
            //               shape: MaterialStateProperty.all(
            //                 StadiumBorder(),
            //               ),
            //               padding: MaterialStateProperty.all<EdgeInsets>(
            //                 EdgeInsets.symmetric(
            //                   horizontal: 14,
            //                   vertical: 5,
            //                 ),
            //               ),
            //             ),
            //             icon: Icon(
            //               Icons.trending_flat,
            //               color: Colors.white,
            //               size: 35,
            //             ),
            //             label: Text(
            //               'Next',
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontSize: 18,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // );
          })
        ],
      ),
    );
  }
}
