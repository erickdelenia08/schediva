import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class JoineventController extends GetxController {
  int idxFilter = 0;
  late Stream<QuerySnapshot> usersStream;

  @override
  void onInit() {
    usersStream = FirebaseFirestore.instance
        .collection('group')
        .snapshots();
    super.onInit();
  }

  void setFilterGroup({String? idUser}) {
    if (idxFilter == 0) {
      usersStream = FirebaseFirestore.instance.collection('group').snapshots();
    } else if (idxFilter == 1) {
      usersStream = FirebaseFirestore.instance
          .collection('group')
          .where('id_owner', isEqualTo: idUser)
          .snapshots();
    } else if (idxFilter == 3) {
      usersStream = FirebaseFirestore.instance
          .collection('group')
          .where('id_member', arrayContains: idUser)
          .snapshots();
    }
    update(['card']);
  }
}
