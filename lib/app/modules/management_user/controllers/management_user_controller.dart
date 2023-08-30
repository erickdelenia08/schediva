import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ManagementUserController extends GetxController {
  late bool statusAdmin;
  late Stream<QuerySnapshot> usersStream;
  ManagementUserController({String? kode}) {
    if (kode == '2') {
      statusAdmin = true;
    } else {
      statusAdmin = false;
    }
    update();
  }

  void setStatusAdmin(String kode) {
    if (kode == '2') {
      statusAdmin = true;
    } else {
      statusAdmin = false;
    }
    update();
  }

  @override
  void onInit() {
    usersStream = FirebaseFirestore.instance.collection('users').snapshots();
    super.onInit();
  }
}
