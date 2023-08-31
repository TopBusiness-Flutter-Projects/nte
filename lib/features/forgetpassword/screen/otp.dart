import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:nte/features/forgetpassword/cubit/cubit.dart';
import 'package:nte/features/forgetpassword/cubit/state.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_button.dart';

class OTPScreen extends StatefulWidget {
  OTPScreen({super.key});
  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  var key = GlobalKey<FormState>();
  String currentText = "";
  bool hasError = false;

  StreamController<ErrorAnimationType>? errorController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        var controller = context.read<ForgetPasswordCubit>();
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.buttonColor,
                  )),
              actions: [
                Container(
                  alignment: Alignment.center,
                  padding:
                      EdgeInsets.symmetric(horizontal: getSize(context) / 22),
                  child: Text(
                    'forget_pass'.tr(),
                    style: TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                        fontSize: getSize(context) / 22,
                        color: AppColors.buttonColor),
                  ),
                )
              ],
            ),
            body: Form(
              key: key,
              child: ListView(
                children: [
                  SizedBox(height: getSize(context) / 8),

                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: getSize(context) / 16),
                      child: Image.asset(ImageAssets.code)),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(getSize(context) / 22),
                    child: Text(
                      'otp_subtitle'.tr(),
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          fontSize: getSize(context) / 22,
                          color: AppColors.buttonColor),
                    ),
                  ),
                  //otp_subtitle
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: getSize(context) / 16),
                    child: PinCodeTextField(
                      backgroundColor: AppColors.white,
                      hintCharacter: '-',
                      textStyle: TextStyle(color: AppColors.primary),
                      hintStyle: TextStyle(color: AppColors.primary),
                      pastedTextStyle: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                      appContext: context,
                      length: 6,
                      animationType: AnimationType.fade,
                      validator: (v) {
                        if (v!.length < 5) {
                          return "";
                        } else {
                          return null;
                        }
                      },
                      pinTheme: PinTheme(
                        inactiveColor: AppColors.transparent,
                        activeColor: AppColors.transparent,
                        shape: PinCodeFieldShape.box,
                        selectedColor: AppColors.transparent,
                      ),
                      cursorColor: AppColors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      errorAnimationController: errorController,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          currentText = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: getSize(context) / 8),
                  CustomButton(
                      paddingHorizontal: getSize(context) / 8,
                      borderRadius: getSize(context) / 22,
                      text: 'next'.tr(),
                      color: AppColors.primary,
                      onClick: () {
                        if (key.currentState!.validate()) {
                          if (currentText.length != 6) {
                            errorController!.add(
                              ErrorAnimationType.shake,
                            );
                            setState(() => hasError = true);
                          } else {
                            setState(
                              () {
                                hasError = false;
                                controller.verifySmsCode(currentText, context);
                              },
                            );
                          }
                        }
                        //validate
                      }),

                  Padding(
                    padding: EdgeInsets.all(getSize(context) / 4),
                    child: Image.asset(ImageAssets.copyRight,
                        width: getSize(context) / 5),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ));
      },
    );
  }
}
