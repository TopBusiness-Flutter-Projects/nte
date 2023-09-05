import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/widgets/custom_textfield.dart';

class Addorderwidget extends StatelessWidget {
  Addorderwidget(
      {super.key,
      required this.prefixWidget,
      required this.controller,
      required this.title,
      this.textInputType = TextInputType.number,
      required this.validatorMessage});
  Widget prefixWidget;
  String title;
  String validatorMessage;
  TextEditingController controller;
  TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CustomTextField(
          prefixWidget: prefixWidget,
          isAdd: true,
          horizontalPadding: 10,
          controller: controller,
          title: title,
          validatorMessage: validatorMessage,
          textInputType: textInputType,
          backgroundColor: AppColors.white),
    );
  }
}
