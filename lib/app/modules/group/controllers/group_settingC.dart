import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupSettingC extends GetxController{
  late TextEditingController txtTitleC;
  late TextEditingController txtDescC;
  late TextEditingController txtTagarC;
  late TextEditingController txtTokenC;
  
  CollectionReference group = FirebaseFirestore.instance.collection('group');

  Future<void> getInfoGroup(String idGroup) async{
    DocumentSnapshot<Object?> snpsht= await group.doc(idGroup).get();
    var data=snpsht.data() as dynamic;
    txtTitleC.text=data['nama'];
    txtDescC.text=data['deskripsi'];
    txtTagarC.text=data['tagar'];
    txtTokenC.text=data['token'];
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