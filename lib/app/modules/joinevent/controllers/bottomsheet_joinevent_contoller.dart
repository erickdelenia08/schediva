import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class BSJoinEventC extends GetxController {
  late TextEditingController txtTitleC;
  late TextEditingController txtDescC;
  late TextEditingController txtTagarC;
  late TextEditingController txtTokenC;
  String? idGroup;
  String? token;
  int? idxItem;
  bool createStatus;
  List<dynamic>? idMember;
  BSJoinEventC({required this.createStatus, this.idxItem, this.token, this.idMember, this.idGroup});
  bool cekToken() {
    if (token == txtTokenC.text) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void onInit() {
    txtTitleC = TextEditingController();
    txtDescC = TextEditingController();
    txtTokenC = TextEditingController();
    txtTagarC = TextEditingController();
    super.onInit();
  }
}
