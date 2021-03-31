import 'package:gifty/src/controllers/addressController.dart';
import 'package:gifty/src/controllers/cartController.dart';
import 'package:gifty/src/controllers/firebaseController.dart';
import 'package:gifty/src/pages/thankuPage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _cartController = Get.put(CartController());
    final _addressController = Get.put(AddressController());
    final _firebaseController = Get.put(FirebaseController());

    // _submitOrder() {
    //   Map<String, dynamic> uData = {
    //     "name": _addressController.allAddress[0].name,
    //     "phone": _addressController.allAddress[0].phone,
    //     "address": _addressController.allAddress[0].address,
    //     "delivery_date": _addressController.allAddress[0].date,
    //   };

    //   Map<String, dynamic> data = {
    //     "cartList": {
    //       "id": 1,
    //       "order_id": 'OTS00014',
    //       "status": 0,
    //       "create_at": DateTime.now(),
    //       "receivers_address": uData,
    //       "order": {
    //         "title": _cartController.carts,
    //         "price": _cartController.carts[0].price,
    //         "thumbnail": _cartController.carts[0].thumbnail,
    //         "quantity": _cartController.carts[0].quantity,
    //       },
    //     },
    //   };

    //   _firebaseController.addOrder(data, 'orders').then((value) {
    //     // _cartController.carts.clear();
    //     // _addressController.allAddress.clear();
    //     Get.to(
    //       ThankuPage(),
    //     );
    //   });
    // }

    _submitOrder() {
      Map<String, dynamic> uData = {
        "name": _addressController.allAddress[0].name,
        "phone": _addressController.allAddress[0].phone,
        "address": _addressController.allAddress[0].address,
        "delivery_date": _addressController.allAddress[0].date,
      };
      Map<String, dynamic> data = {
        "order": {
          "id": 1,
          "order_id": 'OTS00014',
          "status": 0,
          "create_at": DateTime.now(),
          "receivers_address": null,
          "product": {
            "title": _cartController.carts[0].title,
            "price": _cartController.carts[0].price,
            "thumbnail": _cartController.carts[0].thumbnail,
            "quantity": _cartController.carts[0].quantity,
          },
        },
      };

      _firebaseController.addOrder(data, 'orders').then((value) {
        _cartController.carts.clear();
        _addressController.allAddress.clear();

        Get.to(
          ThankuPage(),
        );
      });
    }

    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 15,
        ),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Send gift to:'.toUpperCase(),
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 6,
              child: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Name:'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'firstName',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Phone:'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'phone',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Address:'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'address',
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Your Order:'.toUpperCase(),
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              flex: 45,
              child: Container(
                // height: 300,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  primary: false,
                  shrinkWrap: true,
                  itemCount: _cartController.carts.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = _cartController.carts[index];

                    return SingleChildScrollView(
                      child: Stack(
                        overflow: Overflow.clip,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              left: 35,
                              bottom: 20,
                            ),
                            padding: EdgeInsets.only(
                              //horizontal: 20,
                              left: 20,
                              top: 10,
                              right: 10,
                              bottom: 10,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    // width: 240
                                    padding: EdgeInsets.only(
                                      left: 35,
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${item.title}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${item.quantity}x',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      '\৳${item.price}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFFBED5B9),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            left: -10,
                            top: -5,
                            child: Image.network(
                              '${item.thumbnail}',
                              width: 100,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
              padding: EdgeInsets.only(
                top: 10,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order Total',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${_cartController.getTotalCartPrice()}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
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
                      color: Color(0xFF4F8188),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Submit Order',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        _submitOrder();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UserData extends StatelessWidget {
  const UserData({
    Key key,
    this.labelText,
    this.titleText,
  }) : super(key: key);
  final String labelText;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(44),
        border: Border.all(
          color: Colors.grey[400],
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            labelText ?? 'Text',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            child: Row(
              children: [
                Text(
                  titleText ?? 'Title Text',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
