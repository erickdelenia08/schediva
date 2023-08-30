import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController emailC;
  late TextEditingController passwordC;
  late TextEditingController nama;

  @override
  void onInit() {
    emailC = TextEditingController();
    passwordC = TextEditingController();
    nama=TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    nama.dispose();
    super.onClose();
  }
}
