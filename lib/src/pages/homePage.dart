import 'package:cached_network_image/cached_network_image.dart';
import 'package:gifty/src/components/drawer.dart';
import 'package:gifty/src/controllers/cartController.dart';
import 'package:gifty/src/controllers/firebaseController.dart';
import 'package:gifty/src/models/cartModel.dart';
import 'package:gifty/src/pages/cartPage.dart';
import 'package:gifty/src/pages/productDetailsPage.dart';
// import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String menuName = 'Flowers';
  final _firebaseController = Get.put(FirebaseController());

  final _cartController = Get.put(CartController());

  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: Color(0xFFFEF2F2),
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Color(0xFFFEF2F2),
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {
                  scaffoldKey.currentState.openDrawer();
                },
                icon: Icon(Icons.sort),
                color: Color(0xFF2D2D2D),
              ),
            ),
          ],
        ),
        drawer: DrawerComponent(),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 150),
                  child: Text(
                    'Swipe for next Gift',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.transparent,
                  unselectedLabelColor: Colors.grey[350],
                  labelColor: Color(0xFFEA4E5C),
                  physics: BouncingScrollPhysics(),
                  onTap: (int index) {
                    setState(() {
                      switch (index) {
                        case 1:
                          menuName = 'Search';
                          break;
                        case 2:
                          menuName = 'Popular';
                          break;
                        case 3:
                          menuName = 'Featured';
                          break;
                        default:
                      }
                    });
                  },
                  labelStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: [
                    Tab(
                      child: Text('Gifts '),
                    ),
                    Tab(
                      child: Text('Search'),
                    ),
                    Tab(
                      child: Text('Popular'),
                    ),
                    Tab(
                      child: Text('Featured'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                height: 490,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    StreamBuilder(
                      stream: _firebaseController.getData('products'),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Container(
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot item =
                                    snapshot.data.docs[index];
                                // final rating = double.parse(item['rating']);

                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      ProductDetailsPage(
                                        id: item.id,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20),
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF56461),
                                      borderRadius: BorderRadius.circular(180),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                  vertical: 15,
                                                ),
                                                height: 220,
                                                width: 220,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFEF2F2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          125),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: const Color(
                                                              0xcc000000)
                                                          .withOpacity(0.5),
                                                      offset: Offset(3, 5),
                                                      blurRadius: 20,
                                                    ),
                                                  ],
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl: item['thumbnail'],
                                                  placeholder: (context, url) =>
                                                      CircularProgressIndicator(),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              bottom: 20,
                                              child: GestureDetector(
                                                onTap: () {
                                                  if (_cartController
                                                          .checkCartExist(
                                                              id: item.id) !=
                                                      null) {
                                                    Get.snackbar(
                                                      'Opps!!',
                                                      '${item['title']} already exists in your cart',
                                                      icon: Icon(
                                                        Icons.done_all,
                                                        color: Colors.white,
                                                      ),
                                                      colorText: Colors.white,
                                                      backgroundColor:
                                                          Colors.green[300],
                                                      snackPosition:
                                                          SnackPosition.TOP,
                                                    );
                                                  } else {
                                                    final cart = Cart(
                                                      id: item.id,
                                                      title: item['title'],
                                                      thumbnail:
                                                          item['thumbnail'],
                                                      details:
                                                          item['description'],
                                                      price: item['price'],
                                                      quantity: 1,
                                                      category:
                                                          item['category'],
                                                    );
                                                    cartController.addToCart(
                                                        cart: cart);
                                                  }
                                                },
                                                child: CircleAvatar(
                                                  maxRadius: 35,
                                                  backgroundColor: Colors.white
                                                      .withOpacity(0.7),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 5,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      'assets/svg/cart-plus.svg',
                                                      width: 35,
                                                      color: Color(0xFFEA4E5C),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 45,
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RatingBarIndicator(
                                                rating: 2.5,
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                itemSize: 16.0,
                                                direction: Axis.horizontal,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${item['category']}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: 180,
                                                child: Text(
                                                  '${item['title']} and remote module providerinstaller',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                '${item['weight']} / \৳${item['price']}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
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
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 35,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                offset: Offset(0, 10),
                                blurRadius: 30.0,
                              )
                            ],
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                size: 30,
                                color: Color(0xFFB5B5B5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                // borderSide:
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: Icon(
                                Icons.tune,
                                size: 30,
                                color: Color(0xFFB5B5B5),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                    StreamBuilder(
                      stream:
                          _firebaseController.getProductByCategory(menuName),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Container(
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot item =
                                    snapshot.data.docs[index];
                                // final rating = double.parse(item['rating']);

                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      ProductDetailsPage(
                                        id: item.id,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20),
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF56461),
                                      borderRadius: BorderRadius.circular(180),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                  vertical: 15,
                                                ),
                                                height: 220,
                                                width: 220,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFEF2F2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          125),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: const Color(
                                                              0xcc000000)
                                                          .withOpacity(0.5),
                                                      offset: Offset(3, 5),
                                                      blurRadius: 20,
                                                    ),
                                                  ],
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl: item['thumbnail'],
                                                  placeholder: (context, url) =>
                                                      CircularProgressIndicator(),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              bottom: 20,
                                              child: GestureDetector(
                                                onTap: () {
                                                  if (_cartController
                                                          .checkCartExist(
                                                              id: item.id) !=
                                                      null) {
                                                    Get.snackbar(
                                                      'Opps!!',
                                                      '${item['title']} already exists in your cart',
                                                      icon: Icon(
                                                        Icons.done_all,
                                                        color: Colors.white,
                                                      ),
                                                      colorText: Colors.white,
                                                      backgroundColor:
                                                          Colors.green[300],
                                                      snackPosition:
                                                          SnackPosition.TOP,
                                                    );
                                                  } else {
                                                    final cart = Cart(
                                                      id: item.id,
                                                      title: item['title'],
                                                      thumbnail:
                                                          item['thumbnail'],
                                                      details:
                                                          item['description'],
                                                      price: item['price'],
                                                      quantity: 1,
                                                      category:
                                                          item['category'],
                                                    );
                                                    cartController.addToCart(
                                                        cart: cart);
                                                  }
                                                },
                                                child: CircleAvatar(
                                                  maxRadius: 35,
                                                  backgroundColor: Colors.white
                                                      .withOpacity(0.7),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 5,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      'assets/svg/cart-plus.svg',
                                                      width: 35,
                                                      color: Color(0xFFEA4E5C),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 45,
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RatingBarIndicator(
                                                rating: 2.5,
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                itemSize: 16.0,
                                                direction: Axis.horizontal,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${item['category']}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '${item['title']}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                '${item['weight']} / \৳${item['price']}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
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
                    StreamBuilder(
                      stream:
                          _firebaseController.getProductByCategory(menuName),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Container(
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot item =
                                    snapshot.data.docs[index];
                                final rating = double.parse(item['rating']);
                                // print(item.id);
                                return GestureDetector(
                                  onTap: () {
                                    Get.to(
                                      ProductDetailsPage(
                                        id: item.id,
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 20),
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFF56461),
                                      borderRadius: BorderRadius.circular(180),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                  vertical: 15,
                                                ),
                                                height: 220,
                                                width: 220,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFFEF2F2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          125),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: const Color(
                                                              0xcc000000)
                                                          .withOpacity(0.5),
                                                      offset: Offset(3, 5),
                                                      blurRadius: 20,
                                                    ),
                                                  ],
                                                ),
                                                child: CachedNetworkImage(
                                                  imageUrl: item['thumbnail'],
                                                  placeholder: (context, url) =>
                                                      CircularProgressIndicator(),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              bottom: 20,
                                              child: GestureDetector(
                                                onTap: () {
                                                  if (_cartController
                                                          .checkCartExist(
                                                              id: item.id) !=
                                                      null) {
                                                    Get.snackbar(
                                                      'Opps!!',
                                                      '${item['title']} already exists in your cart',
                                                      icon: Icon(
                                                        Icons.done_all,
                                                        color: Colors.white,
                                                      ),
                                                      colorText: Colors.white,
                                                      backgroundColor:
                                                          Colors.green[300],
                                                      snackPosition:
                                                          SnackPosition.TOP,
                                                    );
                                                  } else {
                                                    final cart = Cart(
                                                      id: item.id,
                                                      title: item['title'],
                                                      thumbnail:
                                                          item['thumbnail'],
                                                      details:
                                                          item['description'],
                                                      price: item['price'],
                                                      quantity: 1,
                                                      category:
                                                          item['category'],
                                                    );
                                                    cartController.addToCart(
                                                        cart: cart);
                                                  }
                                                },
                                                child: CircleAvatar(
                                                  maxRadius: 35,
                                                  backgroundColor: Colors.white
                                                      .withOpacity(0.7),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      left: 5,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      'assets/svg/cart-plus.svg',
                                                      width: 35,
                                                      color: Color(0xFFEA4E5C),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: 45,
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 16),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RatingBarIndicator(
                                                rating: 2.5,
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                itemSize: 16.0,
                                                direction: Axis.horizontal,
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '${item['category']}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '${item['title']}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                '${item['weight']} / \৳${item['price']}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
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

                    //Popular Tab Section

                    //Trending Section

                    // Container(
                    //   child: ListView.builder(
                    //     physics: BouncingScrollPhysics(),
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: 5,
                    //     itemBuilder: (BuildContext context, int index) {
                    //       //final item = snapshot.data.docs[index];
                    //       return GestureDetector(
                    //         onTap: () {},
                    //         child: Container(
                    //           margin: EdgeInsets.only(left: 20),
                    //           padding: EdgeInsets.only(left: 15, right: 15),
                    //           decoration: BoxDecoration(
                    //             color: Color(0xFF4F8188),
                    //             borderRadius: BorderRadius.circular(180),
                    //           ),
                    //           child: Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Stack(
                    //                 children: [
                    //                   Align(
                    //                     alignment: Alignment.topCenter,
                    //                     child: Container(
                    //                       margin: EdgeInsets.symmetric(
                    //                         vertical: 15,
                    //                       ),
                    //                       height: 220,
                    //                       width: 220,
                    //                       decoration: BoxDecoration(
                    //                         color: Color(0xFF6ca495),
                    //                         borderRadius:
                    //                             BorderRadius.circular(125),
                    //                         boxShadow: [
                    //                           BoxShadow(
                    //                             color: const Color(0xcc000000)
                    //                                 .withOpacity(0.5),
                    //                             offset: Offset(3, 5),
                    //                             blurRadius: 20,
                    //                           ),
                    //                         ],
                    //                       ),
                    //                       child: Image.asset(
                    //                           'assets/images/flower1.png'),
                    //                     ),
                    //                   ),
                    //                   Positioned(
                    //                     right: 0,
                    //                     bottom: 20,
                    //                     child: GestureDetector(
                    //                       onTap: () {
                    //                         print('Add to Card');
                    //                       },
                    //                       child: CircleAvatar(
                    //                         maxRadius: 35,
                    //                         backgroundColor:
                    //                             Colors.white.withOpacity(0.7),
                    //                         child: Padding(
                    //                           padding: const EdgeInsets.only(
                    //                             left: 5,
                    //                           ),
                    //                           child: SvgPicture.asset(
                    //                             'assets/svg/cart-plus.svg',
                    //                             width: 35,
                    //                             color: Color(0xFF4F8188),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   )
                    //                 ],
                    //               ),
                    //               SizedBox(
                    //                 height: 45,
                    //               ),
                    //               Container(
                    //                 margin:
                    //                     EdgeInsets.symmetric(horizontal: 16),
                    //                 child: Column(
                    //                   crossAxisAlignment:
                    //                       CrossAxisAlignment.start,
                    //                   children: [
                    //                     Row(
                    //                       children: [
                    //                         RatingBarIndicator(
                    //                           rating: 2.75,
                    //                           itemBuilder: (context, index) =>
                    //                               Icon(
                    //                             Icons.star,
                    //                             color: Colors.amber,
                    //                           ),
                    //                           itemCount: 5,
                    //                           itemSize: 16.0,
                    //                           direction: Axis.horizontal,
                    //                         ),
                    //                         SizedBox(
                    //                           width: 18,
                    //                         ),
                    //                         FlatButton(
                    //                           height: 20,
                    //                           minWidth: 20,
                    //                           color: Color(0xFF6ca495),
                    //                           onPressed: () {},
                    //                           child: Text(
                    //                             'Featured',
                    //                             style: TextStyle(
                    //                               color: Colors.white,
                    //                             ),
                    //                           ),
                    //                         )
                    //                       ],
                    //                     ),
                    //                     SizedBox(
                    //                       height: 5,
                    //                     ),
                    //                     Text(
                    //                       'Category',
                    //                       style: TextStyle(
                    //                         color: Color(0xFFBED5B9),
                    //                         fontSize: 16,
                    //                         fontWeight: FontWeight.bold,
                    //                       ),
                    //                     ),
                    //                     SizedBox(
                    //                       height: 10,
                    //                     ),
                    //                     Text(
                    //                       'New Product',
                    //                       style: TextStyle(
                    //                         color: Colors.white,
                    //                         fontSize: 25,
                    //                         fontWeight: FontWeight.bold,
                    //                       ),
                    //                     ),
                    //                     SizedBox(
                    //                       height: 8,
                    //                     ),
                    //                     Text(
                    //                       '10z / \৳12',
                    //                       style: TextStyle(
                    //                         color: Color(0xFFBED5B9),
                    //                         fontSize: 20,
                    //                         fontWeight: FontWeight.bold,
                    //                       ),
                    //                     ),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFFEA4E5C),
          child: Stack(
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                size: 38,
              ),
              Obx(
                () => cartController.carts.isEmpty
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
                              '${cartController.carts.length}',
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
          onPressed: () {
            Get.to(
              CartPage(),
            );
          },
        ),
      ),
    );
  }
}
