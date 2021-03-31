import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifty/src/components/shipping.dart';
import 'package:gifty/src/config/appTheme.dart';
import 'package:gifty/src/controllers/orderController.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PaymentPage extends StatelessWidget {
  final _orderC = Get.put(OrderController());

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
              progressColor: AppTheme.progressColor,
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
                child: Center(
                  child: Text('Payment step'),
                ),
              );
          })
        ],
      ),
    );
  }
}
