import 'package:app_jadwal/app/controllers/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
// import 'app/modules/splashscreen/views/splashscreen_view.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    var authC = Get.find<AuthController>();
    return StreamBuilder<User?>(
        stream: authC.streamAuthStatus,
        builder: (ctx, snpsht) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Application",
            initialRoute: snpsht.data != null ? Routes.DASHBOARD : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        });
  }
}
