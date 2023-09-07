import 'package:app_jadwal/app/modules/group/controllers/group_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';

class AgendaView extends StatelessWidget {
  const AgendaView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('agenda')
            .where('id_group', isEqualTo: Get.find<GroupController>().idGroup)
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
              padding: const EdgeInsets.only(left: 20,right: 20,top: 10),
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (ctx, idx) {
                  var data = snapshot.data!.docs[idx];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: Material(
                      color: HexColor('#283F4D'),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Flexible(
                                  flex: 2,
                                  fit: FlexFit.tight,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.attachment,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '#${data['nama']}',
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color:
                                                              HexColor('#F0E8F3'),
                                                          fontSize: 15)),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.calendar_month_sharp,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  DateFormat.yMMMd().format((data['start'] as Timestamp).toDate()),
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color:
                                                              HexColor('#F0E8F3'),
                                                          fontSize: 15)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.alarm,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '${DateFormat('HH:mm').format((data['start'] as Timestamp).toDate())}-${DateFormat('HH:mm').format((data['end'] as Timestamp).toDate())}',
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color:
                                                              HexColor('#F0E8F3'),
                                                          fontSize: 15)), 
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.location_on,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  '${data['lokasi']}',
                                                  style: GoogleFonts.roboto(
                                                      textStyle: TextStyle(
                                                          color:
                                                              HexColor('#F0E8F3'),
                                                          fontSize: 15)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        )),
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
