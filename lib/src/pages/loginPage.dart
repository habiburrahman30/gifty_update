import 'package:gifty/src/components/bezierContainer.dart';

import 'package:gifty/src/controllers/authController.dart';
import 'package:gifty/src/controllers/firebaseController.dart';
import 'package:gifty/src/pages/PhoneSignInPage.dart';
import 'package:gifty/src/pages/forgotPassword.dart';
import 'package:gifty/src/pages/signUpPage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _authC = Get.put(AuthController(), permanent: true);

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
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
                  Obx(
                    () => Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          TextField(
                            onChanged: _authC.emailLogin,
                            decoration: InputDecoration(
                              errorText: _authC.emailLogin.value.isNotEmpty &&
                                      _authC.emailLogin.value.isEmail
                                  ? null
                                  : _authC.emailLogin.value.isEmpty
                                      ? null
                                      : 'Please enter a valid email',
                              filled: true,
                              hintText: 'Email',
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
                            onChanged: _authC.passwordLogin,
                            decoration: InputDecoration(
                              errorText: _authC
                                          .passwordLogin.value.isNotEmpty &&
                                      _authC.passwordLogin.value.length >= 6
                                  ? null
                                  : _authC.emailLogin.value.isEmpty
                                      ? null
                                      : 'Password should be at least 6 character',
                              filled: true,
                              hintText: 'Password',
                              suffixIcon: Icon(Icons.lock),
                              contentPadding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                            ),
                            obscureText: true,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Transform.scale(
                                      scale: .7,
                                      child: CupertinoSwitch(
                                        activeColor: Color(0xFF4F8188),
                                        value: false,
                                        onChanged: (bool value) {},
                                      ),
                                    ),
                                    Text(
                                      'Rememberme',
                                      style: TextStyle(
                                        fontSize: 14,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.to(
                                    ForgotPassword(),
                                  );
                                },
                                child: Text(
                                  'Forgot Password ?',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            ],
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
                          ),
                          FlatButton(
                            padding: EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                            ),
                            disabledColor: Color(0xFF4F8188).withOpacity(.2),
                            color: Color(0xFF4F8188),
                            child: Container(
                              width: 70.0,
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            onPressed: _authC.loginButtonValidCheck()
                                ? () {
                                    _authC.login();
                                  }
                                : null,
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
                                onPressed: () {},
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
                                onPressed: () {},
                              ),
                              FlatButton(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 10,
                                ),
                                shape: CircleBorder(),
                                color: Color(0xFF4F8188),
                                child: FaIcon(
                                  FontAwesomeIcons.phone,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  Get.to(
                                    SignInWithPhone(),
                                  );
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 70,
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
