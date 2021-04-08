import 'package:gifty/src/pages/homePage.dart';
import 'package:gifty/src/pages/loginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseController extends GetxController {
  final _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> getData(collectionName) {
    return _firestore.collection(collectionName).snapshots();
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

  Stream<QuerySnapshot> getUserOrders() {
    final uId = FirebaseAuth.instance.currentUser.uid;

    return _firestore
        .collection('orders')
        .where('uId', isEqualTo: uId)
        .snapshots();
  }

  Stream<QuerySnapshot> getProductByCategory(menu) {
    // final uId = FirebaseAuth.instance.currentUser.uid;

    return _firestore
        .collection('products')
        .where('menu', isEqualTo: menu)
        .snapshots();
  }

  //Login Sign Up Function

  FirebaseAuth _auth = FirebaseAuth.instance;

  final _firebaseUser = Rx<User>(null);

  String get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());

    print(" Auth Change :   ${_auth.currentUser}");
    super.onInit();
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

  Future<DocumentSnapshot> getUserData(collectionName) {
    CollectionReference userData =
        FirebaseFirestore.instance.collection(collectionName);
    var cUser = _auth.currentUser;
    return userData.doc(cUser.uid).get();
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
