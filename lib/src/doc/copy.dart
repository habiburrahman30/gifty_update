import 'package:gifty/src/components/bezierContainer.dart';
import 'package:gifty/src/pages/signUpPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              contentPadding: EdgeInsets.only(left: 20),
                              hintText: 'Email or Phone',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: new BorderRadius.circular(25.7),
                              ),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              filled: true,
                              contentPadding: EdgeInsets.only(left: 20),
                              hintText: 'Password',
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(25.7),
                              ),
                            ),
                            keyboardType: TextInputType.visiblePassword,
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
                              Text(
                                'Forgot Password ?',
                                style: TextStyle(
                                  fontSize: 14,
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
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: Offset(0, 15),
                                  blurRadius: 30.0,
                                )
                              ],
                            ),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(
                                horizontal: 60,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              color: Color(0xFF4F8188),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              onPressed: () {},
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
