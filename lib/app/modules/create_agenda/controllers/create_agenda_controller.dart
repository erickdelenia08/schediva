import 'package:app_jadwal/app/modules/create_agenda/class/check_schedule.dart';
import 'package:app_jadwal/app/modules/group/controllers/group_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class CreateAgendaController extends GetxController {
  late TextEditingController titleC;
  late TextEditingController descC;
  late TextEditingController locC;
  late DateTime date;
  late DateTime time;
  late DateTime time2;
  late CollectionReference agenda;
  void setDateTime(DateTime dateT) {
    date = dateT;
    setTime(TimeOfDay.fromDateTime(time));
    setTime2(TimeOfDay.fromDateTime(time2));
    update(['date']);
  }

  void setTime(TimeOfDay newTime) {
    time =
        DateTime(date.year, date.month, date.day, newTime.hour, newTime.minute);
    update(['time']);
  }

  void setTime2(TimeOfDay newTime) {
    time2 =
        DateTime(date.year, date.month, date.day, newTime.hour, newTime.minute);
    update(['time2']);
  }

  void setAgenda() async {
    agenda.add({
      'id_group': Get.find<GroupController>().idGroup,
      'nama': titleC.text,
      'start': time,
      'nama_group': Get.find<GroupController>().groupName,
      'end': time2,
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

  void cekAgenda() async {
    CollectionReference schedules =
        FirebaseFirestore.instance.collection('jadwal');
    QuerySnapshot<Object?> querySnapshot = await schedules
        .where('id', whereIn: Get.find<GroupController>().idMember)
        .get();
    var data = querySnapshot.docs;
    debugPrint(
        '${data[0][DateFormat.E().format(date)].toString()} ajsdkfjasdklfjlaskdjf');
    CheckSchedule checkSchedule = CheckSchedule(
        scheduleParticipants: data,
        startAgenda: time,
        endAgenda: time2,
        day: DateFormat.E().format(date));
    bool kondisi = checkSchedule.cekStatus();
    debugPrint(
        'KONDISIIIIIIII   $kondisi dann ${checkSchedule.listCrashed.toString()}');
    if (!kondisi) {
      Get.dialog(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: HexColor('#FD9300'),
                height: 55,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.warning,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Jadwal Crash',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: checkSchedule.listCrashed!.entries.map(
                      (e) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FutureBuilder(
                                  future: FirebaseFirestore.instance
                                      .collection('users')
                                      .doc(e.key)
                                      .get(),
                                  builder: (ctx, snapshot) {
                                    if (snapshot.hasError) {
                                      return const Text("Something went wrong");
                                    }

                                    if (snapshot.hasData &&
                                        !snapshot.data!.exists) {
                                      return const Text(
                                          "Document does not exist");
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return Text(
                                        snapshot.data!['nama'],
                                        style: GoogleFonts.roboto(
                                          textStyle: const TextStyle(
                                              fontSize: 18,
                                              decoration: TextDecoration.none,
                                              color: Colors.black),
                                        ),
                                      );
                                    } else {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  }),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: (e.value as List<dynamic>).map(
                                  (e) {
                                    return Text(
                                      '${e['title']} [${e['jadwal'][0]}-${e['jadwal'][1]}]',
                                      style: GoogleFonts.roboto(
                                        textStyle: const TextStyle(
                                            fontSize: 16,
                                            decoration: TextDecoration.none,
                                            color: Colors.black),
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                              const Divider(
                                color: Colors.black,
                              )
                            ],
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 55,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              HexColor('#FD9300')),
                          // shape:
                          //     MaterialStateProperty.all<RoundedRectangleBorder>(
                          //   RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(10),
                          //       side: BorderSide.none),
                          // ),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Batal',
                            style: GoogleFonts.roboto(
                              color: HexColor('#F0E8F3'),
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              HexColor('#FD9300')),
                          // shape:
                          //     MaterialStateProperty.all<RoundedRectangleBorder>(
                          //   RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(10),
                          //       side: BorderSide.none),
                          // ),
                        ),
                        onPressed: () {
                          setAgenda();
                        },
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Paksa',
                            style: GoogleFonts.roboto(
                              color: HexColor('#F0E8F3'),
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      setAgenda();
    }
  }

  @override
  void onInit() {
    agenda = FirebaseFirestore.instance.collection('agenda');
    date = DateTime.now();
    time = DateTime.now();
    time2 = DateTime.now();
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
