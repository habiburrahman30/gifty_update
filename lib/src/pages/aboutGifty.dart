import 'package:flutter/material.dart';

class Aboutgifty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'About Gifty',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
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
        child: Column(
          children: [
            Container(
              height: height,
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '''
Gifty makes it easier than ever to schedule your gift on the go. Buy for yourself or a send a personalized gift to a friend. Choose from over 150 top shops and regional brands - delivered on date you preferred from your mobile device .

Gifty App Features:
- Gift Voucher - send gift voucher for purchasing from our platform using that voucher.

- No Ads – Our free app is completely spamming free and ad free

- Scheduled Gift - Schedule for a day with celebration and gifty will send the gift as your preference.

Access voucher deals on the go when you buy a gift card for yourself, friends, or family members. What’s more, earn rewards in return. Gifty is the easiest way to send gifts to a friend in your busy day.

Our free app is loaded with features that will easily direct you to the deal you're looking for.

What are you waiting for? Download the Gift Card Granny app. It’s the smart way to shop for gift cards.
                    ''',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
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
