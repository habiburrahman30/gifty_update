import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gifty/src/pages/homePage.dart';
import 'package:gifty/src/pages/loginPage.dart';
import 'package:gifty/src/validators/validator.dart';

class AuthController extends GetxController with Validator {
  final _auth = FirebaseAuth.instance;

// for login

  final emailLogin = ''.obs;
  final passwordLogin = ''.obs;

// for registration
  final fullName = ''.obs;
  final email = ''.obs;
  final password = ''.obs;
  final confirmPassword = ''.obs;

  // for Forgot Password
  final forgotPassword = ''.obs;

  // for Remember Me
  final rememberMe = false.obs;
  manageRememberMe() {
    rememberMe.toggle();
  }

  bool loginButtonValidCheck() {
    if (emailLogin.value.isEmail && passwordLogin.value.length >= 6) {
      return true;
    } else
      return false;
  }

  // -------------------------------
  void login() async {
    try {
      final authResult = await _auth.signInWithEmailAndPassword(
        email: emailLogin.value,
        password: passwordLogin.value,
      );

      if (authResult != null) {
        Get.offAll(HomePage());
      } else {
        Get.snackbar("Email or password wrong", '');
      }
    } catch (e) {
      Get.snackbar("Email or password wrong", '');
    }
  }

  void register() async {
    try {
      final user = (await _auth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      ))
          .user;

      if (user != null) {
        Map<String, dynamic> userdata = {
          'uid': user.uid,
          "fullName": fullName.value,
          "email": email.value,
          "imgUrl": null,
          "phone": null,
          "address": null,
          "status": 'enable',
        };
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .set(userdata);
        Get.offAll(HomePage());
      } else {
        Get.snackbar("Error while creating account ", '');
      }
    } catch (e) {
      Get.snackbar("Unknown error", '');
    }
  }

  //log Out
  //----------------------
  void signOut() async {
    await _auth.signOut().then((value) => Get.offAll(LoginPage()));
  }

  //Forgot Password
  //----------------------
  void sendPasswordResetEmail(String forgotPassword) async {
    await _auth.sendPasswordResetEmail(email: forgotPassword).then((value) {
      Get.offAll(LoginPage());
      Get.snackbar("Password Reset email link is been sent", "Success");
    }).catchError(
        (onError) => Get.snackbar("Error In Email Reset", onError.message));
  }

  void forgotPass() async {
    try {
      final forfot =
          (await _auth.sendPasswordResetEmail(email: forgotPassword.value));

// if () {

// } else {
//   Get.snackbar("Error while creating account ", '');
// }

    } catch (e) {
      Get.snackbar("Unknown error", '');
    }
  }
}
