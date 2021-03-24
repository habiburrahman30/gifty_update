import 'package:gifty/src/controllers/firebaseController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrackOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _firebaseController = Get.put(FirebaseController());
    return Scaffold(
      body: Container(
        child: Column(
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
                    'Track Orders',
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
            StreamBuilder(
              stream: _firebaseController.getUserOrder('orders'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                // final item = snapshot.data;
                // print(item['cartList']);
                if (!snapshot.hasData) {
                  return Text('No');
                } else {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 25.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          offset: Offset(0, 0),
                          blurRadius: 10.0,
                        )
                      ],
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'Order#:',
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Divider(),
                        ListView.builder(
                          primary: false,
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            // final item = snapshot.data.docs[index];

                            return Stack(
                              overflow: Overflow.clip,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 80,
                                    right: 20,
                                    top: 25,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xFFedeaf2),
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // width: 240,
                                        padding: EdgeInsets.only(
                                          left: 35,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'title lastSignInTime',
                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              '\$25',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xFFBED5B9),
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              '2x',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: -8,
                                  top: 28,
                                  child: Container(
                                    // color: Colors.amber,
                                    width: 140,
                                    child: Image.network(
                                      'https://firebasestorage.googleapis.com/v0/b/gifty-2e899.appspot.com/o/flower-transparent.png?alt=media',
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
