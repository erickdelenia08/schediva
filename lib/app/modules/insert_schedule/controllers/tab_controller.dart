import 'package:app_jadwal/app/modules/insert_schedule/controllers/insert_schedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTabController extends GetxController with GetSingleTickerProviderStateMixin{

  late TabController tabController;
  final List<Tab> myTabs = [
    Tab(
      child: Text(
        'Sen',
        style: GoogleFonts.roboto(
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ),
    Tab(
      child: Text(
        'Sel',
        style: GoogleFonts.roboto(
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ),
    Tab(
      child: Text(
        'Rab',
        style: GoogleFonts.roboto(
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ),
    Tab(
      child: Text(
        'Kam',
        style: GoogleFonts.roboto(
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ),
    Tab(
      child: Text(
        'Jum',
        style: GoogleFonts.roboto(
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ),
    Tab(
      child: Text(
        'Sab',
        style: GoogleFonts.roboto(
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ),
    Tab(
      child: Text(
        'Min',
        style: GoogleFonts.roboto(
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ),
  ];

  @override
  void onInit() {
    tabController = TabController(length: myTabs.length, vsync: this);
    tabController.addListener(() {
      Get.find<InsertScheduleController>().updateIndexTabbar(id: tabController.index);
        // debugPrint('idx tab ${tabController.index}');
    });
    super.onInit();
  }
  
}