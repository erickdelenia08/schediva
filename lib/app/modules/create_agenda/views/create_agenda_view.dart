import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

import '../controllers/create_agenda_controller.dart';

class CreateAgendaView extends GetView<CreateAgendaController> {
  const CreateAgendaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#0B1D26'),
        appBar: AppBar(
          backgroundColor: HexColor('#0B1D26'),
          title: const Text('Tambah Agenda Baru'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 30,
              ),
              GetBuilder(
                  init: controller,
                  builder: (context) {
                    return TextFormField(
                      controller: controller.titleC,
                      maxLines: 1,
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(fontSize: 14)),
                      cursorColor: HexColor('#FD9300'),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        hintText: 'Kegiatan',
                        filled: true,
                        fillColor: HexColor('#F0E8F3'),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(10, 10))),
                      ),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              GetBuilder(
                  init: controller,
                  builder: (context) {
                    return TextFormField(
                      controller: controller.locC,
                      maxLines: 1,
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(fontSize: 14)),
                      cursorColor: HexColor('#FD9300'),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        hintText: 'lokasi',
                        filled: true,
                        fillColor: HexColor('#F0E8F3'),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(10, 10))),
                      ),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 45,
                      decoration: BoxDecoration(
                          color: HexColor('#FD9300'),
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            initialTime: TimeOfDay.fromDateTime(controller.dateTime),
                            context: context,
                          );

                          if (pickedTime != null) {
                            controller.setTime(pickedTime);
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GetBuilder(
                                id: 'time',
                                init: controller,
                                builder: (ctx) {
                                  return Text(
                                    TimeOfDay.fromDateTime(controller.dateTime2).format(context),
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        color: HexColor('#F0E8F3'),
                                      ),
                                    ),
                                  );
                                }),
                            Icon(
                              Icons.access_time,
                              color: HexColor('#F0E8F3'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      height: 45,
                      decoration: BoxDecoration(
                          color: HexColor('#FD9300'),
                          borderRadius: BorderRadius.circular(10)),
                      child: InkWell(
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            initialTime: TimeOfDay.fromDateTime(controller.dateTime2),
                            context: context,
                          );

                          if (pickedTime != null) {
                            controller.setTime2(pickedTime);
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GetBuilder(
                                id: 'time2',
                                init: controller,
                                builder: (ctx) {
                                  return Text(
                                    TimeOfDay.fromDateTime(controller.dateTime2).format(context),
                                    style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                        color: HexColor('#F0E8F3'),
                                      ),
                                    ),
                                  );
                                }),
                            Icon(
                              Icons.access_time,
                              color: HexColor('#F0E8F3'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: 45,
                decoration: BoxDecoration(
                    color: HexColor('#FD9300'),
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: controller.dateTime,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2099),
                      selectableDayPredicate: (day) {
                        if (day.isAfter(DateTime.now()
                            .subtract(const Duration(days: 1)))) {
                          return true;
                        } else {
                          return false;
                        }
                      },
                    ).then((date) {
                      if (date != null) {
                        controller.setDateTime(date);
                      }
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetBuilder(
                          id: 'date',
                          init: controller,
                          builder: (context) {
                            return Text(
                               DateFormat.yMMMMd('en_US').format(controller.dateTime),
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  color: HexColor('#F0E8F3'),
                                ),
                              ),
                            );
                          }),
                      Icon(
                        Icons.calendar_today_rounded,
                        color: HexColor('#F0E8F3'),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder(
                  init: controller,
                  builder: (context) {
                    return TextFormField(
                      controller: controller.descC,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: GoogleFonts.roboto(
                          textStyle: const TextStyle(fontSize: 15)),
                      cursorColor: HexColor('#FD9300'),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 30),
                        hintText: 'Deskripsi',
                        filled: true,
                        fillColor: HexColor('#F0E8F3'),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(10, 10))),
                      ),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(HexColor('#FD9300')),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide.none))),
                  onPressed: () {
                    controller.setAgenda();
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Simpan',
                      style: GoogleFonts.roboto(
                          color: HexColor('#F0E8F3'),
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
