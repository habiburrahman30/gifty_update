import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:gifty/src/pages/homePage.dart';
import 'package:gifty/src/pages/loginPage.dart';
import 'package:gifty/src/validators/validator.dart';
import 'package:rxdart/streams.dart';
import 'package:rxdart/subjects.dart';

class AuthController extends GetxController with Validator {
  final _auth = FirebaseAuth.instance;

// for login

  final _emailLogin = BehaviorSubject<String>();
  final _passwordLogin = BehaviorSubject<String>();

  Stream<String> get emailLoginStream =>
      _emailLogin.stream.transform(validateEmail);

  Stream<String> get passwordLoginStream =>
      _passwordLogin.stream.transform(validatePassword);

  Function(String) get changeEmailLogin => _emailLogin.sink.add;
  Function(String) get changePasswordLogin => _passwordLogin.sink.add;

  // -------------------------------

  // button Validation
  Stream<bool> get loginButtonValid => CombineLatestStream.combine2(
        emailLoginStream,
        passwordLoginStream,
        (email, password) {
          if (email == emailLoginStream &&
              password == _passwordLogin.valueWrapper.value) {
            return true;
          } else {
            return null;
          }
        },
      );

// for registration
  final fullName = ''.obs;
  final email = ''.obs;
  final password = ''.obs;

  // -------------------------------
  // for Forgot Password
  final forgotPassword = ''.obs;

  // -------------------------------
  void login() async {
    try {
      final authResult = await _auth.signInWithEmailAndPassword(
        email: _emailLogin.valueWrapper.value,
        password: _passwordLogin.valueWrapper.value,
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

  clearDispose() {
    _emailLogin.close();
    _passwordLogin.close();

    super.dispose();
  }
}
