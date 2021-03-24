import 'package:gifty/src/controllers/orderController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Shipping extends StatelessWidget {
  final _orderC = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  child: Text(
                    'Gift receiver\'s details ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  onChanged: _orderC.name,
                  errorText: _orderC.name.value.length > 6 ||
                          _orderC.name.value.isEmpty
                      ? null
                      : 'Please enter your name',
                  hintText: 'Your Name',
                  suffixIcon: Icon(Icons.person),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChanged: _orderC.phone,
                  errorText: _orderC.phone.value.length >= 11 ||
                          _orderC.phone.value.isEmpty
                      ? null
                      : 'Please enter your Phone',
                  hintText: 'Your Phone',
                  suffixIcon: Icon(Icons.mobile_friendly_sharp),
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChanged: _orderC.address,
                  errorText: _orderC.address.value.length >= 10 ||
                          _orderC.address.value.isEmpty
                      ? null
                      : 'Please enter your Address',
                  hintText: 'Your Address',
                  suffixIcon: Icon(Icons.location_on_outlined),
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  maxLines: 4,
                  hasMaxLines: true,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  onChanged: _orderC.date,
                  errorText: _orderC.date.value.length >= 6 ||
                          _orderC.date.value.isEmpty
                      ? null
                      : 'Please enter your date',
                  hintText: 'Your Date',
                  suffixIcon: Icon(Icons.date_range_outlined),
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  child: Text(
                    'For confirmation sender details ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Column(
                    children: [
                      CustomTextField(
                        onChanged: _orderC.name,
                        errorText: _orderC.name.value.length > 6 ||
                                _orderC.name.value.isEmpty
                            ? null
                            : 'Please enter your name',
                        hintText: 'Your Name',
                        suffixIcon: Icon(Icons.person),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        onChanged: _orderC.email,
                        errorText: _orderC.email.value.isEmail ||
                                _orderC.email.value.isEmpty
                            ? null
                            : 'Please enter your Email',
                        hintText: 'Your Email',
                        suffixIcon: Icon(Icons.email),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        onChanged: _orderC.phone,
                        errorText: _orderC.phone.value.length >= 11 ||
                                _orderC.phone.value.isEmpty
                            ? null
                            : 'Please enter your name',
                        hintText: 'Your Phone',
                        suffixIcon: Icon(Icons.mobile_friendly_sharp),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (bool value) {},
                    ),
                    Text(
                      'Send Anonymous',
                      style: TextStyle(
                        fontSize: 16,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          offset: Offset(0, 15),
                          blurRadius: 30.0,
                        )
                      ],
                    ),
                    child: RaisedButton(
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      color: Color(0xFF4F8188),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(
                            Icons.trending_flat,
                            color: Colors.white,
                            size: 35,
                          )
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future errorDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (c) {
        return AlertDialog(
          content: Text('Please fiel the input'),
          actions: [
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Ok'),
            )
          ],
        );
      },
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    @required this.onChanged,
    @required this.errorText,
    @required this.hintText,
    @required this.suffixIcon,
    @required this.keyboardType,
    @required this.textInputAction,
    this.hasMaxLines = false,
    this.maxLines,
  }) : super(key: key);

  final Function onChanged;
  final String errorText;
  final String hintText;
  final Icon suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int maxLines;
  final bool hasMaxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
        errorText: errorText,
        filled: true,
        hintText: hintText ?? 'Text',
        suffixIcon: suffixIcon,
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

// class CustomTextField extends StatelessWidget {
//   final String hintText;
//   final String errorText;
//   final TextInputType keyboardType;
//   final Icon suffixIcon;
//   final TextEditingController controller;
//   final Function onChanged;
//   final int maxLines;
//   final bool hasMaxLines;
//   final TextInputAction textInputAction;

//   const CustomTextField({
//     Key key,
//     @required this.hintText,
//     @required this.errorText,
//     @required this.keyboardType,
//     this.suffixIcon,
//     this.controller,
//     @required this.onChanged,
//     this.maxLines,
//     this.hasMaxLines = false,
//     this.textInputAction,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: hasMaxLines ? 80 : 50,
//       child: TextField(
//         controller: controller,
//         onChanged: onChanged,
//         maxLines: maxLines,
//         decoration: InputDecoration(
//           errorText: errorText,
//           filled: true,
//           hintText: hintText,
//           suffixIcon: suffixIcon,
//           contentPadding: EdgeInsets.fromLTRB(20, hasMaxLines ? 25 : 5, 0, 0),
//           border: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.circular(25.7),
//           ),
//         ),
//         keyboardType: keyboardType,
//         textInputAction: textInputAction,
//       ),
//     );
//   }
// }
