import 'package:get/get.dart';

import '../../../data/list_jadwal.dart';

class InsertScheduleController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var jadwal = ListJadwal().jadwal;

  int idxTabController=0;

  void tambahJadwal(
      {required int tag, required int idDay, required Waktu waktu}) {
    jadwal[idDay].add(waktu);
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

  void updateIndexTabbar({required int id}){
    idxTabController=id;
    update([id]);
  }
}
