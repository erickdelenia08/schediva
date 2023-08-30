import 'package:app_jadwal/app/controllers/auth_controller.dart';
import 'package:app_jadwal/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:app_jadwal/app/modules/insert_schedule/class/days_name.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  var listEvent = [
    Eventku('jasik', 'acara musik'),
    Eventku('jancok', 'jamming jancok'),
    Eventku('disnat', 'rapat perdana')
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: HexColor('#0B1D26'),
        systemNavigationBarColor: Colors.black,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: SizedBox(
                    height: 25,
                    child: Image.asset('assets/logo/schediva_logo_v2.png')),
              ),
              Flexible(
                  flex: 1,
                  child: Icon(
                    Icons.notifications,
                    color: HexColor('#F0E8F3'),
                    size: 25,
                  ))
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        'Selamat datang, ${StringUtils.capitalize(Get.find<AuthController>().namaUser!.split(' ')[0])} !',
                        style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                                color: HexColor('#F0E8F3'), fontSize: 20)),
                      ),
                    ),
                    Text(
                      'Titik adalah akhir dari sebuah kalimat',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: HexColor('#F0E8F3'), fontSize: 16)),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      customBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      onTap: () {
                        Get.find<DashboardController>().changeTabIndex(3);
                      },
                      child: CircleAvatar(
                        radius: 28,
                        backgroundColor: HexColor('#FFC000'),
                        child: const CircleAvatar(
                          radius: 28,
                          backgroundImage:
                              AssetImage('assets/account_image.png'),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Pilih Kegiatan',
            style: GoogleFonts.roboto(
                textStyle: TextStyle(color: HexColor('#F0E8F3'), fontSize: 20)),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, idx) {
                return Row(
                  children: [
                    GetBuilder(
                        init: controller,
                        id: 'tab$idx',
                        builder: (context) {
                          var idxCTabs = controller.idx_event;

                          if (idx == 0) {
                            return Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: idxCTabs == idx
                                  ? HexColor('#FFC000')
                                  : HexColor('#29404E'),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  int prevIdx = controller.idx_event;
                                  controller.updateIdxEvent(
                                      idx: idx,
                                      id: 'tab$idx',
                                      prevId: 'tab$prevIdx');

                                  // debugPrint('HAHA ${controller.idx_event}');
                                },
                                child: SizedBox(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      child: Text(
                                        'Semua',
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: HexColor('#F0E8F3'),
                                                fontSize: 16)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Material(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: idxCTabs == idx
                                  ? HexColor('#FFC000')
                                  : HexColor('#29404E'),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10),
                                onTap: () {
                                  int prevIdx = controller.idx_event;
                                  controller.updateIdxEvent(
                                      idx: idx,
                                      id: 'tab$idx',
                                      prevId: 'tab$prevIdx');

                                  // debugPrint('HAHA ${controller.idx_event}');
                                },
                                child: SizedBox(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                        NamaKegiatan.days[idx - 1],
                                        style: GoogleFonts.roboto(
                                            textStyle: TextStyle(
                                                color: HexColor('#F0E8F3'),
                                                fontSize: 16)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }
                        }),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                );
              },
              itemCount: NamaKegiatan.days.length + 1,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Time Line',
                style: GoogleFonts.roboto(
                    textStyle:
                        TextStyle(color: HexColor('#F0E8F3'), fontSize: 20)),
              ),
              PopupMenuButton(
                position: PopupMenuPosition.under,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                icon: const Icon(
                  Icons.sort,
                  color: Colors.white,
                ),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.all_inclusive_rounded,
                            color: HexColor('#0B1D26'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("Semua"),
                        ],
                      ),
                    ),
                    PopupMenuItem<int>(
                      padding: const EdgeInsets.only(left: 12),
                      value: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.today,
                            color: HexColor('#0B1D26'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("Hari ini"),
                        ],
                      ),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 0) {
                    print("My account menu is selected.");
                  } else if (value == 1) {
                    print("Settings menu is selected.");
                  }
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: List<int>.generate(100, (counter) => counter)
                .map<Container>((e) {
              return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  // height: Get.height / 6,
                  width: Get.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: HexColor('#283F4D'),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Kegiatan $e',
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: HexColor('#F0E8F3'),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.attachment,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Briefing #$e',
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: HexColor('#F0E8F3'),
                                                  fontSize: 15)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.calendar_month_sharp,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '18 Agustus 2023',
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: HexColor('#F0E8F3'),
                                                  fontSize: 15)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.alarm,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          '15.00-18.00',
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: HexColor('#F0E8F3'),
                                                  fontSize: 15)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: Colors.white,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'Gereja',
                                          style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                  color: HexColor('#F0E8F3'),
                                                  fontSize: 15)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )),
                      // Expanded(
                      //     child: Container(
                      //       height: 30,
                      //   // color: Colors.green,
                      //   decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/erick_delenia.jpg'))),
                      // ))
                    ],
                  ));
            }).toList(),
          )
        ],
      ),
    );
  }
}

class Eventku {
  String acara;
  String deskripsi;
  Eventku(this.acara, this.deskripsi);
}
