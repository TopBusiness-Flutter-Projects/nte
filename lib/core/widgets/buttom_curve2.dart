import 'package:flutter/material.dart';

class BottomCurveClipperTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    var h = size.height;
    var w = size.width;
    path.lineTo(w/3, 0); //points 1,2
  //  path.quadraticBezierTo(w * 0.5, h * 0.6, w * 0.5, h*0.5);
    path.quadraticBezierTo(w * 0.4, h * 0.4, w * 0.6, h*0.4);
    path.quadraticBezierTo(w*0.8 , h * 0.4, w *0.8, 0);

  //  path.lineTo(w, 0);


    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}