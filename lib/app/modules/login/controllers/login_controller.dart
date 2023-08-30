import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  late TextEditingController emailC;
   late TextEditingController passwordC;

  @override
  void onInit() {
    emailC=TextEditingController(text: '191810101079@mail.unej.ac.id');
    passwordC=TextEditingController(text: '123456');
    // emailC=TextEditingController();
    // passwordC=TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}
