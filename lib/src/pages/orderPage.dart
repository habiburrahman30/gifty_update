import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gifty/src/config/appTheme.dart';
import 'package:gifty/src/controllers/firebaseController.dart';
import 'package:gifty/src/pages/homePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifty/src/pages/orderItemsPage.dart';
import 'package:lottie/lottie.dart';

class OrderPage extends StatelessWidget {
  final _firebaseController = Get.put(FirebaseController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'My Order',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 28,
            color: Colors.black,
          ),
          SizedBox(
            width: 20.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Column(
            children: [
              StreamBuilder(
                stream: _firebaseController.getUserOrders(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.data.docs.length == 0) {
                    return Center(
                      child: Container(
                        height: height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Lottie.asset(
                                'assets/images/empty-box.json',
                                width: 280,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'Sorry, No Order Found!',
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                            SizedBox(
                              height: 15,
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
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                color: AppTheme.color1,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Return to home page',
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
                            SizedBox(
                              height: 130,
                            )
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      // height: 500,
                      child: ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (BuildContext context, int index) {
                          final item = snapshot.data.docs[index];

                          return InkWell(
                            onTap: () {
                              Get.to(
                                () => OrderItemsPage(
                                  orderItems: item['orderItems'],
                                ),
                              );
                            },
                            child: Container(
                              height: 130,
                              margin: EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.0,
                                vertical: 10.0,
                              ),
                              decoration: BoxDecoration(
                                color: AppTheme.color1.withOpacity(0.9),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                  SizedBox(
                                    width: 20.0,
                                  ),
                                  Container(
                                    width: Get.width - 200,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Text(
                                          'Order id: ${item['orderId'].toString().substring(12)}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          'Delivery Date: ${item['deliveryDate']}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.white,
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 6.0,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'Status:',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                fontWeight: FontWeight.w800,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 10.0,
                                                vertical: 3.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: item['pending']
                                                    ? Colors.amber[700]
                                                    : Colors.green[400],
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: Text(
                                                '${item['pending'] ? 'Pending' : 'Delivered'}',
                                                style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
