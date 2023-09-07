import 'package:app_jadwal/app/controllers/auth_controller.dart';
import 'package:app_jadwal/app/modules/insert_schedule/controllers/insert_schedule_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../controllers/item_schedule_controller.dart';
import 'bottom_sheet_view.dart';

class TabBarItemVIew extends StatelessWidget {
  const TabBarItemVIew({super.key});
  @override
  Widget build(BuildContext context) {
    var b = Get.find<InsertScheduleController>();
    return GetBuilder<InsertScheduleController>(
        id: b.idxTabController,
        init: Get.find<InsertScheduleController>(),
        builder: (controller) {
          return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('jadwal')
                  .doc(Get.find<AuthController>().idUser)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.data!.data() != null) {
                  return ListView.separated(
                    itemCount: snapshot.data!
                        .data()![controller.getDayName(b.idxTabController)]
                        .length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, idx) {
                      var data = snapshot.data!.data()![
                          controller.getDayName(b.idxTabController)][idx] as Map<String,dynamic>;
                      return Stack(
                        alignment: AlignmentDirectional.bottomStart,
                        children: [
                          Material(
                            color: HexColor('#283F4D'),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: InkWell(
                              customBorder: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              onTap: () {
                                Get.delete<ItemScheduleController>(force: true);
                                Get.put<ItemScheduleController>(
                                    ItemScheduleController(
                                        idxDay: b.idxTabController,
                                        createStatus: false,
                                        idxItem: idx));
                                Get.find<ItemScheduleController>()
                                    .prepareUpdateData();
                                showModalBottomSheet(
                                    enableDrag: true,
                                    useSafeArea: true,
                                    backgroundColor: HexColor('#283F4D'),
                                    showDragHandle: true,
                                    context: context,
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(40),
                                      ),
                                    ),
                                    builder: (context) {
                                      return const BottomSheetView();
                                    }).whenComplete(() {
                                  // Get.delete<ItemScheduleController>(force: true);
                                });
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 30 + (Get.width / 4),
                                    right: 10,
                                    top: 30,
                                    bottom: 30),
                                child: SizedBox(
                                  width: Get.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data['title'],
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: HexColor('#F0E8F3'),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        data['deskripsi'],
                                        style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: HexColor('#F0E8F3'),
                                          ),
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, bottom: 20, top: 20),
                            child: Container(
                              width: Get.width / 4,
                              height: 100,
                              decoration: BoxDecoration(
                                  color: HexColor('#F0E8F3'),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['jam'].toString(),
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: HexColor('#0B1D26'))),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '- ${data['jam'].toString()}',
                                      style: GoogleFonts.roboto(
                                          textStyle: TextStyle(
                                              fontSize: 28,
                                              fontWeight: FontWeight.bold,
                                              color: HexColor('#0B1D26'))),
                                      textAlign: TextAlign.left,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, idx) {
                      return const SizedBox(
                        height: 0,
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: Text(
                      'kosong',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
              });
        });
  }
}
