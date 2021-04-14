import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifty/src/controllers/firebaseController.dart';
import 'package:gifty/src/pages/accountPage.dart';

class UserController extends GetxController {
  final _firebaseC = Get.put(FirebaseController());

  final _firestore = FirebaseFirestore.instance;

  final userName = ''.obs;
  final userEmail = ''.obs;
  final userPhone = ''.obs;
  final userAddress = ''.obs;

  void setData() async {
    final user = await _firebaseC.getUserData('users');
    userName.value = user['fullName'];
    userEmail.value = user['email'];
    userAddress.value = user['address'];
    userPhone.value = user['phone'] != null ? user['phone'] : userPhone.value;
  }

  void updateUser() async {
    final uId = FirebaseAuth.instance.currentUser.uid;
    await _firestore.collection('users').doc(uId).update({
      'fullName': userName.value,
      'email': userEmail.value,
      'phone': userPhone.value,
      'address': userAddress.value,
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
