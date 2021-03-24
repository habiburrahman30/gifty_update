import 'package:gifty/src/pages/homePage.dart';
import 'package:gifty/src/pages/loginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseController extends GetxController {
  Stream<QuerySnapshot> getData(collectionName) {
    return FirebaseFirestore.instance.collection(collectionName).snapshots();
  }

  Stream<DocumentSnapshot> getSingleProduct(
      {@required String collectionName, @required String id}) {
    return FirebaseFirestore.instance
        .collection(collectionName)
        .doc(id)
        .snapshots();
  }

  Future<void> addOrder(data, collectionName) async {
    var cUser = _auth.currentUser;
    CollectionReference user =
        FirebaseFirestore.instance.collection(collectionName);

    user
        .doc(cUser.uid)
        .collection('cartList')
        .add(data)
        .then((value) => print("Add Order in Your Cart List"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  Stream<DocumentSnapshot> getUserOrder(collectionName) {
    CollectionReference userData =
        FirebaseFirestore.instance.collection(collectionName);
    var cUser = _auth.currentUser;
    return userData.doc(cUser.uid).snapshots();
  }

  //Login Sign Up Function

  FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User> _firebaseUser = Rx<User>();

  String get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());

    print(" Auth Change :   ${_auth.currentUser}");
    super.onInit();
  }

  // function to createuser, login and sign out user
  /// Email Sign Up.
  /// [SignUp With Email],
  /// Email Sign Up.

  void createUser(
      String username, String fullname, String email, String password) async {
    try {
      final user = (await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;

      if (user != null) {
        Map<String, dynamic> userdata = {
          'uid': user.uid,
          "userName": username,
          "fullName": fullname,
          "email": email,
          "imgUrl": null,
          "phone": null,
          "address": null,
        };
        await FirebaseFirestore.instance.collection("users").add(userdata);
        Get.offAll(HomePage());
      } else {
        Get.snackbar("Error while creating account ", '');
      }
    } catch (e) {
      Get.snackbar("Unknown error", '');
    }
  }

  /// Email SignIn Function.
  /// [SignIn With Email],
  /// Email SignIn.

  void login(String email, String password) async {
    await _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => Get.offAll(HomePage()))
        .catchError(
          (onError) => Get.snackbar(
            "Error while sign in ",
            onError.message,
            backgroundColor: Colors.green[400],
            colorText: Colors.white,
          ),
        );
  }

  /// Email sign Out Function.
  /// [Email SignOut],
  /// Email sign Out.

  void signOut() async {
    await _auth.signOut().then((value) => Get.offAll(LoginPage()));
  }

  /// Forgot Password Function.
  /// [Forgot Password],
  /// Email Password Reset.

  void sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email).then((value) {
      Get.offAll(LoginPage());
      Get.snackbar("Password Reset email link is been sent", "Success");
    }).catchError(
        (onError) => Get.snackbar("Error In Email Reset", onError.message));
  }

  /// Get user all data Function.
  /// [Get User Data],
  /// User data.

  Stream<DocumentSnapshot> getUserData(collectionName) {
    CollectionReference userData =
        FirebaseFirestore.instance.collection(collectionName);
    var cUser = _auth.currentUser;
    return userData.doc(cUser.uid).snapshots();
  }

  /// Update user data Function.
  /// [Update User],
  /// Update user.

  Future<void> updateUser(data, collectionName) async {
    var cUser = _auth.currentUser;
    CollectionReference user =
        FirebaseFirestore.instance.collection(collectionName);

    user
        .doc(cUser.uid)
        .update(data)
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

//   // ignore: non_constant_identifier_names
//   void google_signIn() async {
//     final GoogleSignInAccount googleUser = await googleSignIn.signIn();

//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//         idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

//     final User user = (await _auth
//         .signInWithCredential(credential)
//         .then((value) => Get.offAll(HomePage())));
//   }

// // ignore: non_constant_identifier_names
//   void google_signOut() async {
//     await googleSignIn.signOut().then((value) => Get.offAll(LoginPage()));
//   }

  /// Google SignIn Function.
  /// [signInWithGoogl],
  /// Google SignIn Function.
  // GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );
    final result = await _auth.signInWithCredential(credential);
    User user = result.user;

    if (user != null) {
      Get.offAll(
        HomePage(),
      );
    }
  }

  /// Facebook SignIn Function .
  /// [signInWithFacebook],
  /// Facebook SignIn.

  /// Phone SignIn Function.
  /// [signInWithPhone],
  /// Phone SignIn.

  // Future<Null> signInWithPhone(String phone, BuildContext context) async {
  //   final _codeController = TextEditingController();
  //   _auth.verifyPhoneNumber(
  //     phoneNumber: phone,
  //     timeout: Duration(seconds: 60),
  //     verificationCompleted: (AuthCredential credential) async {
  //       Navigator.of(context).pop();

  //       final result = await _auth.signInWithCredential(credential);
  //       User user = result.user;

  //       if (user != null) {
  //         Get.offAll(HomePage());
  //       } else {
  //         print("Error");
  //       }

  //       //This callback would gets called when verification is done auto maticlly
  //     },
  //     verificationFailed: (FirebaseAuthException exception) {
  //       print(exception);
  //     },
  //     codeSent: (String verificationId, [int forceResendingToken]) {
  //       showDialog(
  //         context: context,
  //         barrierDismissible: false,
  //         builder: (context) {
  //           return AlertDialog(
  //             title: Text("Give the code?"),
  //             content: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: [
  //                 TextField(
  //                   controller: _codeController,
  //                 ),
  //               ],
  //             ),
  //             actions: [
  //               FlatButton(
  //                 child: Text("Confirm"),
  //                 textColor: Colors.white,
  //                 color: Colors.blue,
  //                 onPressed: () async {
  //                   final code = _codeController.text.trim();
  //                   AuthCredential credential = PhoneAuthProvider.credential(
  //                       verificationId: verificationId, smsCode: code);

  //                   final result = await _auth.signInWithCredential(credential);
  //                   User user = result.user;

  //                   if (user != null) {
  //                     Get.offAll(HomePage());
  //                   } else {
  //                     print("Error");
  //                   }
  //                 },
  //               )
  //             ],
  //           );
  //         },
  //       );
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }
}
