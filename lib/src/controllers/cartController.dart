import 'package:gifty/src/models/cartModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final carts = List<Cart>().obs;

  addToCart({@required Cart cart}) {
    carts.add(cart);

    Get.snackbar(
      'Opps!!',
      '${cart.title} already exists in your cart',
      icon: Icon(
        Icons.done_all,
        color: Colors.white,
      ),
      colorText: Colors.white,
      backgroundColor: Colors.green[300],
      snackPosition: SnackPosition.TOP,
    );

    // if (checkCartExist(id: cart.id) == null) {
    //   carts.add(cart);
    // } else {
    //   if (!Get.isSnackbarOpen)
    //     Get.snackbar(
    //       'Oops!!!',
    //       '${cart.title} already exists in your cart',
    //       icon: Icon(
    //         Icons.done_all,
    //       ),
    //       backgroundColor: Colors.white,
    //       snackPosition: SnackPosition.TOP,
    //     );
    // }
  }

  checkCartExist({@required String id}) {
    return carts.singleWhere((x) => id == x.id, orElse: () => null);
  }

  removeCart({@required String id}) {
    carts.removeWhere((x) => x.id == id);
  }

  updateQuantity({
    @required int id,
    @required int type,
  }) {
    var cart = carts.firstWhere((x) => int.parse(x.id) == id);
    switch (type) {
      case 0:
        if (cart.quantity >= 2) {
          cart.quantity--;
          carts[carts
              .indexWhere((x) => int.parse(x.id) == int.parse(cart.id))] = cart;
        }
        break;
      case 1:
        cart.quantity++;
        carts[carts.indexWhere((x) => int.parse(x.id) == int.parse(cart.id))] =
            cart;
        break;
    }
  }

  int getTotalCartPrice() {
    int totalPrice = 0;

    carts.forEach((x) {
      totalPrice += int.parse(x.price) * x.quantity;
    });

    return totalPrice;
  }
}
