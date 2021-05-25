import 'package:gifty/src/config/appTheme.dart';
import 'package:gifty/src/controllers/authController.dart';
import 'package:gifty/src/controllers/currentLocationController.dart';
import 'package:gifty/src/controllers/firebaseController.dart';
import 'package:gifty/src/pages/aboutgifty.dart';
import 'package:gifty/src/pages/accountPage.dart';
import 'package:gifty/src/pages/help.dart';
import 'package:gifty/src/pages/homePage.dart';
import 'package:gifty/src/pages/notificationsPage.dart';
import 'package:gifty/src/pages/orderPage.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SerttingPage extends GetWidget<FirebaseController> {
  final _authC = Get.put(AuthController(), permanent: true);
  final _currentLocationC =
      Get.put(CurrentLocationController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bodyBg,
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        // iconTheme: IconThemeData(
        //   color: Colors.black,
        // ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.offAll(HomePage());
          },
        ),
        title: Text(
          'Settings',
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 15,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Section',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                        ),
                        title: Text(
                          'Profile',
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                        ),
                        onTap: () {
                          Get.to(
                            AccountPage(),
                          );
                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.notifications_active,
                        ),
                        title: Text(
                          'Notifications',
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                        ),
                        onTap: () {
                          Get.to(
                            NotificationsPage(),
                          );
                        },
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.shopping_cart,
                        ),
                        title: Text(
                          'My Orders',
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                        ),
                        onTap: () {
                          Get.to(
                            OrderPage(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   margin: EdgeInsets.symmetric(
              //     horizontal: 20,
              //   ),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         'Payment Section',
              //         style: TextStyle(
              //           fontSize: 16,
              //           fontWeight: FontWeight.bold,
              //         ),
              //       ),
              //       SizedBox(
              //         height: 20,
              //       ),
              //       Card(
              //         child: ListTile(
              //           leading: FaIcon(
              //             FontAwesomeIcons.moneyBillWave,
              //           ),
              //           title: Text(
              //             'Purchase History',
              //           ),
              //           trailing: Icon(
              //             Icons.keyboard_arrow_right,
              //           ),
              //           onTap: () {},
              //         ),
              //       ),
              //       Card(
              //         child: ListTile(
              //           leading: Icon(
              //             Icons.account_balance,
              //           ),
              //           title: Text(
              //             'Bank Account',
              //           ),
              //           trailing: Icon(
              //             Icons.keyboard_arrow_right,
              //           ),
              //           onTap: () {},
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 30,
              // ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                // padding: EdgeInsets.symmetric(
                //   horizontal: 10,
                //   vertical: 15,
                // ),
                // decoration: BoxDecoration(
                //   color: Colors.grey[200],
                //   borderRadius: BorderRadius.circular(4),
                // ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Section 3',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Card(
                      child: Column(
                        children: [
                          ListTile(
                            leading: Icon(
                              Icons.location_on,
                            ),
                            title: Text(
                              'Location',
                            ),
                            // subtitle: Text(
                            //   'The Westin Dhaka, Road 45, Dhaka 1212',
                            //   style: TextStyle(
                            //     fontSize: 12.0,
                            //   ),
                            // ),
                            trailing: Switch(
                              value: _currentLocationC.locationOnOf.value,
                              activeColor: AppTheme.color1,
                              onChanged: (bool value) {
                                _currentLocationC.manageLocationOnOf();
                              },
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.info,
                            ),
                            title: Text(
                              'About',
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                            ),
                            onTap: () {
                              Get.to(
                                Aboutgifty(),
                              );
                            },
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.help,
                            ),
                            title: Text(
                              'Help',
                            ),
                            trailing: Icon(
                              Icons.keyboard_arrow_right,
                            ),
                            onTap: () {
                              Get.to(
                                Help(),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.logout,
                          size: 35,
                        ),
                        title: Text(
                          'Log Out',
                        ),
                        subtitle: Text('Log out from your account'),
                        trailing: Icon(
                          Icons.keyboard_arrow_right,
                        ),
                        onTap: () {
                          _authC.signOut();
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
