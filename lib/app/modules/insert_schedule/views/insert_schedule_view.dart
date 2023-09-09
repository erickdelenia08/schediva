import 'package:app_jadwal/app/modules/insert_schedule/controllers/insert_schedule_controller.dart';
import 'package:app_jadwal/app/modules/insert_schedule/views/tabbar_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

// import '../controllers/insert_schedule_controller.dart';
import '../controllers/item_schedule_controller.dart';
import '../controllers/tab_controller.dart';
import 'bottom_sheet_view.dart';

class InsertScheduleView extends GetView<MyTabController> {
  const InsertScheduleView({Key? key}) : super(key: key);

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
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        backgroundColor: HexColor('#0B1D26'),
        appBar: AppBar(
          backgroundColor: HexColor('#0B1D26'),
          centerTitle: true,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Kuliah',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Column(
                children: [
                  TabBar(
                      splashBorderRadius: BorderRadius.circular(10),
                      controller: controller.tabController,
                      isScrollable: true,
                      unselectedLabelColor: Colors.white.withOpacity(0.3),
                      labelColor: Colors.black,
                      indicator: BoxDecoration(
                          color: HexColor('#FCCD00'),
                          borderRadius: BorderRadius.circular(10)),
                      tabs: controller.myTabs),
                  const SizedBox(
                    height: 15,
                  )
                ],
              )),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    Get.delete<ItemScheduleController>(force: true);
                    Get.put<ItemScheduleController>(
                      ItemScheduleController(
                          createStatus: true,
                          idxDay: controller.tabController.index),
                    );
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
                  }),
            ),
          ],
        ),
        body: FutureBuilder(
          future: Get.find<InsertScheduleController>().fetchJadwal(),
          builder: (ctx, snpsht) {
            if (snpsht.connectionState == ConnectionState.done) {
              var ctrl = Get.find<InsertScheduleController>();
              if (ctrl.jadwal != null) {
                return TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: controller.tabController,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TabBarItemVIew(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TabBarItemVIew(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TabBarItemVIew(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TabBarItemVIew(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TabBarItemVIew(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TabBarItemVIew(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: TabBarItemVIew(),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text(
                    'kosong',
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
