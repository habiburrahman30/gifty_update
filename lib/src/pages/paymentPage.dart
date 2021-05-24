import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifty/src/components/order.dart';
import 'package:gifty/src/components/payment.dart';
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
        title: Text(
          'Checkout',
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
                child: Payment(),
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
