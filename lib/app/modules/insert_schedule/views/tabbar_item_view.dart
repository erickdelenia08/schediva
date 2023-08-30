import 'package:app_jadwal/app/modules/insert_schedule/controllers/insert_schedule_controller.dart';
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
          // debugPrint('IKI DEBUGG CEK UPDATE ${b.idxTabController}');
          return ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, idx) {
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
                          ItemScheduleController(idxDay: b.idxTabController, createStatus: false, idxItem: idx)
                        );
                        Get.find<ItemScheduleController>().prepareUpdateData();
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller
                                    .jadwal[b.idxTabController][idx].title,
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: HexColor('#F0E8F3'),
                                  ),
                                ),
                              ),
                              Text(
                                controller.jadwal[b.idxTabController][idx]
                                    .deskripsi,
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
                    padding:
                        const EdgeInsets.only(left: 20, bottom: 20, top: 20),
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
                              controller
                                  .jadwal[b.idxTabController][idx].batasBawah,
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: HexColor('#0B1D26'))),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '- ${controller.jadwal[b.idxTabController][idx].batasAtas}',
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
            itemCount: controller.jadwal[b.idxTabController].length,
          );
        });
  }
}
