import 'package:gifty/src/models/addressmodel.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class AddressController extends GetxController {
  final allAddress = List<ReceiversAddress>().obs;

  addAddress({@required ReceiversAddress address}) {
    allAddress.add(address);

    Get.snackbar(
      'Opps!!',
      '${address.name} already exists in your address list',
      icon: Icon(
        Icons.done_all,
        color: Colors.white,
      ),
      colorText: Colors.white,
      backgroundColor: Colors.green[300],
      snackPosition: SnackPosition.TOP,
    );
    // print(address.email);
  }
}
