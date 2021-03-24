import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Paymene Method'.toUpperCase(),
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: TabBar(
              isScrollable: true,
              labelColor: Color(0xFF3E84E0),
              indicatorColor: Colors.transparent,
              unselectedLabelColor: Colors.grey[400],
              // indicator: BoxDecoration(
              //   borderRadius: BorderRadius.circular(5),
              //   border: Border.all(
              //     color: Color(0xFF3E84E0),
              //     width: 2,
              //   ),
              // ),
              physics: BouncingScrollPhysics(),
              tabs: [
                Container(
                  height: 100,
                  child: Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 60,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey[400],
                          width: 2,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: FaIcon(
                          FontAwesomeIcons.creditCard,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  child: Tab(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 60,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: Colors.grey[400],
                          width: 2,
                        ),
                      ),
                      child: SvgPicture.asset(
                        'assets/svg/BKashLogo.svg',
                        width: 90,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 600,
            width: Get.width,
            child: TabBarView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Details'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[400],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Form(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 20,
                                  top: 13,
                                ),
                                isDense: true,
                                filled: true,
                                hintText: 'Card Type',
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                  ),
                                  onPressed: () {},
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 20,
                                ),
                                filled: true,
                                hintText: 'Card Number',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(
                                  left: 20,
                                ),
                                filled: true,
                                hintText: 'Name on Card',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                              ),
                              keyboardType: TextInputType.text,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                        left: 20,
                                        top: 13,
                                      ),
                                      filled: true,
                                      hintText: 'Expery Date',
                                      suffixIcon: Icon(
                                        Icons.calendar_today,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                    ),
                                    keyboardType: TextInputType.datetime,
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                        left: 20,
                                      ),
                                      filled: true,
                                      hintText: 'CVV',
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(25.7),
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Save my Card detail',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                CupertinoSwitch(
                                  activeColor: Color(0xFF3E84E0),
                                  onChanged: (bool value) {},
                                  value: true,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
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
                                      'Next',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15,
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            offset: Offset(0, 10),
                            blurRadius: 30.0,
                          )
                        ],
                      ),
                      child: FlatButton.icon(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Colors.white,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/svg/BKashLogo.svg',
                          width: 50,
                        ),
                        label: Text(
                          'Pay with bKash',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
