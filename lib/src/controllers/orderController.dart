import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifty/src/controllers/cartController.dart';
import 'package:gifty/src/controllers/firebaseController.dart';
import 'package:gifty/src/pages/accountPage.dart';
import 'package:gifty/src/pages/thankuPage.dart';
import 'package:uuid/uuid.dart';

class OrderController extends GetxController {
  final _firebaseC = Get.put(FirebaseController());
  final _cartC = Get.put(CartController());

  final _firestore = FirebaseFirestore.instance;

  final step = 1.obs;

  final name = ''.obs;
  final phone = ''.obs;
  final address = ''.obs;
  final date = ''.obs;
  final senderName = ''.obs;
  final senderEmail = ''.obs;
  final senderPhone = ''.obs;
  final senderAddress = ''.obs;
  final sendAnonymous = true.obs;
  final userDateReady = false.obs;
  final cashOnDelivery = false.obs;

  void manageCashOnDelivery() {
    cashOnDelivery.toggle();
  }

  bool checkCashOnDelivery() {
    if (cashOnDelivery.value == false) {
      return true;
    } else {
      return false;
    }
  }

  void manageSendAnonymous() {
    sendAnonymous.toggle();
    if (sendAnonymous.value == false) {
      setData();
    }
  }

  void setData() async {
    final user = await _firebaseC.getUserData('users');
    senderName.value = user['fullName'];
    senderEmail.value = user['email'];
    senderAddress.value = user['address'];
    senderPhone.value =
        user['phone'] != null ? user['phone'] : senderPhone.value;

    userDateReady.value = true;
  }

  bool checkValidation() {
    if (name.value.length > 6 &&
        phone.value.length >= 11 &&
        address.value.length >= 10 &&
        date.isNotEmpty &&
        sendAnonymous.value == true) {
      return true;
    } else if (name.value.length > 6 &&
        phone.value.length == 11 &&
        address.value.length >= 10 &&
        date.isNotEmpty &&
        sendAnonymous.value == false &&
        senderName.value.length > 6 &&
        senderEmail.value.isEmail &&
        senderPhone.value.length == 11) {
      return true;
    } else {
      return false;
    }
  }

  void orderNow() async {
    final uId = FirebaseAuth.instance.currentUser.uid;

    final orderData = {
      'uId': uId,
      'name': name.value,
      'phone': phone.value,
      'address': address.value,
      'deliveryDate': date.value,
      'sendAnonymous': sendAnonymous.value,
      'senderName': senderName.value ?? null,
      'senderEmail': senderEmail.value ?? null,
      'senderPhone': senderPhone.value ?? null,
      'orderItems': getCartItems(),
      'pending': true,
      'orderId': Uuid().v1(),
      'createdAt': DateTime.now(),
    };

    await _firestore.collection('orders').add(orderData);

    if (senderPhone.value.isNotEmpty) {
      await _firestore
          .collection('users')
          .doc(uId)
          .update({'phone': senderPhone.value});
    }

    _cartC.carts.clear();

    Get.defaultDialog(
      middleText: 'Your order has been successfully created',
      actions: [
        TextButton(
          onPressed: () {
            // Get.offAll(HomePage());
            Get.offAll(ThankuPage());
          },
          child: Text('GOT IT'),
        ),
      ],
    );
  }

  List<Map<String, dynamic>> getCartItems() {
    final orderItems = List<Map<String, dynamic>>();

    Get.put(CartController(), permanent: true).carts.forEach((cart) {
      orderItems.add({
        'title': cart.title,
        'price': cart.price,
        'thumbnail': cart.thumbnail,
        'quantity': cart.quantity,
      });
    });

    return orderItems;
  }

  void next(int v) {
    step.value = v;
  }

  double getProgress() {
    if (step.value == 1) {
      return 0.33;
    }
    if (step.value == 2) {
      return 0.66;
    }
    if (step.value == 2) {
      return 1.0;
    }
    return 1.0;
  }

  //User update Function

  void updateUser() async {
    final uId = FirebaseAuth.instance.currentUser.uid;
    await _firestore.collection('users').doc(uId).update({
      'fullName': senderName.value,
      'email': senderEmail.value,
      'phone': senderPhone.value,
      'address': senderAddress.value,
    });
    Get.defaultDialog(
      middleText: 'Your data has been successfully updated',
      actions: [
        TextButton(
          onPressed: () {
            Get.offAll(AccountPage());
          },
          child: Text('GOT IT'),
        ),
      ],
    );
  }
}
