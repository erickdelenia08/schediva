import 'package:app_jadwal/app/controllers/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#0B1D26'),
        body: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: Get.width * 0.5,
                    child: Image.asset('assets/logo/schediva_logo.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Isi data di bawah ini',
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            fontSize: 16, color: HexColor('#F0E8F3'))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                        child: Column(
                      children: [
                        TextFormField(
                          controller: controller.nama,
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 18)),
                          cursorColor: HexColor('#FD9300'),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            hintText: 'Nama',
                            filled: true,
                            fillColor: HexColor('#F0E8F3'),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: controller.emailC,
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 18)),
                          cursorColor: HexColor('#FD9300'),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            hintText: 'Email',
                            filled: true,
                            fillColor: HexColor('#F0E8F3'),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: controller.passwordC,
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 18)),
                          cursorColor: HexColor('#FD9300'),
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 20),
                            hintText: 'Kata Sandi',
                            filled: true,
                            fillColor: HexColor('#F0E8F3'),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(100),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            width: Get.width,
                            height: 48,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          HexColor('#FD9300')),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          side: BorderSide.none))),
                              onPressed: () {
                                Get.find<AuthController>().signUp(
                                    controller.emailC.text,
                                    controller.passwordC.text,
                                    controller.nama.text);
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'DAFTAR',
                                  style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18)),
                                ),
                              ),
                            ))
                      ],
                    )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RichText(
                      text: TextSpan(
                          text: 'Sudah punya akun ? ',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: HexColor('#F0E8F3'),
                            ),
                          ),
                          children: [
                        TextSpan(
                          mouseCursor: MaterialStateMouseCursor.textable,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
                            },
                          text: 'Masuk Sekarang',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 12,
                              color: HexColor('#F0E8F3'),
                            ),
                          ),
                        )
                      ]))
                ],
              ),
            ],
          ),
        ));
  }
}
