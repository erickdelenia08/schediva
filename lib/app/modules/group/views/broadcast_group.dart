import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class BroadcastGroupView extends StatelessWidget {
  const BroadcastGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#0B1D26'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(fontSize: 15)),
                cursorColor: HexColor('#FD9300'),
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  hintText: 'Pesan',
                  filled: true,
                  fillColor: HexColor('#F0E8F3'),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(30, 30))),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.send,
                color: HexColor('#FD9300'),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ),
    );
  }
}
