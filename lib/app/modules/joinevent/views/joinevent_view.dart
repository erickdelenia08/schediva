import 'package:app_jadwal/app/controllers/auth_controller.dart';
import 'package:app_jadwal/app/modules/group/controllers/group_controller.dart';
import 'package:app_jadwal/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../controllers/bottomsheet_joinevent_contoller.dart';
import '../controllers/joinevent_controller.dart';
import 'bottom_sheet_event.dart';

class JoineventView extends GetView<JoineventController> {
  const JoineventView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    return Scaffold(
        backgroundColor: HexColor('#0B1D26'),
        appBar: AppBar(
          backgroundColor: HexColor('#0B1D26'),
          title: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Grup',
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                    fontSize: 25.76, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          centerTitle: true,
          actions: [
            GetBuilder(
                id: 'otoritas_admin',
                init: Get.find<AuthController>(),
                builder: (_) {
                  return Visibility(
                    visible:
                        ['1', '2'].contains(authC.idUserLevel) ? true : false,
                    child: IconButton(
                      onPressed: () {
                        Get.delete<BSJoinEventC>();
                        Get.put<BSJoinEventC>(
                          BSJoinEventC(
                            createStatus: true,
                          ),
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
                            return const BottomSheetEventView();
                          },
                        );
                      },
                      icon: const Icon(Icons.add),
                    ),
                  );
                }),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: PopupMenuButton(
                position: PopupMenuPosition.under,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                icon: const Icon(Icons.sort),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem<int>(
                      value: 0,
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.all_inclusive,
                            color: HexColor('#0B1D26'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("semua"),
                        ],
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 1,
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.accessible_forward_sharp,
                            color: HexColor('#0B1D26'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("pemilik"),
                        ],
                      ),
                    ),
                    PopupMenuItem<int>(
                      padding: const EdgeInsets.only(left: 12),
                      value: 2,
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock,
                            color: HexColor('#0B1D26'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("terkunci"),
                        ],
                      ),
                    ),
                    PopupMenuItem<int>(
                      value: 3,
                      padding: const EdgeInsets.only(left: 12),
                      child: Row(
                        children: [
                          Icon(
                            Icons.lock_open_sharp,
                            color: HexColor('#0B1D26'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text("terbuka"),
                        ],
                      ),
                    ),
                  ];
                },
                onSelected: (value) {
                  if (value == 0) {
                    Get.find<JoineventController>().idxFilter = value;
                    Get.find<JoineventController>().setFilterGroup();
                  } else if (value == 1) {
                    Get.find<JoineventController>().idxFilter = value;
                    Get.find<JoineventController>()
                        .setFilterGroup(idUser: authC.idUser);
                  } else if (value == 3) {
                    Get.find<JoineventController>().idxFilter = value;
                    Get.find<JoineventController>()
                        .setFilterGroup(idUser: authC.idUser);
                  }
                },
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: GetBuilder(
            id: 'card',
            init: controller,
            builder: (context) {
              return StreamBuilder<QuerySnapshot>(
                stream: controller.usersStream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.data!.docs.isNotEmpty) {
                    return ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, idx) {
                        var data = snapshot.data!.docs[idx].data()
                            as Map<String, dynamic>;
                        return Column(
                          children: [
                            Material(
                              color: HexColor('#283F4D'),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: InkWell(
                                customBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                onTap: () {
                                  if (data['id_owner'] == authC.idUser ||
                                      (data['id_member'] as List<dynamic>)
                                          .contains(authC.idUser)) {
                                    Get.delete<GroupController>(force: true);
                                    Get.put(GroupController(
                                        idGroup: data['id_group'],
                                        groupName: data['nama'],
                                        statusAdmin:
                                            data['id_owner'] == authC.idUser,idMember: data['id_member']));
                                    Get.toNamed(Routes.GROUP);
                                  } else {
                                    Get.delete<BSJoinEventC>();
                                    Get.put<BSJoinEventC>(
                                      BSJoinEventC(
                                          createStatus: false,
                                          idxItem: idx,
                                          token: data['token'],
                                          idMember: data['id_member'],
                                          idGroup: data['id_group']),
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
                                        return const BottomSheetEventView();
                                      },
                                    );
                                  }
                                },
                                child: SizedBox(
                                  height: 100,
                                  width: Get.width,
                                  child: Stack(
                                    children: [
                                      Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              data['nama'],
                                              style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: HexColor('#F0E8F3'),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              '#${data['tagar']}',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
                                                color: HexColor('#F0E8F3'),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Visibility(
                                        visible:
                                            (data['id_owner'] == authC.idUser ||
                                                    (data['id_member']
                                                            as List<dynamic>)
                                                        .contains(authC.idUser))
                                                ? false
                                                : true,
                                        child: Align(
                                          alignment: Alignment.bottomRight,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.lock,
                                              color: HexColor('#F0E8F3'),
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Text('Tidak ada data'),
                    );
                  }
                },
              );
            },
          ),
        ));
  }
}
