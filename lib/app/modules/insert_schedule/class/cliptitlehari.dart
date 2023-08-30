import 'package:flutter/material.dart';

class ClipTitleHari extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width * 0.3, size.height);
    // path.quadraticBezierTo(
    //     size.width / 2, size.height / 2, size.width, size.height);
    path.lineTo(size.width * 0.7, size.height);
    path.lineTo(size.width, 0);
    path.close();
    print(size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => false;
}
