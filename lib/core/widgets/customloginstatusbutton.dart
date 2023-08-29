import 'package:easy_localization/easy_localization.dart';
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
        width: getSize(context) / 3,
        height: getSize(context) / 8,
        decoration: ShapeDecoration(
          color: isActive ? AppColors.primary : AppColors.gray7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                  buttonName == 'user'.tr() ? getSize(context) / 22 : 0),
              bottomRight: Radius.circular(
                  buttonName == 'user'.tr() ? getSize(context) / 22 : 0),
              bottomLeft: Radius.circular(
                  buttonName == 'user'.tr() ? 0 : getSize(context) / 22),
              topLeft: Radius.circular(
                  buttonName == 'user'.tr() ? 0 : getSize(context) / 22),
            ),
          ),
          shadows: isActive
              ? []
              : const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 1,
                    offset: Offset(0, 1),
                    spreadRadius: 0,
                  )
                ],
        ),
        child: Text(
          buttonName,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Cairo',
            color: isActive ? AppColors.white : AppColors.black,
            fontSize: getSize(context) / 22,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
