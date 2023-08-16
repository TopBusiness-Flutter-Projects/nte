import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';

class AddImageWidget extends StatelessWidget {
  AddImageWidget({required this.image, super.key});
  void Function()? onTap;
  File? image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: getSize(context) / 3,
        height: getSize(context) / 3,
        child: Container(
          width: getSize(context) / 3,
          height: getSize(context) / 3,
          decoration: ShapeDecoration(
            color: const Color(0xFFE9EAEB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 8,
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: image != null
              ? Image.file(image!)
              : SvgPicture.asset(
                  ImageAssets.addIcon,
                ),
        ),
      ),
    );
  }
}
