import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashscreenView extends StatelessWidget {
  const SplashscreenView({Key? key}) : super(key: key);
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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: HexColor('#0B1D26'),
          body: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: Get.width * 0.5,
                height: Get.height,
                child: Image.asset('assets/logo/schediva_logo.png'),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'v23.08.06',
                      style: GoogleFonts.roboto(
                          textStyle: TextStyle(color: Colors.white,fontSize: 10)),
                    ),
                  ))
            ],
          ),
        ));
  }
}
