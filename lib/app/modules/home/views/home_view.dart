import 'package:app_jadwal/app/controllers/auth_controller.dart';
import 'package:app_jadwal/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:app_jadwal/app/modules/home/class/mydate_time.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
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
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
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
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
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
                      'udah makan belum?',
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
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'Grup',
            style: GoogleFonts.roboto(
                textStyle: TextStyle(color: HexColor('#F0E8F3'), fontSize: 20)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('group')
                  .where('id_member',
                      arrayContains: Get.find<AuthController>().idUser)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator(),);
                }
                if (snapshot.data!.docs.isNotEmpty) {
                  controller.setIdGroups(snapshot.data!.docs);
                  return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, idx) {
                      var data = snapshot.data!.docs[idx].data()
                          as Map<String, dynamic>;
                      return Row(
                        children: [
                          GetBuilder(
                              init: controller,
                              id: 'tab$idx',
                              builder: (context) {
                                var idxCTabs = controller.idx_event;
                                if (idx == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Material(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
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
                                        },
                                        child: SizedBox(
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10),
                                              child: Text(
                                                data['nama'],
                                                style: GoogleFonts.roboto(
                                                    textStyle: TextStyle(
                                                        color:
                                                            HexColor('#F0E8F3'),
                                                        fontSize: 16)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  return Material(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                              data['nama'],
                                              style: GoogleFonts.roboto(
                                                  textStyle: TextStyle(
                                                      color:
                                                          HexColor('#F0E8F3'),
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
                  );
                } else {
                  return const Text('Belum ada grup');
                }
              }),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              G2xSimpleWeekCalendar(
                DateTime.now(),
                dateCallback: (val) {
                  
                },
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            'Time Line',
            style: GoogleFonts.roboto(
                textStyle: TextStyle(color: HexColor('#F0E8F3'), fontSize: 20)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: GetBuilder(
            id: 'timeline',
            init: controller,
            builder: (context) {
              return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('agenda')
                      .where('id_group', whereIn: controller.idGroups).where('start',isGreaterThanOrEqualTo: controller.timestampFilter).where('start',isLessThan: controller.getUpperLimitTime())
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return const Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    if (snapshot.data!.docs.isNotEmpty) {
                      return Column(
                        children: snapshot.data!.docs.map<Container>((e) {
                          return Container(
                              margin: const EdgeInsets.only(bottom: 13),
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              (e.data() as Map<String, dynamic>)[
                                                  'nama_group'],
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
                                                      (e.data() as Map<String,
                                                          dynamic>)['nama'],
                                                      style: GoogleFonts.roboto(
                                                          textStyle: TextStyle(
                                                              color: HexColor(
                                                                  '#F0E8F3'),
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
                                                      DateFormat.yMMMd().format(
                                                          ((e.data() as Map<String,
                                                                          dynamic>)[
                                                                      'start']
                                                                  as Timestamp)
                                                              .toDate()),
                                                      style: GoogleFonts.roboto(
                                                          textStyle: TextStyle(
                                                              color: HexColor(
                                                                  '#F0E8F3'),
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
                                                      '${DateFormat('HH:mm').format(
                                                        ((e.data() as Map<String,
                                                                    dynamic>)['start']
                                                                as Timestamp)
                                                            .toDate(),
                                                      )}-${DateFormat('HH:mm').format(
                                                        ((e.data() as Map<String,
                                                                    dynamic>)['end']
                                                                as Timestamp)
                                                            .toDate(),
                                                      )}',
                                                      style: GoogleFonts.roboto(
                                                          textStyle: TextStyle(
                                                              color: HexColor(
                                                                  '#F0E8F3'),
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
                                                      (e.data() as Map<String,
                                                          dynamic>)['lokasi'],
                                                      style: GoogleFonts.roboto(
                                                          textStyle: TextStyle(
                                                              color: HexColor(
                                                                  '#F0E8F3'),
                                                              fontSize: 15)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              ));
                        }).toList(),
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'Kosong',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                  });
            }
          ),
        )
      ],
    );
  }
}
