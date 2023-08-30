import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../routes/app_pages.dart';
import '../controllers/token_controller.dart';

class TokenView extends GetView<TokenController> {
  const TokenView({Key? key}) : super(key: key);
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
                    'Masukkan token',
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
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(fontSize: 18)),
                          cursorColor: HexColor('#FD9300'),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                            hintText: 'Token',
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
                                Get.offNamed(Routes.DASHBOARD);
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'MASUK',
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
                          text: 'token dikirimkan melalui ',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: HexColor('#F0E8F3'),
                            ),
                          ),
                          children: [
                        TextSpan(
                          mouseCursor: MaterialStateMouseCursor.textable,
                          text: 'email',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: HexColor('#FD9300'),
                            ),
                          ),
                        ),
                        TextSpan(
                          mouseCursor: MaterialStateMouseCursor.textable,
                          text: ' anda.',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              fontSize: 12,
                              color: HexColor('#F0E8F3'),
                            ),
                          ),
                        ),
                      ]))
                ],
              ),
            ],
          ),
        ));
  }
}
