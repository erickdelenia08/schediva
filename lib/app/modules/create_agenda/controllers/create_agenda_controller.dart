import 'package:app_jadwal/app/modules/group/controllers/group_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateAgendaController extends GetxController {
  late TextEditingController titleC;
  late TextEditingController descC;
  late TextEditingController locC;
  late DateTime dateTime;
  late TimeOfDay time1;
   late TimeOfDay time2;
  late CollectionReference agenda;
  void setDateTime(DateTime dateT) {
    dateTime = dateT;
    update(['date']);
  }

  void setTime(TimeOfDay newTime) {
    time1 = newTime;
    update(['time']);
  }
   void setTime2(TimeOfDay newTime) {
    time2 = newTime;
    update(['time2']);
  }

  Future<void> setAgenda() {
    return agenda.add({
      'id_group': Get.find<GroupController>().idGroup,
      'nama': titleC.text,
      'tanggal': DateFormat.yMMMd().format(dateTime),
      'jam': time1.toString(),
      'lokasi': locC.text,
      'deskripsi': descC.text
    }).then((value) {
      value.update({'id_agenda': value.id});
      Get.back();
      Get.snackbar('Status', 'berhasil menambahkan agenda di grup',
          duration: const Duration(seconds: 2));
    }).catchError((error) {
      Get.back();
      Get.snackbar('Status', 'Failed to add user: $error',
          duration: const Duration(seconds: 2));
    });
  }

  @override
  void onInit() {
    agenda = FirebaseFirestore.instance.collection('agenda');
    dateTime = DateTime.now();
    time1 = TimeOfDay.now();
    time2= TimeOfDay.now();
    titleC = TextEditingController();
    descC = TextEditingController();
    locC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    titleC.dispose();
    descC.dispose();
    locC.dispose();
    super.onClose();
  }
}
