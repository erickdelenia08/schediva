import 'package:app_jadwal/app/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class ManagementUserView extends StatelessWidget {
  const ManagementUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#0B1D26'),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: HexColor('#0B1D26'),
        title: const Text('Users Management'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Nama',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  'Aggota/Admin',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .where('id',
                          isNotEqualTo: Get.find<AuthController>().idUser)
                      .snapshots(),
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
                      return ListView.separated(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (ctx, idx) {
                          var data = snapshot.data!.docs[idx].data()
                              as Map<String, dynamic>;
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${data['nama']}',
                                style: const TextStyle(color: Colors.white54),
                              ),
                              Row(
                                children: [
                                  FlutterSwitch(
                                    height: 25.0,
                                    width: 45.0,
                                    padding: 4.0,
                                    toggleSize: 30.0,
                                    borderRadius: 30.0,
                                    activeColor: HexColor('#FD9300'),
                                    value: data['level_id'] == '2' ? true : false,
                                    onToggle: (value) {
                                      if (data['level_id'] == '2') {
                                        FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(data['id'])
                                            .update({'level_id': '3'});
                                      } else {
                                        FirebaseFirestore.instance
                                            .collection('users')
                                            .doc(data['id'])
                                            .update({'level_id': '2'});
                                      }
                                    },
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.remove_circle,
                                        color: Colors.white54,
                                      ))
                                ],
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: Colors.white54,
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text(
                          'Tidak ada data',
                          style: TextStyle(color: Colors.white54),
                        ),
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
