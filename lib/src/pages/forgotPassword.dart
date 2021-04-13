import 'package:gifty/src/components/bezierContainer.dart';
import 'package:gifty/src/components/customInput.dart';
import 'package:gifty/src/config/appTheme.dart';
import 'package:gifty/src/controllers/firebaseController.dart';
import 'package:gifty/src/pages/signUpPage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ForgotPassword extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // Default Form Loading State
    TextEditingController email = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        // physics: BouncingScrollPhysics(),

        child: Container(
          child: Stack(
            children: [
              Positioned(
                top: -height * .15,
                right: -width * .4,
                child: BezierContainer(),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Image.asset(
                  'assets/images/loginbottom.png',
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 280,
                  ),
                  Container(
                    child: Text(
                      'Gifty',
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Form(
                      child: Column(
                        children: [
                          CustomInput(
                            hintText: 'Email',
                            textInputAction: TextInputAction.next,
                            controller: email,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
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
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              color: AppTheme.color1,
                              child: Container(
                                width: Get.width / 3.2,
                                child: Center(
                                  child: Text(
                                    'Reset Password',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                controller.sendPasswordResetEmail(email.text);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Or connect using',
                                style: TextStyle(
                                  fontSize: 18,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FlatButton(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 10,
                                ),
                                shape: CircleBorder(),
                                color: Color(0xFF3b5998),
                                child: FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  print('Facebook');
                                },
                              ),
                              FlatButton(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 10,
                                ),
                                shape: CircleBorder(),
                                color: Color(0xFFDB4437),
                                child: FaIcon(
                                  FontAwesomeIcons.google,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  print('Google');
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 115,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              FlatButton(
                                padding: EdgeInsets.only(right: 20),
                                highlightColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  Get.to(
                                    SignUpPage(),
                                  );
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
