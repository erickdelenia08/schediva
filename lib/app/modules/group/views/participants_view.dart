import 'package:app_jadwal/app/modules/group/controllers/group_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ParticipantsView extends StatelessWidget {
  const ParticipantsView({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .where('id', whereIn: Get.find<GroupController>().idMember)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text(
              'Terjadi kesalahan',
              style: TextStyle(color: Colors.white),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data!.docs.isNotEmpty) {
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                itemBuilder: (ctx, idx) {
                  var data = snapshot.data!.docs[idx].data();
                  return Dismissible(
                    direction: DismissDirection.endToStart,
                    key: const Key('idx'),
                    child: ListTile(
                      leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            color: HexColor('#FD9300'),
                          )),
                      title: Text(
                        data['nama'],
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(data['email'],
                          style: const TextStyle(color: Colors.white)),
                    ),
                  );
                });
          } else {
            return const Center(
              child: Text(
                'Data kosong',
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        });
  }
}
