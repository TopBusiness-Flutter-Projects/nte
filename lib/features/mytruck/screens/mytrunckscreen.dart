import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:nte/core/widgets/custom_appbar.dart';

import '../../../core/utils/app_colors.dart';

class MyTrunckScreen extends StatelessWidget {
  const MyTrunckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Stack(
          children: [

            SizedBox(
              height: getSize(context) / 2,
              child: ClipPath(
                clipper: BottomCurveClipper(),
                child: Stack(
                  children: [
                    Container(
                      // width: double.infinity,
                      // height: double.infinity,
                      color: Colors.yellow,
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: getSize(context) / 2,
                child: ClipPath(
                  clipper: BottomCurveClipper(),
                  child: Stack(
                    children: [
                      Container(
                        // width: double.infinity,
                        // height: double.infinity,
                        color: Colors.yellow,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
