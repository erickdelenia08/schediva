import 'package:app_jadwal/app/controllers/auth_controller.dart';
import 'package:app_jadwal/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../controllers/bottomsheet_joinevent_contoller.dart';

class BottomSheetEventView extends StatelessWidget {
  const BottomSheetEventView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var ctrl = Get.find<BSJoinEventC>();
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SizedBox(
            height: 50,
          ),
          Visibility(
            visible: ctrl.createStatus ? true : false,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: Get.width / 14, left: Get.width / 14, bottom: 15),
                  child: GetBuilder(
                      init: Get.find<BSJoinEventC>(),
                      builder: (context) {
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
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(30, 30))),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: Get.width / 14, left: Get.width / 14, bottom: 15),
                  child: GetBuilder(
                      init: ctrl,
                      builder: (context) {
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
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(30, 30))),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: Get.width / 14, left: Get.width / 14, bottom: 15),
                  child: GetBuilder(
                      init: ctrl,
                      builder: (context) {
                        return TextFormField(
                          controller: ctrl.txtTagarC,
                          maxLines: 1,
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 15)),
                          cursorColor: HexColor('#FD9300'),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            hintText: 'tagar',
                            filled: true,
                            fillColor: HexColor('#F0E8F3'),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(30, 30))),
                          ),
                        );
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      right: Get.width / 14, left: Get.width / 14, bottom: 15),
                  child: GetBuilder(
                      init: ctrl,
                      builder: (context) {
                        // var ctrl = Get.find<BSJoinEventC>();
                        return TextFormField(
                          controller: ctrl.txtTokenC,
                          maxLines: 1,
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 15)),
                          cursorColor: HexColor('#FD9300'),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            hintText: 'token',
                            filled: true,
                            fillColor: HexColor('#F0E8F3'),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(30, 30))),
                          ),
                        );
                      }),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: Get.width / 14),
                    width: Get.width,
                    height: 48,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              HexColor('#FD9300')),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      side: BorderSide.none))),
                      onPressed: () {
                        CollectionReference group =
                            FirebaseFirestore.instance.collection('group');
                        try {
                          group.add({
                            'id_owner': Get.find<AuthController>().idUser,
                            'nama': ctrl.txtTitleC.text,
                            'deskripsi': ctrl.txtDescC.text,
                            'tagar': ctrl.txtTagarC.text,
                            'token': ctrl.txtTokenC.text,
                            'id_member':<dynamic>[Get.find<AuthController>().idUser]
                          }).then((value) {
                            value.update({'id_group': value.id});
                            Get.snackbar('', '',
                                messageText:
                                    const Text('berhasil membuat grup'));
                          });
                          Get.back();
                        } catch (e) {
                          debugPrint(
                              '00000 ${Get.find<AuthController>().idUser}');
                          Get.snackbar('', '', messageText: Text(e.toString()));
                        }
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          titleButton(),
                          style: GoogleFonts.roboto(
                              color: HexColor('#F0E8F3'),
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Visibility(
            visible: ctrl.createStatus ? false : true,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: Get.width / 14, left: Get.width / 14, bottom: 15),
                  child: GetBuilder(
                      init: ctrl,
                      builder: (context) {
                        // var ctrl = Get.find<BSJoinEventC>();
                        return TextFormField(
                          controller: ctrl.txtTokenC,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 15)),
                          cursorColor: HexColor('#FD9300'),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            hintText: 'token',
                            filled: true,
                            fillColor: HexColor('#F0E8F3'),
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(30, 30))),
                          ),
                        );
                      }),
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: Get.width / 14),
                    width: Get.width,
                    height: 48,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              HexColor('#FD9300')),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(100),
                                      side: BorderSide.none))),
                      onPressed: () {
                        if (ctrl.cekToken()) {
                          List<dynamic> newMember = ctrl.idMember!;
                          newMember.add(Get.find<AuthController>().idUser);
                          CollectionReference users =
                              FirebaseFirestore.instance.collection('group');
                          users.doc(ctrl.idGroup).update(
                            {'id_member': newMember},
                          ).then(
                            (value) {
                              Get.toNamed(Routes.GROUP,
                                  arguments: ctrl.idxItem);
                              return Get.snackbar('', '',
                                  messageText: const Text("berhasil masuk"));
                            },
                          ).catchError(
                            (error) {
                              return Get.snackbar('', '',
                                  messageText:
                                      Text("Failed to update user: $error"));
                            },
                          ).then((value) => Get.back());
                        }
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          titleButton(),
                          style: GoogleFonts.roboto(
                              color: HexColor('#F0E8F3'),
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: Get.width / 7,
          ),
        ],
      ),
    );
  }

  String titleButton() {
    var ctrl = Get.find<BSJoinEventC>();
    if (ctrl.createStatus) {
      return 'Tambahkan';
    } else {
      return 'Masuk';
    }
  }
}
