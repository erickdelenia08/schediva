import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CheckSchedule {
  List<QueryDocumentSnapshot<Object?>> scheduleParticipants;
  DateTime startAgenda;
  DateTime endAgenda;
  String? day;
  Map<String, dynamic>? listCrashed;
  CheckSchedule(
      {required this.scheduleParticipants,
      required this.startAgenda,
      required this.endAgenda,
      this.day});
  bool cekStatus() {
    listCrashed = {};
    bool condition = true;
    for (int i = 0; i < scheduleParticipants.length; i++) {
      var person = scheduleParticipants[i];
      var schedulesInDay = person[day!];
      for (int j = 0; j < schedulesInDay.length; j++) {
        DateTime timeStart = DateTime(
            startAgenda.year,
            startAgenda.month,
            startAgenda.day,
            int.parse(schedulesInDay[j]['jadwal'][0].split('.')[0]),
            int.parse(schedulesInDay[j]['jadwal'][0].split('.')[1]));
        DateTime timeEnd = DateTime(
            startAgenda.year,
            startAgenda.month,
            startAgenda.day,
            int.parse(schedulesInDay[j]['jadwal'][1].split('.')[0]),
            int.parse(schedulesInDay[j]['jadwal'][1].split('.')[1]));
        debugPrint(
            'inini ${timeStart.toString()} dan ini agendanya ${startAgenda.toString()} -${endAgenda.toString()}');
        debugPrint('is before? ${timeStart.isBefore(endAgenda)}');

        if ((timeStart.isAfter(startAgenda) && timeStart.isBefore(endAgenda)) ||
            (timeEnd.isAfter(startAgenda) && timeEnd.isBefore(endAgenda))) {
          debugPrint('inini falsee bentrok');
          condition = false;
          if (listCrashed![person['id']] == null) {
            listCrashed!.addAll({
              person['id']: [
                {
                  'title': schedulesInDay[j]['title'],
                  'deskripsi': schedulesInDay[j]['deskripsi'],
                  'jadwal': schedulesInDay[j]['jadwal']
                }
              ]
            });
          } else {
            listCrashed![person['id']].add({
              'title': schedulesInDay[j]['title'],
              'deskripsi': schedulesInDay[j]['deskripsi'],
              'jadwal': schedulesInDay[j]['jadwal']
            });
          }
        }
      }
    }
    return condition;
  }
}
