import 'package:gifty/src/components/bezierContainer.dart';
import 'package:gifty/src/components/customInput.dart';
import 'package:gifty/src/controllers/firebaseController.dart';

import 'package:gifty/src/pages/loginPage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetWidget<FirebaseController> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final TextEditingController username = TextEditingController();
    final TextEditingController fullname = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    void registerUser() {
      controller.createUser(
          username.text, fullname.text, email.text, password.text);
    }

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          child: Stack(
            clipBehavior: Clip.none,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  Container(
                    child: Text(
                      'gifty',
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
                            hintText: 'User Name',
                            controller: username,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomInput(
                            hintText: 'Full Name',
                            controller: fullname,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomInput(
                            hintText: 'Email',
                            controller: email,
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomInput(
                            hintText: 'Password',
                            obscureText: true,
                            controller: password,
                          ),
                          SizedBox(
                            height: 30,
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
                                horizontal: 40,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              color: Color(0xFF4F8188),
                              onPressed: () {
                                registerUser();
                              },
                              child: Container(
                                width: 70.0,
                                child: Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 110,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              FlatButton(
                                padding: EdgeInsets.only(left: 5),
                                highlightColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onPressed: () {
                                  Get.to(
                                    LoginPage(),
                                  );
                                },
                                child: Text(
                                  'Login here',
                                  style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
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
