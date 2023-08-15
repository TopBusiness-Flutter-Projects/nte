import 'dart:math';

import 'package:flutter/material.dart';

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var h = size.height;
    var w = size.width;
    path.lineTo(0, h*0.6); //points 1,2

    path.quadraticBezierTo(w * 0.3, h * 0.6, w * 0.3, 0);

    path.lineTo(w, 0);


    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}



