import 'package:app_jadwal/app/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/list_jadwal.dart';

class InsertScheduleController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var jadwal;
  late CollectionReference collection;

  int idxTabController = 0;

  void tambahJadwal(
      {required int tag, required int idDay, required Waktu waktu}) async {
    // jadwal[idDay].add(waktu);

    if (jadwal != null) {
      collection
          .doc(Get.find<AuthController>().idUser)
          .update({getDayName(idDay): jadwal[idDay]});
    } else {
      debugPrint('NUlllllll dan akand ibuat dokumennya');
      collection.doc(Get.find<AuthController>().idUser).set(
        {
          'id': Get.find<AuthController>().idUser,
          getDayName(idDay): [
            {
              'title': waktu.title,
              'deskripsi': waktu.deskripsi,
              'jadwal': [waktu.batasBawah, waktu.batasAtas]
            }
          ]
        },
      );
    }
    update([tag]);
  }

  void pindahJadwal(
      {required int tag,
      required int initDay,
      required int idxItem,
      required int finalDay,
      required Waktu waktu}) {
    jadwal[finalDay].add(waktu);
    jadwal[initDay].removeAt(idxItem);
    update([tag]);
  }

  void ubahJadwal(
      {required int tag,
      required int idDay,
      required int idxItem,
      required Waktu waktu}) {
    jadwal[idDay][idxItem] = waktu;
    update([tag]);
  }

  void hapusJadwal({required int id, required int idxItem, required idDay}) {
    jadwal[idDay].removeAt(idxItem);
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
