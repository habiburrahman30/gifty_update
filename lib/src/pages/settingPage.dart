import 'package:gifty/src/controllers/firebaseController.dart';
import 'package:gifty/src/pages/aboutgifty.dart';
import 'package:gifty/src/pages/accountPage.dart';
import 'package:gifty/src/pages/addressPage.dart';
import 'package:gifty/src/pages/help.dart';
import 'package:gifty/src/pages/notificationsPage.dart';
import 'package:gifty/src/pages/orderPage.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SerttingPage extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    'Settings',
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
            SizedBox(
              height: 30,
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
                color: Colors.grey[200],
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
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.map_outlined,
                      ),
                      title: Text(
                        'My Address',
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                      ),
                      onTap: () {
                        Get.to(
                          Address(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
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
                    'Payment Section',
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
                      leading: FaIcon(
                        FontAwesomeIcons.moneyBillWave,
                      ),
                      title: Text(
                        'Purchase History',
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                      ),
                      onTap: () {},
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.account_balance,
                      ),
                      title: Text(
                        'Bank Account',
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right,
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
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
                          trailing: Switch(
                            value: true,
                            onChanged: (bool value) {},
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
                        controller.signOut();
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
    );
  }
}
