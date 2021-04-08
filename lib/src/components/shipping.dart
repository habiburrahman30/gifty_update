import 'package:flutter/cupertino.dart';
import 'package:gifty/src/config/appTheme.dart';

import 'package:gifty/src/controllers/orderController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Shipping extends StatefulWidget {
  @override
  _ShippingState createState() => _ShippingState();
}

class _ShippingState extends State<Shipping> {
  final _orderC = Get.put(OrderController(), permanent: true);
  @override
  void dispose() {
    _orderC.step.value = 1;
    _orderC.date.value = '';
    _orderC.name.value = '';
    _orderC.phone.value = '';
    _orderC.address.value = '';
    _orderC.senderName.value = '';
    _orderC.senderEmail.value = '';
    _orderC.senderPhone.value = '';
    _orderC.userDateReady.value = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
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
                    hintText: 'Name',
                    suffixIcon: Icon(Icons.person),
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    onChanged: _orderC.phone,
                    errorText: _orderC.phone.value.isNotEmpty &&
                            _orderC.phone.value.length == 11
                        ? null
                        : _orderC.phone.value.isEmpty
                            ? null
                            : 'Please enter valid phone number',
                    hintText: '+8801XXXXXXXXX',
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
                    hintText: 'Address',
                    suffixIcon: Icon(Icons.location_on_outlined),
                    keyboardType: TextInputType.streetAddress,
                    textInputAction: TextInputAction.next,
                    maxLines: 4,
                    hasMaxLines: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    readOnly: true,
                    onTap: () async {
                      final value = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        initialDate: DateTime.now(),
                        lastDate: DateTime.utc(DateTime.now().year + 1, 1, 1),
                      );

                      _orderC.date.value =
                          '${value.day}/${value.month}/${value.year}';
                    },
                    decoration: InputDecoration(
                      hintText: _orderC.date.value.isEmpty
                          ? 'Select date'
                          : _orderC.date.value,
                      filled: true,
                      contentPadding: EdgeInsets.fromLTRB(20, 25, 0, 0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(25.7),
                      ),
                    ),
                  ),

                  !_orderC.sendAnonymous.value
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                            Obx(
                              () {
                                return _orderC.userDateReady.value
                                    ? Container(
                                        child: Column(
                                          children: [
                                            CustomTextField(
                                              initalText:
                                                  _orderC.senderName.value,
                                              onChanged: _orderC.senderName,
                                              errorText: _orderC.senderName
                                                              .value.length >
                                                          6 ||
                                                      _orderC.senderName.value
                                                          .isEmpty
                                                  ? null
                                                  : 'Please enter your name',
                                              hintText: 'Your name',
                                              suffixIcon: Icon(Icons.person),
                                              keyboardType: TextInputType.name,
                                              textInputAction:
                                                  TextInputAction.next,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            CustomTextField(
                                              initalText:
                                                  _orderC.senderEmail.value,
                                              onChanged: _orderC.senderEmail,
                                              errorText: _orderC.senderEmail
                                                          .value.isEmail ||
                                                      _orderC.senderEmail.value
                                                          .isEmpty
                                                  ? null
                                                  : 'Please enter your Email',
                                              hintText: 'Your email',
                                              suffixIcon: Icon(Icons.email),
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              textInputAction:
                                                  TextInputAction.next,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            CustomTextField(
                                              initalText:
                                                  _orderC.senderPhone.value,
                                              onChanged: _orderC.senderPhone,
                                              errorText: _orderC.senderPhone
                                                          .value.isNotEmpty &&
                                                      _orderC.senderPhone.value
                                                              .length ==
                                                          11
                                                  ? null
                                                  : _orderC.senderPhone.value
                                                          .isEmpty
                                                      ? null
                                                      : 'Please enter valid phone number',
                                              hintText: '+8801XXXXXXXXX',
                                              suffixIcon: Icon(
                                                Icons.mobile_friendly_sharp,
                                              ),
                                              keyboardType: TextInputType.phone,
                                              textInputAction:
                                                  TextInputAction.done,
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container();
                              },
                            ),
                          ],
                        )
                      : Container(), // Container(

                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: .7,
                          child: CupertinoSwitch(
                            value: _orderC.sendAnonymous.value,
                            onChanged: (v) => _orderC.manageSendAnonymous(),
                          ),
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
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Obx(
                    () => Center(
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
                        child: TextButton.icon(
                          onPressed: _orderC.checkValidation()
                              ? () => _orderC.next(2)
                              : null,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              _orderC.checkValidation()
                                  ? AppTheme.color1
                                  : AppTheme.color1.withOpacity(.6),
                            ),
                            shape: MaterialStateProperty.all(
                              StadiumBorder(),
                            ),
                            padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 5,
                              ),
                            ),
                          ),
                          icon: Icon(
                            Icons.trending_flat,
                            color: Colors.white,
                            size: 35,
                          ),
                          label: Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
          ],
        ),
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
    this.controller,
    this.initalText,
  }) : super(key: key);

  final Function onChanged;
  final String errorText;
  final String hintText;
  final String initalText;
  final Icon suffixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int maxLines;
  final bool hasMaxLines;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initalText != null ? initalText : '',
      onChanged: onChanged,
      maxLines: maxLines,
      controller: controller,
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
