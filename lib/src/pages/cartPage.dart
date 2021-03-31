import 'package:gifty/src/controllers/cartController.dart';
import 'package:gifty/src/pages/checkoutPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifty/src/pages/paymentPage.dart';

class CartPage extends StatelessWidget {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Obx(
          () => Stack(
            children: [
              Positioned.fill(
                child: cartController.carts.isEmpty
                    ? Center(
                        child: Text(
                          'Cart is empty',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      )
                    : Column(
                        children: [
                          Expanded(
                            flex: 9,
                            child: Container(
                              // decoration: BoxDecoration(
                              //   color: Colors.green,
                              // ),
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 50,
                                    ),
                                    ListView.builder(
                                      primary: false,
                                      shrinkWrap: true,
                                      itemCount: cartController.carts.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final item =
                                            cartController.carts[index];
                                        // var cartid = int.parse(item.id);
                                        return Dismissible(
                                          onDismissed: (direction) async {
                                            cartController.removeCart(
                                                id: item.id);

                                            Get.snackbar(
                                              'Removed Succeded',
                                              '${item.title}',
                                              icon: Icon(
                                                Icons.done_all,
                                              ),
                                              backgroundColor:
                                                  Colors.green[400],
                                              colorText: Colors.white,
                                              snackPosition: SnackPosition.TOP,
                                            );
                                          },
                                          background: Container(
                                            color: Colors.red,
                                          ),
                                          key: UniqueKey(),
                                          child: Stack(
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
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        // width: 220,
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 35,
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              '${item.title}',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            Text(
                                                              '\৳${item.price}',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                color: Color(
                                                                    0xFFBED5B9),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
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
                                                        IconButton(
                                                          icon: Icon(
                                                            Icons.add,
                                                            color: Color(
                                                                0xFFC2C2C2),
                                                            size: 25,
                                                          ),
                                                          onPressed: () {
                                                            cartController
                                                                .updateQuantity(
                                                              id: int.parse(
                                                                  item.id),
                                                              type: 1,
                                                            );
                                                            // print(
                                                            //     int.parse(
                                                            //       item.id),);
                                                          },
                                                        ),
                                                        Text(
                                                          '${item.quantity}',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        IconButton(
                                                          icon: Icon(
                                                            Icons.remove,
                                                            color: Color(
                                                                0xFFC2C2C2),
                                                            size: 25,
                                                          ),
                                                          onPressed: () {
                                                            cartController
                                                                .updateQuantity(
                                                              id: int.parse(
                                                                  item.id),
                                                              type: 0,
                                                            );
                                                            // print(int.parse(item.id));
                                                          },
                                                        ),
                                                        // Icon(Icons.add),
                                                      ],
                                                    )
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
                                                    '${item.thumbnail}',
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              width: Get.width,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                color: Color(0xFFEA4E5C),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Items',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        cartController.carts.length.toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Total',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '\৳ ${cartController.getTotalCartPrice()}',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  FlatButton.icon(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 8,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    label: Text(
                                      'Proceed to Checkout',
                                      style: TextStyle(
                                        //color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    color: Colors.white,
                                    icon: Icon(
                                      Icons.shopping_cart_outlined,
                                      //color: Colors.white,
                                    ),
                                    onPressed: () {
                                      Get.to(
                                        PaymentPage(),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
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
                        'My Cart',
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
