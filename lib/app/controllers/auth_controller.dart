import 'package:app_jadwal/app/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  late CollectionReference users;
  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  String? idUserLevel;
  String? idUser;
  String? namaUser;
  String? email;
  bool isVerfied = false;

  void login(String email, String password) async {
    try {
      final myUser = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (myUser.user!.emailVerified) {
        if (!isVerfied) {
          users.doc(myUser.user!.uid).update(
            {'verified': myUser.user!.emailVerified},
          );
        }
        idUser = myUser.user!.uid;
        idUserLevel = myUser.user!.uid;
        namaUser = myUser.user!.displayName;
        observIdLevel();
        Get.offAllNamed(Routes.DASHBOARD);
      } else {
        Get.defaultDialog(
            title: 'Verifikasi Email',
            middleText:
                'email nelum diverifikasi! Kirim ulang email verifikasi?',
            onCancel: () {},
            onConfirm: () async {
              await myUser.user!.sendEmailVerification();
              Get.back();
            });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
            title: 'Status', middleText: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.defaultDialog(
            title: 'Status',
            middleText: 'Wrong password provided for that user.');
      }
    }
  }

  void signUp(String email, String password, String nama) async {
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await myUser.user!.sendEmailVerification();
      myUser.user!.updateDisplayName(nama);
      this.email = email;
      isVerfied = myUser.user!.emailVerified;
      users.doc(myUser.user!.uid).set(
        {
          'id': myUser.user!.uid,
          'level_id': "3",
          'nama': nama,
          'email': email,
          'verified': myUser.user!.emailVerified
        },
      );
      Get.defaultDialog(
        title: 'Status',
        buttonColor: HexColor('#FD9300'),
        confirmTextColor: Colors.white54,
        middleText: 'kami telah mengirimkan email verifikasi ke $email',
        onConfirm: () {
          Get.back();
          Get.back();
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
            title: 'Status', middleText: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        Get.defaultDialog(
            title: 'Status',
            middleText: 'The account already exists for that email.');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void logOut() async {
    await FirebaseAuth.instance.signOut();
    // await auth.currentUser!.delete();

    User? user = FirebaseAuth.instance.currentUser;
    user?.delete();
    Get.offAllNamed(Routes.LOGIN);
  }

  Future<void> deleteUserAccount() async {
    try {
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());

      if (e.code == "requires-recent-login") {
        await _reauthenticateAndDelete();
        Get.offAllNamed(Routes.LOGIN);
      } else {
        // Handle other Firebase exceptions
      }
    } catch (e) {
      debugPrint(e.toString());

      // Handle general exception
    }
  }

  Future<void> _reauthenticateAndDelete() async {
    try {
      final providerData = auth.currentUser?.providerData.first;

      if (AppleAuthProvider().providerId == providerData!.providerId) {
        await auth.currentUser!.reauthenticateWithProvider(AppleAuthProvider());
      } else if (GoogleAuthProvider().providerId == providerData.providerId) {
        await auth.currentUser!
            .reauthenticateWithProvider(GoogleAuthProvider());
      }

      await auth.currentUser?.delete();
    } catch (e) {
      // Handle exceptions
    }
  }

  @override
  void onInit() {
    debugPrint('ON INITT');
    users = FirebaseFirestore.instance.collection('users');
    super.onInit();
  }

  void observIdLevel() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(idUserLevel)
        .snapshots(includeMetadataChanges: true)
        .listen((event) {
      var data = event.data();
      debugPrint(
          'AHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA  ${data!}');
      if (idUserLevel != data['level_id']) {
        idUserLevel = data['level_id'];
        update(['otoritas_admin']);
      }
    });
  }
}
