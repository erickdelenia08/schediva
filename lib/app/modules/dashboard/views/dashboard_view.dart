import 'package:app_jadwal/app/modules/home/views/home_view.dart';
import 'package:app_jadwal/app/modules/insert_schedule/views/insert_schedule_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../routes/app_pages.dart';
import '../../joinevent/views/joinevent_view.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../setting/views/setting_view.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return bodyWidget();
  }

  Future<bool> isSetPreference() async {
    var sharedP = await SharedPreferences.getInstance();
    if (!sharedP.containsKey('myData')) {
      Get.offNamed(Routes.LOGIN);
      return false;
    }
    return true;
  }

  Widget bodyWidget() {
    return GetBuilder<DashboardController>(builder: (controller) {
      return Scaffold(
        backgroundColor: HexColor('#0B1D26'),
        body: SafeArea(
            child: IndexedStack(
          index: controller.tabIndex,
          children: [
            HomeView(),
            const JoineventView(),
            const InsertScheduleView(),
            const SettingView(),
          ],
        )),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: HexColor('#152F3E'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.group),
              label: 'Event',
              backgroundColor: HexColor('#152F3E'),
            ),
            BottomNavigationBarItem(
              icon: const ImageIcon(AssetImage('assets/icon/icon_wisuda.png')),
              label: 'My schedule ',
              backgroundColor: HexColor('#152F3E'),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: HexColor('#152F3E'),
            ),
          ],
          currentIndex: controller.tabIndex,
          backgroundColor: Colors.white,
          selectedItemColor: HexColor('#FD9300'),
          unselectedItemColor: HexColor('#F0E8F3'),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          onTap: controller.changeTabIndex,
        ),
      );
    });
  }
}
