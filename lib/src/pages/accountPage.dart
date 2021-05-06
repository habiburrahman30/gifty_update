import 'package:gifty/src/components/advanceCustomAlert.dart';
import 'package:gifty/src/config/appTheme.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gifty/src/controllers/orderController.dart';
import 'package:gifty/src/pages/settingPage.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final _orderC = Get.put(OrderController());
    _orderC.setData();

    return Scaffold(
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Container(
                height: 210,
                width: Get.width,
                decoration: BoxDecoration(
                  color: AppTheme.color1,
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
                          Get.to(() => SerttingPage());
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
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Colors.grey[350],
                                    ),
                                  ),
                                ),
                                //   Positioned(
                                //     right: -8,
                                //     top: 5,
                                //     child: GestureDetector(
                                //       onTap: () {},
                                //       child: Container(
                                //         padding: EdgeInsets.symmetric(
                                //           horizontal: 5,
                                //           vertical: 5,
                                //         ),
                                //         decoration: BoxDecoration(
                                //           color: Colors.black.withOpacity(0.3),
                                //           borderRadius: BorderRadius.circular(44),
                                //         ),
                                //         child: Icon(
                                //           Icons.camera_alt_outlined,
                                //           color: Colors.white,
                                //           size: 20,
                                //         ),
                                //       ),
                                //     ),
                                //   )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _orderC.senderName.value,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Container(
                                height: 25,
                                margin: EdgeInsets.only(
                                  bottom: 5,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (contex) {
                                        return AdvanceCustomAlert();
                                      },
                                    );
                                  },
                                  child: FaIcon(
                                    FontAwesomeIcons.edit,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7,
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
                    // Container(
                    //   child: TextButton(
                    //     onPressed: () {
                    //       showDialog(
                    //         context: context,
                    //         builder: (contex) {
                    //           return AdvanceCustomAlert();
                    //         },
                    //       );
                    //     },
                    //     child: FaIcon(
                    //       FontAwesomeIcons.edit,
                    //       size: 20,
                    //       color: Colors.blueAccent,
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 30.0,
                    // ),
                    Obx(
                      () {
                        return Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15.0,
                              ),
                              Container(
                                width: Get.width,
                                padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _orderC.senderName.value == null
                                          ? 'Your Name'
                                          : _orderC.senderName.value,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Icon(
                                      Icons.person,
                                      color: Colors.grey[600],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                width: Get.width,
                                padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _orderC.senderEmail.value == null
                                          ? 'Your Email'
                                          : _orderC.senderEmail.value,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Icon(
                                      Icons.email,
                                      color: Colors.grey[600],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                width: Get.width,
                                padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _orderC.senderPhone.value == null
                                          ? 'Your Phone'
                                          : _orderC.senderPhone.value,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Icon(
                                      Icons.mobile_friendly_sharp,
                                      color: Colors.grey[600],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                width: Get.width,
                                height: 80,
                                padding: EdgeInsets.fromLTRB(20, 12, 20, 12),
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(25.7),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          _orderC.senderAddress.value == null
                                              ? 'Your Address'
                                              : _orderC.senderAddress.value,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.grey[600],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
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

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    this.onChanged,
    this.errorText,
    @required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    @required this.keyboardType,
    @required this.textInputAction,
    this.hasMaxLines = false,
    this.maxLines,
    this.controller,
    this.initalText,
    this.readOnly = false,
  }) : super(key: key);

  final Function onChanged;
  final String errorText;
  final String hintText;
  final String initalText;
  final Icon suffixIcon;
  final Icon prefixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int maxLines;
  final bool hasMaxLines;
  final bool readOnly;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initalText != null ? initalText : '',
      onChanged: onChanged,
      maxLines: maxLines,
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        errorText: errorText,
        filled: true,
        hintText: hintText ?? 'Text',
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.fromLTRB(20, hasMaxLines ? 25 : 5, 0, 0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25.7),
        ),
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
    );
  }
}
