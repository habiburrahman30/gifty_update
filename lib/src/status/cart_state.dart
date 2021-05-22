import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gifty/src/models/cartModel.dart';

class CartState extends ChangeNotifier {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

// get All Carts price
  int getCartPrice({@required List<Cart> carts}) {
    int price = 0;
    try {
      carts.forEach(
        (cart) {
          price += int.parse(cart.price) * cart.quantity;
        },
      );
    } catch (e) {
      print(e);
    }
    return price;
  }

  // --------------------------------------------------
  Future<int> applyCoupon(
      BuildContext context, String couponCode, int totalPrice) async {
    int dicountPrice;

    try {
      QuerySnapshot coupon = await _firestore
          .collection('coupons')
          .where('couponCode', isEqualTo: couponCode)
          .limit(1)
          .get();
      if (totalPrice >= 150) {
        if (coupon.size > 0) {
          dicountPrice = coupon.docs[0].data()['discount'];
          notifyListeners();
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.WARNING,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Invalid Coupon',
            desc: 'You have entered invalid coupon code',
            dismissOnTouchOutside: true,
          ).show();
        }
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.WARNING,
          animType: AnimType.BOTTOMSLIDE,
          title: 'Oppss!',
          desc: 'incrase the amount of order and try again',
          dismissOnTouchOutside: true,
        ).show();
      }
    } catch (e) {
      print(e);
    }
    return dicountPrice;
  }
}
