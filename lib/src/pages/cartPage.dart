import 'package:gifty/src/config/appTheme.dart';
import 'package:gifty/src/controllers/cartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifty/src/pages/paymentPage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final cartController = Get.put(CartController(), permanent: true);

  final TextEditingController discountController = TextEditingController();

  @override
  void dispose() {
    cartController.discountPrice.value = 0;
    cartController.isCouponeUsed.value = false;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'My Cart',
          style: TextStyle(
            // fontSize: 22,
            // fontWeight: FontWeight.bold,
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
                                            clipBehavior: Clip.none,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(
                                                  left: 50,
                                                  right: 20,
                                                  top: 25,
                                                ),
                                                padding: EdgeInsets.only(
                                                  left: 20,
                                                  right: 20,
                                                  bottom: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    width: 1,
                                                    color: Color(0xFFedeaf2),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
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
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
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
                                                                fontSize: 14,
                                                                color: Color(
                                                                    0xFFBED5B9),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              '${item.quantity}x',
                                                              style: TextStyle(
                                                                fontSize: 14,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Column(
                                                      children: [
                                                        Container(
                                                          // color: Colors.amber,
                                                          height: 35,
                                                          child: IconButton(
                                                            icon: Icon(
                                                              Icons.add,
                                                              color: Color(
                                                                  0xFFC2C2C2),
                                                              size: 18,
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
                                                        ),
                                                        Text(
                                                          '${item.quantity}',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        Container(
                                                          // color: Colors.amber,
                                                          height: 35,
                                                          child: IconButton(
                                                            icon: Icon(
                                                              Icons.remove,
                                                              color: Color(
                                                                  0xFFC2C2C2),
                                                              size: 18,
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
                                                        ),
                                                        // Icon(Icons.add),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Positioned(
                                                left: 15,
                                                top: 28,
                                                child: Container(
                                                  // color: Colors.amber,
                                                  width: 90,
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
                        ],
                      ),
              ),
              if (cartController.carts.isNotEmpty)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 10,
                      right: 20,
                      bottom: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Flexible(
                          child: TextField(
                            cursorColor: AppTheme.color1,
                            cursorWidth: 2.0,
                            cursorHeight: 20.0,
                            controller: discountController,
                            decoration: InputDecoration(
                              hintText: "Coupon code",
                            ),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        SizedBox(
                          width: 35.0,
                        ),
                        Flexible(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: AppTheme.color1,
                              primary: Colors.black,
                              padding: EdgeInsets.symmetric(
                                vertical: 4.0,
                                horizontal: 8.0,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(35.0),
                              ),
                              shadowColor: Colors.black.withOpacity(.2),
                            ),
                            onPressed: () async {
                              if (discountController.text.isNotEmpty) {
                                int discount = await cartController.applyCoupon(
                                  context,
                                  discountController.text,
                                  cartController.getTotalCartPrice(),
                                );
                                if (discount != null) {
                                  setState(() {
                                    cartController.isCouponeUsed.value = true;
                                    cartController.discountPrice.value =
                                        discount;
                                  });
                                }
                              }
                            },
                            child: Text(
                              'Apply Coupon',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: cartController.carts.isEmpty
          ? SizedBox()
          : BottomAppBar(
              child: Obx(
                () => Container(
                  height: cartController.discountPrice.value > 0 ? 155 : 130,
                  color: AppTheme.color1,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Items',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            cartController.carts.length.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      if (cartController.isCouponeUsed.value)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discount',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '\৳ ${cartController.discountPrice.toString()}',
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '\৳ ${cartController.getTotalCartPrice() - cartController.discountPrice.value}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        width: Get.width / 1.5,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            primary: Colors.black,
                            padding: EdgeInsets.symmetric(
                              vertical: 4.0,
                              horizontal: 8.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35.0),
                            ),
                            shadowColor: Colors.black.withOpacity(.2),
                          ),
                          onPressed: () {
                            Get.to(
                              PaymentPage(),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Proceed to Checkout',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Icon(
                                Icons.trending_flat,
                                color: Colors.black54,
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
            ),
    );
  }
}
