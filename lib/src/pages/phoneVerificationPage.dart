import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PhoneVerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Container(
                width: 250,
                child: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.transparent,
                  indicator: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  tabs: [
                    Container(
                      height: 10,
                      child: Tab(
                        child: Container(
                          decoration: BoxDecoration(
                            //color: Colors.blue,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 10,
                      child: Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5)),
                        ),
                      ),
                    ),
                    Container(
                      height: 10,
                      child: Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(5)),
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
                width: Get.width,
                height: 600,
                child: TabBarView(
                  children: [
                    Container(
                      child: Text('kbdkjdd'),
                    ),
                    Container(
                      child: Text('kbdkjdd'),
                    ),
                    Container(
                      child: Text('kbdkjdd'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
