import 'package:app_jadwal/app/data/list_jadwal.dart';
import 'package:app_jadwal/app/modules/insert_schedule/controllers/insert_schedule_controller.dart';
import 'package:app_jadwal/app/modules/insert_schedule/controllers/tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../class/days_name.dart';
import '../controllers/item_schedule_controller.dart';

class BottomSheetView extends StatelessWidget {
  const BottomSheetView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 11),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: GetBuilder(
                            init: Get.find<ItemScheduleController>(),
                            builder: (context) {
                              var ctrl = Get.find<ItemScheduleController>();
                              return TextFormField(
                                controller: ctrl.txtHour1C,
                                showCursor: false,
                                maxLength: 2,
                                keyboardType: TextInputType.datetime,
                                textAlign: TextAlign.end,
                                decoration: const InputDecoration(
                                  counterText: "",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                                onChanged: (value) {
                                  if (value.length > 1) {
                                    if (int.parse(value) > 23) {
                                      ctrl.txtHour1C.text = '23';
                                    }
                                  } else if (value.length == 1) {
                                    Future.delayed(
                                        const Duration(milliseconds: 800), () {
                                          debugPrint('valueneee $value');
                                      if (ctrl.txtHour1C.text.length < 2) {
                                        ctrl.txtHour1C.text = '0$value';
                                      }
                                    });
                                  } else {
                                    ctrl.txtHour1C.text = '00';
                                  }
                                },
                                onTap: () {
                                  ctrl.txtHour1C.selection = TextSelection(
                                      baseOffset: 0,
                                      extentOffset:
                                          ctrl.txtHour1C.value.text.length);
                                },
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Get.width / 9,
                                    color: HexColor('#F0E8F3'),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Text(
                        '.',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: Get.width / 9,
                            color: HexColor('#F0E8F3'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GetBuilder(
                            init: Get.find<ItemScheduleController>(),
                            builder: (context) {
                              var ctrl = Get.find<ItemScheduleController>();
                              return TextFormField(
                                controller: ctrl.txtMinute1C,
                                maxLength: 2,
                                showCursor: false,
                                keyboardType: TextInputType.datetime,
                                textAlign: TextAlign.start,
                                decoration: const InputDecoration(
                                  counterText: "",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Get.width / 9,
                                    color: HexColor('#F0E8F3'),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.length > 1) {
                                    if (int.parse(value) > 59) {
                                      ctrl.txtMinute1C.text = '59';
                                    }
                                  } else if (value.length == 1) {
                                    Future.delayed(
                                        const Duration(milliseconds: 800), () {
                                          debugPrint('valueneee $value');
                                      if (ctrl.txtMinute1C.text.length < 2) {
                                        ctrl.txtMinute1C.text = '0$value';
                                      }
                                    });
                                  } else {
                                    ctrl.txtMinute1C.text = '00';
                                  }
                                },
                                onTap: () {
                                  ctrl.txtMinute1C.selection = TextSelection(
                                      baseOffset: 0,
                                      extentOffset:
                                          ctrl.txtMinute1C.value.text.length);
                                },
                              );
                            }),
                      )
                    ],
                  ),
                ),
                Text(
                  '-',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: Get.width / 9,
                      color: HexColor('#F0E8F3'),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: GetBuilder(
                            init: Get.find<ItemScheduleController>(),
                            builder: (context) {
                              var ctrl = Get.find<ItemScheduleController>();
                              return TextFormField(
                                controller: ctrl.txtHour2C,
                                maxLength: 2,
                                showCursor: false,
                                keyboardType: TextInputType.datetime,
                                textAlign: TextAlign.end,
                                decoration: const InputDecoration(
                                  counterText: "",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Get.width / 9,
                                    color: HexColor('#F0E8F3'),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.length > 1) {
                                    if (int.parse(value) > 23) {
                                      ctrl.txtHour2C.text = '23';
                                    }
                                  } else if (value.length == 1) {
                                    Future.delayed(
                                        const Duration(milliseconds: 800), () {
                                          debugPrint('valueneee $value');
                                      if (ctrl.txtHour2C.text.length < 2) {
                                        ctrl.txtHour2C.text = '0$value';
                                      }
                                    });
                                  } else {
                                    ctrl.txtHour2C.text = '00';
                                  }
                                },
                                onTap: () {
                                  ctrl.txtHour2C.selection = TextSelection(
                                      baseOffset: 0,
                                      extentOffset:
                                          ctrl.txtHour2C.value.text.length);
                                },
                              );
                            }),
                      ),
                      Text(
                        '.',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: Get.width / 8,
                            color: HexColor('#F0E8F3'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GetBuilder(
                            init: Get.find<ItemScheduleController>(),
                            builder: (context) {
                              var ctrl = Get.find<ItemScheduleController>();
                              return TextFormField(
                                controller: ctrl.txtMinute2C,
                                maxLength: 2,
                                showCursor: false,
                                keyboardType: TextInputType.datetime,
                                textAlign: TextAlign.start,
                                decoration: const InputDecoration(
                                  counterText: "",
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                ),
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Get.width / 9,
                                    color: HexColor('#F0E8F3'),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.length > 1) {
                                    if (int.parse(value) > 59) {
                                      ctrl.txtMinute2C.text = '59';
                                    }
                                  } else if (value.length == 1) {
                                    Future.delayed(
                                        const Duration(milliseconds: 800), () {
                                          debugPrint('valueneee $value');
                                      if (ctrl.txtMinute2C.text.length < 2) {
                                        ctrl.txtMinute2C.text = '0$value';
                                      }
                                    });
                                  } else {
                                    ctrl.txtMinute2C.text = '00';
                                  }
                                },
                                onTap: () {
                                  ctrl.txtMinute2C.selection = TextSelection(
                                      baseOffset: 0,
                                      extentOffset:
                                          ctrl.txtMinute2C.value.text.length);
                                },
                              );
                            }),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            width: Get.width,
            height: Get.width / 8,
            child: Center(
              child: GetBuilder(
                  init: Get.find<ItemScheduleController>(),
                  id: 'tabs',
                  builder: (context) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: DaysName.daysFullname.length,
                      itemBuilder: (context, idx) {
                        var ctrl = Get.find<ItemScheduleController>();
                        return Column(
                          children: [
                            Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              color: ctrl.idxDay == idx
                                  ? Colors.amber
                                  : Colors.transparent,
                              child: InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    DaysName.daysFullname[idx],
                                    style: GoogleFonts.roboto(
                                        textStyle: ctrl.idxDay == idx
                                            ? TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: HexColor('#283F4D'),
                                                fontSize: Get.width / 24)
                                            : TextStyle(
                                                fontWeight: FontWeight.normal,
                                                color: HexColor('#D8D9DB'),
                                                fontSize: Get.width / 26)),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                onTap: () {
                                  Get.find<ItemScheduleController>()
                                      .setIdxDay(idx: idx, tag: 'tabs');
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 14),
            child: GetBuilder(
                init: Get.find<ItemScheduleController>(),
                builder: (context) {
                  var ctrl = Get.find<ItemScheduleController>();
                  return TextFormField(
                    controller: ctrl.txtTitleC,
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
                              BorderRadius.all(Radius.elliptical(30, 30))),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 14),
            child: GetBuilder(
                init: Get.find<ItemScheduleController>(),
                builder: (context) {
                  var ctrl = Get.find<ItemScheduleController>();
                  return TextFormField(
                    controller: ctrl.txtDescC,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: GoogleFonts.roboto(
                        textStyle: const TextStyle(fontSize: 15)),
                    cursorColor: HexColor('#FD9300'),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      hintText: 'Deskripsi',
                      filled: true,
                      fillColor: HexColor('#F0E8F3'),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(30, 30))),
                    ),
                  );
                }),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: Get.width / 14),
              width: Get.width,
              height: 48,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(HexColor('#FD9300')),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide.none))),
                onPressed: () {
                  var mainCtrl = Get.find<InsertScheduleController>();
                  var tabCtrl = Get.find<MyTabController>();
                  var ctrl = Get.find<ItemScheduleController>();
                  var waktu = Waktu(
                      batasBawah:
                          '${ctrl.txtHour1C.text}.${ctrl.txtMinute1C.text}',
                      batasAtas:
                          '${ctrl.txtHour2C.text}.${ctrl.txtMinute2C.text}',
                      title: ctrl.txtTitleC.text,
                      deskripsi: ctrl.txtDescC.text);

                  if (Get.find<ItemScheduleController>().createStatus) {
                    mainCtrl.tambahJadwal(
                        tag: ctrl.idxDay, idDay: ctrl.idxDay, waktu: waktu);
                  } else {
                    if (ctrl.idxDay == tabCtrl.tabController.index) {
                      mainCtrl.ubahJadwal(
                          tag: ctrl.idxDay,
                          idDay: ctrl.idxDay,
                          idxItem: ctrl.idxItem!,
                          waktu: waktu);
                    } else {
                      mainCtrl.pindahJadwal(
                          tag: ctrl.idxDay,
                          initDay: tabCtrl.tabController.index,
                          idxItem: ctrl.idxItem!,
                          finalDay: ctrl.idxDay,
                          waktu: waktu);
                    }
                  }
                  tabCtrl.tabController.animateTo(ctrl.idxDay);
                  Get.back();
                },
                child: Align(
                  alignment: Alignment.center,
                  child: GetBuilder(
                      id: 'tabs',
                      init: Get.find<ItemScheduleController>(),
                      builder: (context) {
                        return Text(
                          titleButton(),
                          style: GoogleFonts.roboto(
                              color: HexColor('#F0E8F3'),
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        );
                      }),
                ),
              )),
          Get.find<ItemScheduleController>().createStatus == true
              ? const SizedBox()
              : const SizedBox(
                  height: 15,
                ),
          Visibility(
            visible: !Get.find<ItemScheduleController>().createStatus,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: Get.width / 14),
                width: Get.width,
                height: 48,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(HexColor('#F0E8F3')),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                              side: BorderSide.none))),
                  onPressed: () {
                    var mainCtrl = Get.find<InsertScheduleController>();
                    var tabCtrl = Get.find<MyTabController>();
                    mainCtrl.hapusJadwal(
                        id: tabCtrl.tabController.index,
                        idxItem: Get.find<ItemScheduleController>().idxItem!,
                        idDay: tabCtrl.tabController.index);
                    Get.back();
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: GetBuilder(
                        id: 'tabs',
                        init: Get.find<ItemScheduleController>(),
                        builder: (context) {
                          return Text(
                            'Hapus',
                            style: GoogleFonts.roboto(
                                color: HexColor('#FD9300'),
                                textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          );
                        }),
                  ),
                )),
          ),
          SizedBox(
            height: Get.width / 7,
          ),
        ],
      ),
    );
  }

  String titleButton() {
    var mainCtrl = Get.find<InsertScheduleController>();
    var ctrl = Get.find<ItemScheduleController>();
    if (ctrl.createStatus) {
      return 'Tambahkan';
    } else {
      if (ctrl.idxDay == mainCtrl.idxTabController) {
        return 'Simpan';
      } else {
        return 'Pindah dan Simpan';
      }
    }
  }
}
