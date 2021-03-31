import 'dart:io';

import 'package:gifty/src/controllers/firebaseController.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final _firebaseController = Get.put(FirebaseController());

    String name, email, phone, address, imgUrl;
    // File _image;
    // final picker = ImagePicker();
    // // bool isLoading = false;

    // Future getImage() async {
    //   final pickedFile = await picker.getImage(source: ImageSource.camera);

    //   setState(() {
    //     if (pickedFile != null) {
    //       _image = File(pickedFile.path);
    //     } else {
    //       print('No image selected.');
    //     }
    //   });
    // }

    updateUserData() {
      Map<String, dynamic> data = {
        "imgUrl": '',
        "firstName": name,
        // "email": email,
        "phone": phone,
        "address": address,
      };

      _firebaseController.updateUser(data, 'users').then((value) {
        // setState(() {
        //   isLoading = false;
        // });
        Get.back();
      });
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF819e7b),
                  Colors.grey[400],
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(44),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(),
                                child: Icon(Icons.camera_alt),
                              ),
                            ),
                            Positioned(
                              right: -8,
                              top: 5,
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(44),
                                  ),
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Johan Dos',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 25,
            ),
            margin: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Column(
              children: [
                Container(
                  child: FlatButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            scrollable: true,

                            // title: Text('Your Name'),
                            content: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Form(
                                child: Column(
                                  children: [
                                    Container(
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(44),
                                              border: Border.all(
                                                color: Colors.black54,
                                                width: 2,
                                              ),
                                            ),
                                            child: Container(
                                              height: 80,
                                              width: 80,
                                              decoration: BoxDecoration(),
                                              child: Icon(Icons.camera_alt),
                                            ),
                                          ),
                                          Positioned(
                                            right: -8,
                                            top: 5,
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 5,
                                                  vertical: 5,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.black
                                                      .withOpacity(0.3),
                                                  borderRadius:
                                                      BorderRadius.circular(44),
                                                ),
                                                child: Icon(
                                                  Icons.camera_alt_outlined,
                                                  color: Colors.white,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    CustomTextFormField(
                                      labelText: 'Name',
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Color(0xFF4F8188),
                                      ),
                                      onChanged: (value) {
                                        name = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    CustomTextFormField(
                                      labelText: 'Phone',
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: Color(0xFF4F8188),
                                      ),
                                      onChanged: (value) {
                                        phone = value;
                                      },
                                    ),
                                    SizedBox(
                                      height: 15.0,
                                    ),
                                    CustomTextFormField(
                                      labelText: 'Address',
                                      prefixIcon: Icon(
                                        Icons.location_on_outlined,
                                        color: Color(0xFF4F8188),
                                      ),
                                      onChanged: (value) {
                                        address = value;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            actions: [
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                color: Color(0xFF4F8188),
                                child: Text('Submit'),
                                onPressed: () {
                                  name.isNotEmpty &&
                                          email.isNotEmpty &&
                                          address.isNotEmpty
                                      ? updateUserData()
                                      : print('Please field input');
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: FaIcon(
                      FontAwesomeIcons.edit,
                      size: 20,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserData extends StatelessWidget {
  const UserData({
    Key key,
    this.labelText,
    this.titleText,
  }) : super(key: key);
  final String labelText;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(44),
        border: Border.all(
          color: Colors.grey[400],
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            labelText ?? 'Text',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            child: Row(
              children: [
                Text(
                  titleText ?? 'Title Text',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String labelText;
  final Icon prefixIcon;
  final TextEditingController controller;
  final Function onChanged;

  const CustomTextFormField({
    Key key,
    this.labelText,
    this.prefixIcon,
    this.controller,
    this.onChanged,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        labelText: labelText ?? 'Text',
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.7),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }
}
