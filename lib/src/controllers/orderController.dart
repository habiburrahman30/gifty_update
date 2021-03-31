import 'package:get/get.dart';
import 'package:gifty/src/controllers/firebaseController.dart';

class OrderController extends GetxController {
  final _firebaseC = Get.put(FirebaseController());

  final step = 1.obs;

  final name = ''.obs;
  final phone = ''.obs;
  final address = ''.obs;
  final date = ''.obs;

  final senderName = ''.obs;
  final senderEmail = ''.obs;
  final senderPhone = ''.obs;

  final sendAnonymous = true.obs;

  final userDateReady = false.obs;

  void manageSendAnonymous() {
    sendAnonymous.toggle();
    if (sendAnonymous.value == false) {
      setData();
    }
  }

  void setData() async {
    final user = await _firebaseC.getUserData('users');
    senderName.value = user['fullName'];
    senderEmail.value = user['email'];
    senderPhone.value = user['phone'] ?? '';

    userDateReady.value = true;
  }

  bool checkValidation() {
    if (sendAnonymous.value == true) {
      if (name.value.length > 6 &&
          phone.value.length == 11 &&
          // address.value.length > 10 &&
          date.value.length > 8) {
        return true;
      }
    }
    return false;
  }

  void next(int v) {
    step.value = v;
  }

  double getProgress() {
    if (step.value == 1) {
      return 0.33;
    }
    if (step.value == 2) {
      return 0.66;
    }
    if (step.value == 2) {
      return 1.0;
    }
    return 1.0;
  }
}
