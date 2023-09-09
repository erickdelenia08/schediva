import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int idx_event = -1;
  List<dynamic>? idGroups;
  late Timestamp timestampFilter;
  GlobalKey<RefreshIndicatorState> keyRefreshIdx = GlobalKey<RefreshIndicatorState>();

  @override
  void onInit() {
    var newDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 0, 0);
    timestampFilter = Timestamp.fromDate(newDate);
    update(['timeline']);
    super.onInit();
  }

  void setIdGroups(List<QueryDocumentSnapshot<Object?>> data) {
    for (int i = 0; i < data.length; i++) {
      idGroups?.add((data[i].data() as Map<String, dynamic>)['id_group']);
    }
  }

  void updateIdxEvent(
      {required int idx, required String id, required String prevId}) {
    idx_event = idx;
    update([id, prevId]);
  }

  void updateTimeLine(DateTime dateTime) {
    var newDate = DateTime(dateTime.year, dateTime.month, dateTime.day, 0, 0);
    timestampFilter = Timestamp.fromDate(newDate);
    update(['timeline']);
    debugPrint('NJAYSSSSSSS ${timestampFilter.toDate().toString()}');
  }

  Timestamp getUpperLimitTime() {
    var newDate = timestampFilter.toDate().add(const Duration(days: 1));
    return Timestamp.fromDate(newDate);
  }
}
