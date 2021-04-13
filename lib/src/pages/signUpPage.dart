import 'package:gifty/src/components/bezierContainer.dart';
import 'package:gifty/src/config/appTheme.dart';
import 'package:gifty/src/controllers/authController.dart';
import 'package:gifty/src/controllers/firebaseController.dart';

import 'package:gifty/src/pages/loginPage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetWidget<FirebaseController> {
  final _authC = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
                    child: Column(
                      children: [
                        TextField(
                          onChanged: _authC.fullName,
                          decoration: InputDecoration(
                            errorText: _authC.fullName.value.length >= 6 ||
                                    _authC.fullName.value.isEmpty
                                ? null
                                : 'Please enter valid email',
                            filled: true,
                            hintText: 'Your Name',
                            suffixIcon: Icon(Icons.person),
                            contentPadding:
                                EdgeInsets.fromLTRB(20, true ? 25 : 5, 0, 0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          onChanged: _authC.email,
                          decoration: InputDecoration(
                            errorText: _authC.email.value.isEmail ||
                                    _authC.email.value.isEmpty
                                ? null
                                : 'Please enter valid email',
                            filled: true,
                            hintText: 'Your Email',
                            suffixIcon: Icon(Icons.email),
                            contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          onChanged: _authC.password,
                          decoration: InputDecoration(
                            errorText: _authC.password.value.length >= 6 ||
                                    _authC.password.value.isEmpty
                                ? null
                                : 'Password should be at least 6 characters',
                            filled: true,
                            hintText: 'Your Password',
                            suffixIcon: Icon(Icons.lock),
                            contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(25.7),
                            ),
                          ),
                          obscureText: true,
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
                            disabledColor: Color(0xFF4F8188).withOpacity(.5),
                            color: AppTheme.color1,
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
                            onPressed: _authC.password.value.length >= 6 &&
                                    _authC.email.value.isEmail
                                ? () => _authC.register()
                                : null,
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
