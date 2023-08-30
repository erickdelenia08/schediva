import 'package:app_jadwal/app/controllers/auth_controller.dart';
import 'package:app_jadwal/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var authC = Get.find<AuthController>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#0B1D26'),
          title: Text(
            'Profil',
            style: GoogleFonts.roboto(
                textStyle: TextStyle(color: HexColor('#F0E8F3'), fontSize: 20)),
          ),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.edit))],
        ),
        backgroundColor: HexColor('#0B1D26'),
        body: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Hero(
                tag: 'fotoprofil',
                child: CircleAvatar(
                  radius: 38,
                  backgroundColor: HexColor('#FD9300'),
                  child: const CircleAvatar(
                    radius: 38,
                    backgroundImage: AssetImage('assets/account_image.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.white54,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                enabled: false,
                controller: TextEditingController(text: authC.namaUser),
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
              ),
            ),
            const Divider(
              color: Colors.white54,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                enabled: false,
                controller: TextEditingController(text: authC.email),
                style: const TextStyle(color: Colors.white, fontSize: 16),
                decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
              ),
            ),
            const Divider(
              color: Colors.white54,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: Text(
                statusUsers(authC.idUserLevel!),
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const Divider(
              color: Colors.white54,
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: SizedBox(
              width: Get.width * 0.7,
              height: 50,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(HexColor('#FD9300')),
                      shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)))),
                  onPressed: () {
                    Get.dialog(
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Material(
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 10),
                                      const Text(
                                        "Keluar Dari Akun Anda",
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(height: 20),
                                      //Buttons
                                      Row(
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize: const Size(0, 45),
                                                backgroundColor:
                                                    HexColor('#FD9300'),
                                                foregroundColor:
                                                    const Color(0xFFFFFFFF),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text(
                                                'NO',
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize: const Size(0, 45),
                                                backgroundColor:
                                                    HexColor('#FD9300'),
                                                foregroundColor:
                                                    const Color(0xFFFFFFFF),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                              ),
                                              onPressed: () {
                                                Get.find<AuthController>()
                                                    .logOut();
                                              },
                                              child: const Text(
                                                'Yes',
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text('Keluar')),
            )),
            const SizedBox(
              height: 20,
            ),
            GetBuilder(
                id: 'otoritas_admin',
                init: Get.find<AuthController>(),
                builder: (context) {
                  return Visibility(
                    visible: Get.find<AuthController>().idUserLevel == '1'
                        ? true
                        : false,
                    child: Center(
                        child: SizedBox(
                      width: Get.width * 0.7,
                      height: 50,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  HexColor('#283F4D')),
                              shape: MaterialStatePropertyAll<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(30)))),
                          onPressed: () {
                            Get.toNamed(Routes.MANAGEMENT_USER);
                          },
                          child: const Text('Master')),
                    )),
                  );
                })
          ],
        ));
  }
  String statusUsers(String kode){
    if(kode=='1'){
      return 'Master';
    }else if(kode=='2'){
      return 'Admin';
    }else{
      return 'Anggota';
    }
  }
}
