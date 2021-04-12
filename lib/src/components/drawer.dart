import 'package:gifty/src/config/appTheme.dart';
import 'package:gifty/src/pages/settingPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          color: AppTheme.bodyBg,
          child: Stack(
            children: [
              Positioned(
                right: -40,
                top: -18,
                child: Container(
                  height: 190,
                  width: 190,
                  decoration: BoxDecoration(
                    color: AppTheme.color1,
                    borderRadius: BorderRadius.circular(150),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      bottom: 30,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Color(0xFFd2f1d1),
                        size: 40,
                      ),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 420,
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: AppTheme.color2,
                    borderRadius: BorderRadius.circular(150),
                  ),
                ),
              ),
              Positioned(
                right: -75,
                bottom: -80,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: AppTheme.color2,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(150),
                      topRight: Radius.circular(150),
                      bottomLeft: Radius.circular(150),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                        ),
                        ListTile(
                          title: Text(
                            'Featured',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Chocolate',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Handicrafts',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Love Corner',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Notebook',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Corporate Gifts',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Jewelry',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Watches',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 40),
                    child: ListTile(
                      title: Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Get.to(
                          SerttingPage(),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
