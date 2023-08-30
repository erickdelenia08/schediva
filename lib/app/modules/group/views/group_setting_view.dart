import 'package:app_jadwal/app/modules/group/controllers/group_settingC.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class GroupSettingView extends StatelessWidget {
  const GroupSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GroupSettingC());
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Nama Grup',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 10,
            ),
            GetBuilder(
              init: Get.find<GroupSettingC>(),
              builder: (context) {
                return TextFormField(
                  controller: Get.find<GroupSettingC>().txtTitleC,
                  maxLines: 1,
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(fontSize: 14)),
                  cursorColor: HexColor('#FD9300'),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    filled: true,
                    fillColor: HexColor('#F0E8F3'),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10, 10))),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Deskripsi Grup',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 10,
            ),
            GetBuilder(
              init: Get.find<GroupSettingC>(),
              builder: (context) {
                return TextFormField(
                  controller: Get.find<GroupSettingC>().txtDescC,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(fontSize: 15)),
                  cursorColor: HexColor('#FD9300'),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    filled: true,
                    fillColor: HexColor('#F0E8F3'),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10, 10))),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Tagar Grup',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 10,
            ),
            GetBuilder(
              init: Get.find<GroupSettingC>(),
              builder: (context) {
                return TextFormField(
                  controller: Get.find<GroupSettingC>().txtTagarC,
                  maxLines: 1,
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(fontSize: 15)),
                  cursorColor: HexColor('#FD9300'),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    filled: true,
                    fillColor: HexColor('#F0E8F3'),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10, 10))),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Token Grup',
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 10,
            ),
            GetBuilder(
              init: Get.find<GroupSettingC>(),
              builder: (context) {
                return TextFormField(
                  controller: Get.find<GroupSettingC>().txtTokenC,
                  maxLines: 1,
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(fontSize: 15)),
                  cursorColor: HexColor('#FD9300'),
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    filled: true,
                    fillColor: HexColor('#F0E8F3'),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius:
                            BorderRadius.all(Radius.elliptical(10, 10))),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              HexColor('#FD9300')),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide.none))),
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Simpan',
                          style: GoogleFonts.roboto(
                              color: HexColor('#F0E8F3'),
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                    ),
                  ),
                ),const SizedBox(width: 7,),
                 Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              HexColor('#FD9300')),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide.none))),
                      onPressed: () {},
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Hapus',
                          style: GoogleFonts.roboto(
                              color: HexColor('#F0E8F3'),
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
