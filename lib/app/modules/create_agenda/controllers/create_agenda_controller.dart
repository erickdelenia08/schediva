import 'package:app_jadwal/app/modules/group/controllers/group_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAgendaController extends GetxController {
  late TextEditingController titleC;
  late TextEditingController descC;
  late TextEditingController locC;
  late DateTime dateTime;
  late DateTime dateTime2;
  late CollectionReference agenda;
  void setDateTime(DateTime dateT) {
    dateTime = dateT;
    update(['date']);
  }

  void setTime(TimeOfDay newTime) {
    dateTime=DateTime(dateTime.year, dateTime.month, dateTime.day, newTime.hour, newTime.minute);
    update(['time']);
  }

  void setTime2(TimeOfDay newTime) {
    dateTime2=DateTime(dateTime2.year, dateTime2.month, dateTime2.day, newTime.hour, newTime.minute);
    update(['time2']);
  }

  Future<void> setAgenda() {
    return agenda.add({
      'id_group': Get.find<GroupController>().idGroup,
      'nama': titleC.text,
      'start': dateTime,
      'nama_group':Get.find<GroupController>().groupName,
      'end': dateTime2,
      'lokasi': locC.text,
      'deskripsi': descC.text
    }).then(
      (value) {
        value.update({'id_agenda': value.id});
        Get.back();
        Get.snackbar(
          "Status",
          "berhasil menambahkan agenda di grup",
          colorText: Colors.black,
          backgroundColor: Colors.white,
          icon: const Icon(
            Icons.check_circle_sharp,
            color: Colors.green,
          ),
          duration: const Duration(seconds: 2),
          animationDuration: const Duration(milliseconds: 700),
        );
      },
    ).catchError(
      (error) {
        Get.back();
        Get.snackbar(
          "Status",
          "Failed to add user: $error",
          colorText: Colors.black,
          backgroundColor: Colors.white,
          icon: const Icon(
            Icons.close,
            color: Colors.green,
          ),
          duration: const Duration(seconds: 2),
          animationDuration: const Duration(milliseconds: 700),
        );
      },
    );
  }

  @override
  void onInit() {
    agenda = FirebaseFirestore.instance.collection('agenda');
    dateTime = DateTime.now();
    dateTime2 = DateTime.now();
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
