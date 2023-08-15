import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:nte/core/widgets/loginappbar.dart';
import 'package:nte/features/forgetpassword/cubit/cubit.dart';
import 'package:nte/features/forgetpassword/cubit/state.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        var controller = context.read<ForgetPasswordCubit>();
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  //
                  CustomLoginApBar(
                    subTitle: 'forget_subtitle'.tr(),
                    title: 'forget_pass'.tr(),
                    isLogin: false,
                  ),

                  SizedBox(height: getSize(context) / 8),
                  Container(
                    alignment: Alignment.center,
                    padding:
                        EdgeInsets.symmetric(horizontal: getSize(context) / 16),
                    child: Text(
                      'forget_msg'.tr(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.buttonColor,
                        fontSize: getSize(context) / 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  SizedBox(height: getSize(context) / 8),
                  CustomTextField(
                    title: 'phone'.tr(),
                    textInputType: TextInputType.text,
                    backgroundColor: AppColors.white,
                    prefixWidget: const Icon(Icons.phone_outlined),
                    validatorMessage: 'phone_msg'.tr(),
                    controller: controller.phoneController,
                  ),
                  SizedBox(height: getSize(context) / 8),
                  CustomButton(
                      paddingHorizontal: getSize(context) / 8,
                      borderRadius: getSize(context) / 22,
                      text: 'send'.tr(),
                      color: AppColors.buttonColor,
                      onClick: () {
                        Navigator.pushNamed(context, Routes.otpScreen);
                      }),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
