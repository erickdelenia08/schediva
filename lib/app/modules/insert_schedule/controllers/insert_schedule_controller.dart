import 'package:app_jadwal/app/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/list_jadwal.dart';

class InsertScheduleController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Map<String, dynamic>? jadwal;
  late CollectionReference collection;

  int idxTabController = 0;

  Future<void> fetchJadwal() async {
    DocumentSnapshot<Map<String, dynamic>> data = await FirebaseFirestore
        .instance
        .collection('jadwal')
        .doc(Get.find<AuthController>().idUser)
        .get();
    if (data.exists) {
      jadwal = data.data();
    } else {
      await collection.doc(Get.find<AuthController>().idUser).set(
        {
          'id': Get.find<AuthController>().idUser,
          getDayName(0): [],
          getDayName(1): [],
          getDayName(2): [],
          getDayName(3): [],
          getDayName(4): [],
          getDayName(5): [],
          getDayName(6): [],
        },
      ).then((_) => fetchJadwal());
    }
  }

  void tambahJadwal(
      {required int tag, required int idDay, required Waktu waktu}) async {
    if ((jadwal![getDayName(idDay)] as List<dynamic>).isNotEmpty) {
      List<dynamic> jadwalLama = jadwal![getDayName(idDay)] as List<dynamic>;
      jadwalLama.add(
        {
          'title': waktu.title,
          'deskripsi': waktu.deskripsi,
          'jadwal': [waktu.batasBawah, waktu.batasAtas]
        },
      );
      collection.doc(Get.find<AuthController>().idUser).update(
        {
          getDayName(idDay): jadwalLama,
        },
      ).then((_) {
        jadwal![getDayName(idDay)] = jadwalLama;
      });
    } else {
      collection.doc(Get.find<AuthController>().idUser).update(
        {
          getDayName(idDay): [
            {
              'title': waktu.title,
              'deskripsi': waktu.deskripsi,
              'jadwal': [waktu.batasBawah, waktu.batasAtas]
            }
          ],
        },
      ).then((_) {
        jadwal![getDayName(idDay)] = [
          {
            'title': waktu.title,
            'deskripsi': waktu.deskripsi,
            'jadwal': [waktu.batasBawah, waktu.batasAtas]
          }
        ];
      });
    }

    update([tag]);
  }

  void pindahJadwal(
      {required int tag,
      required int initDay,
      required int idxItem,
      required int finalDay,
      required Waktu waktu}) {
    // .add(waktu);.
    var jadwalFinal = jadwal![getDayName(finalDay)];
    var jadwalAwal = jadwal![getDayName(initDay)];
    jadwalFinal.add({
      'title': waktu.title,
      'deskripsi': waktu.deskripsi,
      'jadwal': [waktu.batasBawah, waktu.batasAtas]
    });
    jadwalAwal.removeAt(idxItem);
    collection.doc(Get.find<AuthController>().idUser).update({
      getDayName(finalDay): jadwalFinal,
      getDayName(initDay): jadwalAwal,
    }).then((_) {
      jadwal![getDayName(finalDay)] = jadwalFinal;
      jadwal![getDayName(initDay)] = jadwalAwal;
    });

    update([tag]);
  }

  void ubahJadwal(
      {required int tag,
      required int idDay,
      required int idxItem,
      required Waktu waktu}) {
    var jadwalLama = jadwal;
    jadwalLama![getDayName(idDay)][idxItem] = {
      'title': waktu.title,
      'deskripsi': waktu.deskripsi,
      'jadwal': [waktu.batasBawah, waktu.batasAtas]
    };
    collection
        .doc(Get.find<AuthController>().idUser)
        .update({getDayName(idDay): jadwalLama[getDayName(idDay)]});

    update([tag]);
  }

  void hapusJadwal({required int id, required int idxItem, required idDay}) {
    var jadwalLama = jadwal![getDayName(idDay)];
    jadwalLama.removeAt(idxItem);
    collection
        .doc(Get.find<AuthController>().idUser)
        .update({getDayName(idDay): jadwalLama}).then((_) {
      jadwal![getDayName(idDay)] = jadwalLama;
    });
    update([id]);
  }

  void updateIndexTabbar({required int id}) {
    idxTabController = id;
    update([id]);
  }

  @override
  void onInit() async {
    collection = FirebaseFirestore.instance.collection("jadwal");
    var doc = await collection.doc(Get.find<AuthController>().idUser).get();
    if (doc.exists) {
      doc.data();
    }
    super.onInit();
  }

  String getDayName(int id) {
    if (id == 0) {
      return 'senin';
    } else if (id == 1) {
      return 'selasa';
    } else if (id == 2) {
      return 'rabu';
    } else if (id == 3) {
      return 'kamis';
    } else if (id == 4) {
      return 'jumat';
    } else if (id == 5) {
      return 'sabtu';
    } else {
      return 'minggu';
    }
  }
}
