import 'package:app_jadwal/app/modules/group/views/agenda_view.dart';
import 'package:app_jadwal/app/modules/group/views/broadcast_group.dart';
import 'package:app_jadwal/app/modules/group/views/group_setting_view.dart';
import 'package:app_jadwal/app/modules/group/views/participants_view.dart';
import 'package:app_jadwal/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/group_controller.dart';

class GroupView extends GetView<GroupController> {
  const GroupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#0B1D26'),
      appBar: AppBar(
        automaticallyImplyLeading: controller.statusAdmin,
        backgroundColor: HexColor('#0B1D26'),
        title: GetBuilder(
            id: 'drawer_tabs',
            init: controller,
            builder: (context) {
              return Text(getPagesName(controller.idxDraweTabs));
            }),
        centerTitle: true,
        actions: [
          GetBuilder(
              id: 'drawer_tabs',
              init: controller,
              builder: (context) {
                return Visibility(
                  visible: [0, 1].contains(controller.idxDraweTabs) &&
                          controller.statusAdmin
                      ? true
                      : false,
                  child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.CREATE_AGENDA);
                      },
                      icon: const Icon(Icons.add)),
                );
              })
        ],
      ),
      body: Center(
        child: GetBuilder(
            id: 'drawer_tabs',
            init: controller,
            builder: (context) {
              return IndexedStack(
                index: controller.idxDraweTabs,
                children: const [
                  AgendaView(),
                  ParticipantsView(),
                  BroadcastGroupView(),
                  GroupSettingView()
                ],
              );
            }),
      ),
      drawer: Visibility(
        visible: controller.statusAdmin,
        child: Drawer(
          backgroundColor: HexColor('#F0E8F3'),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(color: HexColor('#283F4D')),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.groups,
                      size: 80,
                      color: Colors.white,
                    ),
                    Text(
                      controller.groupName,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              GetBuilder(
                  id: 'tabs0',
                  init: controller,
                  builder: (context) {
                    return ListTile(
                      selectedColor: HexColor('#FD9300'),
                      selected: controller.idxDraweTabs == 0 ? true : false,
                      leading: const Icon(Icons.event_note_rounded),
                      title: const Text('Agenda'),
                      onTap: () {
                        controller.setIdxDrawerTabs(0);
                        Get.back();
                      },
                    );
                  }),
              GetBuilder(
                  id: 'tabs1',
                  init: controller,
                  builder: (context) {
                    return ListTile(
                      selectedColor: HexColor('#FD9300'),
                      selected: controller.idxDraweTabs == 1 ? true : false,
                      leading: const Icon(Icons.person),
                      title: const Text('Partisipan'),
                      onTap: () {
                        controller.setIdxDrawerTabs(1);
                        Get.back();
                      },
                    );
                  }),
              GetBuilder(
                  id: 'tabs2',
                  init: controller,
                  builder: (context) {
                    return ListTile(
                      selectedColor: HexColor('#FD9300'),
                      selected: controller.idxDraweTabs == 2 ? true : false,
                      leading: const Icon(Icons.message),
                      title: const Text('Pesan Siaran'),
                      onTap: () {
                        controller.setIdxDrawerTabs(2);
                        Get.back();
                      },
                    );
                  }),
              GetBuilder(
                  id: 'tabs3',
                  init: controller,
                  builder: (context) {
                    return ListTile(
                      selectedColor: HexColor('#FD9300'),
                      selected: controller.idxDraweTabs == 3 ? true : false,
                      leading: const Icon(Icons.settings),
                      title: const Text('Pengaturan'),
                      onTap: () {
                        controller.setIdxDrawerTabs(3);
                        Get.back();
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }

  String getPagesName(int idx) {
    if (idx == 0) {
      return 'Agenda';
    } else if (idx == 1) {
      return 'Partisipan';
    } else if (idx == 2) {
      return 'Pesan Siaran';
    } else {
      return 'Setting';
    }
  }
}
