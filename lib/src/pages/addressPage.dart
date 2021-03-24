import 'package:gifty/src/controllers/addressController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Address extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _addressController = Get.put(AddressController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Obx(
            () => _addressController.allAddress.isEmpty
                ? Text('No Address')
                : ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: _addressController.allAddress.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = _addressController.allAddress[index];
                      print(item.email);
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 30.0,
                          vertical: 10.0,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 15.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: Offset(0, 3),
                              blurRadius: 10.0,
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name: ${item.name}',
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              'Email: ${item.email}',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              'Phone: ${item.phone}',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              'Address: ${item.address}',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              height: 4.0,
                            ),
                            Text(
                              'Date: ${item.date}',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
