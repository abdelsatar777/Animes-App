import 'package:flutter/material.dart';

class SlantedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double slantHeight = 70.0; // ارتفاع الميلان

    path.moveTo(0, slantHeight);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - slantHeight);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
