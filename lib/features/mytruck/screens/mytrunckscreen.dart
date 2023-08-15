import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:nte/core/widgets/buttom_curve2.dart';
import 'package:nte/core/widgets/custom_appbar.dart';

import '../../../core/utils/app_colors.dart';

class MyTrunckScreen extends StatelessWidget {
  const MyTrunckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     //   backgroundColor: Colors.deepPurple,
        body: Stack(
          children: [
            Positioned(
              right: 0,
              top: -100,
              child: Container(
                   width: 200,
                   height: 188,
                   child: Stack(
                     children: [
                       Positioned(
                         left: 0,
                         top: 0,
                         child: Container(
                           width: 200,
                           height: 188,
                           decoration: ShapeDecoration(
                             color: Color(0x19E8B100),
                             shape: OvalBorder(),
                           ),
                         ),
                       ),
                       Positioned(
                         left: 40,
                         top: 34,
                         child: Container(
                           width: 120,
                           height: 120,
                           decoration: ShapeDecoration(
                             color: Color(0x33E8B100),
                             shape: OvalBorder(),
                           ),
                         ),
                       ),
                       Positioned(
                         left: 88,
                         top: 65,
                         child: Container(
                           width: 70,
                           height: 70,
                           decoration: ShapeDecoration(
                             color: Color(0xFFE8B100),
                             shape: OvalBorder(),
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
            ),
          ],
        ));
  }
}
