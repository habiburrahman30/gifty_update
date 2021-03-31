import 'package:gifty/src/components/drawer.dart';
import 'package:gifty/src/controllers/cartController.dart';
import 'package:gifty/src/controllers/firebaseController.dart';
import 'package:gifty/src/models/cartModel.dart';
import 'package:gifty/src/pages/cartPage.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatelessWidget {
  final String id;
  ProductDetailsPage({@required this.id});

  final _firebasecontroller = Get.put(FirebaseController());
  final _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerComponent(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: StreamBuilder<DocumentSnapshot>(
          stream: _firebasecontroller.getSingleProduct(
              collectionName: 'products', id: id),
          builder: (BuildContext context, snapshot) {
            final item = snapshot.data;
            // final rating = double.parse(item['rating']);
            // print(item.id);
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return Obx(
                () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Text('${snapshot.data.data()['price']}'),
                    SizedBox(
                      height: 40,
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
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
                          GestureDetector(
                            onTap: () {
                              scaffoldKey.currentState.openDrawer();
                            },
                            child: Icon(
                              Icons.sort,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      child: Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 360,
                              width: 360,
                              decoration: BoxDecoration(
                                color: Color(0xFFF56461).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(175),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 15,
                              ),
                              height: 330,
                              width: 330,
                              decoration: BoxDecoration(
                                color: Color(0xFFF56461).withOpacity(0.3),
                                borderRadius: BorderRadius.circular(175),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 32,
                              ),
                              height: 295,
                              width: 295,
                              decoration: BoxDecoration(
                                color: Color(0xFFF56461).withOpacity(0.5),
                                borderRadius: BorderRadius.circular(175),
                              ),
                              // child: CachedNetworkImage(
                              //   imageUrl: item['thumbnail'],
                              //   placeholder: (context, url) =>
                              //       CircularProgressIndicator(),
                              //   errorWidget: (context, url, error) =>
                              //       Icon(Icons.error),
                              // ),
                              child: Image.network(
                                "${item['thumbnail']}",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          RatingBarIndicator(
                            rating: 2.75,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 16.0,
                            direction: Axis.horizontal,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: Get.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      '${item['title']}',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    '\৳${item['price']}',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        width: 2.0,
                                        color: Color(0xFFD2D2D2),
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Type',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFFD2D2D2),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${item['type']}',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                ),
                                Container(
                                  padding: EdgeInsets.only(left: 10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        width: 2.0,
                                        color: Color(0xFFD2D2D2),
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Generecs',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFFD2D2D2),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${item['generecs']}',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '${item['description']}',
                            style: TextStyle(
                              color: Color(0xFF1f4c4d),
                              fontSize: 20,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          _cartController.checkCartExist(id: item.id) != null
                              ? FlatButton.icon(
                                  color: Color(0xFFEA4E5C),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  icon: Icon(
                                    Icons.shopping_basket_outlined,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'Add to bag',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {},
                                )
                              : FlatButton.icon(
                                  color: Color(0xFFFAC4C4),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  icon: Icon(
                                    Icons.shopping_basket_outlined,
                                    size: 30,
                                    color: Color(0xFFEA4E5C),
                                  ),
                                  label: Text(
                                    'Add to bag',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFFEA4E5C),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: () {
                                    final cart = Cart(
                                      id: item.id,
                                      title: item['title'],
                                      thumbnail: item['thumbnail'],
                                      details: item['description'],
                                      price: item['price'],
                                      quantity: 1,
                                      category: item['category'],
                                    );
                                    _cartController.addToCart(cart: cart);

                                    print(cart.id);
                                  },
                                ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFEA4E5C),
        child: Container(
          child: Stack(
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                size: 38,
              ),
              Obx(
                () => _cartController.carts.isEmpty
                    ? SizedBox()
                    : Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2,
                            ),
                            child: Text(
                              '${_cartController.carts.length}',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
        onPressed: () {
          Get.to(
            CartPage(),
          );
        },
      ),
    );
  }
}
