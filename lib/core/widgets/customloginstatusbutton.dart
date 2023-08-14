import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/getsize.dart';

class CustomLoginStatusWidget extends StatelessWidget {
  CustomLoginStatusWidget(
      {required this.buttonName, this.onTap, this.isActive = false, super.key});
 final String buttonName;
  bool isActive;
  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: getSize(context) / 4,
        height: getSize(context) / 8,
        decoration: ShapeDecoration(
          color: isActive ? AppColors.primary : AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Text(
          buttonName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isActive ? AppColors.white : AppColors.black,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
