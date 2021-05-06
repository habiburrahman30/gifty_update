import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gifty/src/components/customTextField.dart';
import 'package:gifty/src/controllers/orderController.dart';
import 'package:image_picker/image_picker.dart';

class AdvanceCustomAlert extends StatefulWidget {
  @override
  _AdvanceCustomAlertState createState() => _AdvanceCustomAlertState();
}

class _AdvanceCustomAlertState extends State<AdvanceCustomAlert> {
  final _orderC = Get.put(OrderController(), permanent: true);

  //Select Profile image
  dynamic _image;

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: Container(
              height: 450,
              width: 340,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 70, 20, 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 25.0,
                    ),
                    CustomTextField(
                      initalText: _orderC.senderName.value,
                      hintText: 'Name',
                      errorText: _orderC.senderName.value.length > 6 ||
                              _orderC.senderName.value.isEmpty
                          ? null
                          : 'Please enter your name',
                      suffixIcon: Icon(
                        Icons.person,
                        color: Color(0xFF4F8188),
                      ),
                      onChanged: _orderC.senderName,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    CustomTextField(
                      initalText: _orderC.senderEmail.value,
                      hintText: 'Email',
                      errorText: _orderC.senderEmail.value.isEmail ||
                              _orderC.senderEmail.value.isEmpty
                          ? null
                          : 'Please enter your Email',
                      suffixIcon: Icon(
                        Icons.person,
                        color: Color(0xFF4F8188),
                      ),
                      onChanged: _orderC.senderEmail,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    CustomTextField(
                      initalText: _orderC.senderPhone.value,
                      hintText: 'Phone',
                      errorText: _orderC.senderPhone.value.isNotEmpty &&
                              _orderC.senderPhone.value.length == 11
                          ? null
                          : _orderC.senderPhone.value.isEmpty
                              ? null
                              : 'Phone number should be at least 11 character',
                      suffixIcon: Icon(
                        Icons.phone,
                        color: Color(0xFF4F8188),
                      ),
                      onChanged: _orderC.senderPhone,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    CustomTextField(
                      initalText: _orderC.senderAddress.value == null
                          ? 'Add your address'
                          : _orderC.senderAddress.value,
                      hintText: 'Address',
                      onChanged: _orderC.senderAddress,
                      suffixIcon: Icon(
                        Icons.location_on_outlined,
                        color: Color(0xFF4F8188),
                      ),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      maxLines: 3,
                      hasMaxLines: true,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        // backgroundColor: AppTheme.color1,
                        backgroundColor: _orderC.senderName.value.isNotEmpty &&
                                _orderC.senderEmail.value.isEmail &&
                                _orderC.senderPhone.value.isNotEmpty &&
                                _orderC.senderAddress.value.isNotEmpty
                            ? Colors.redAccent
                            : Colors.grey[350],
                        primary: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10.0,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(35.0),
                        ),
                      ),
                      onPressed: _orderC.senderName.value.isNotEmpty &&
                              _orderC.senderEmail.value.isEmail &&
                              _orderC.senderPhone.value.isNotEmpty &&
                              _orderC.senderAddress.value.isNotEmpty
                          ? () {
                              // Get.back();
                              _orderC.updateUser();
                            }
                          : null,
                      child: Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: -60,
            child: _image != null
                ? Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      foregroundImage: FileImage(_image),
                      radius: 60,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      getImage();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      radius: 60,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
