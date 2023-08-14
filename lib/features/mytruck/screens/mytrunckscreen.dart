import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class MyTrunckScreen extends StatelessWidget {
  const MyTrunckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "MyTrunckScreen",
          style: TextStyle(color: AppColors.black),
        ),
      ),
    );
  }
}
