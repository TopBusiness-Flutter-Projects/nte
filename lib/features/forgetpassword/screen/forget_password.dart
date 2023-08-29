import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/utils/assets_manager.dart';
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
          body: Column(
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // CustomLoginApBar(
                      //   subTitle: 'forget_subtitle'.tr(),
                      //   title: 'forget_pass'.tr(),
                      //   isLogin: false,
                      // ),
                      SizedBox(height: getSize(context) / 8),
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: getSize(context) / 16),
                          child: Image.asset(ImageAssets.resetPass)),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(getSize(context) / 22),
                        child: Text(
                          'forget_msg'.tr(),
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400,
                              fontSize: getSize(context) / 22,
                              color: AppColors.buttonColor),
                        ),
                      ),
                      SizedBox(height: getSize(context) / 8),
                      CustomTextField(
                        title: 'phone'.tr(),
                        textInputType: TextInputType.phone,
                        backgroundColor: AppColors.white,
                        prefixWidget: const Icon(CupertinoIcons.phone),
                        validatorMessage: 'phone_msg'.tr(),
                        controller: controller.phoneController,
                      ),
                      SizedBox(height: getSize(context) / 8),
                      CustomButton(
                          paddingHorizontal: getSize(context) / 8,
                          borderRadius: getSize(context) / 22,
                          text: 'send'.tr(),
                          color: AppColors.primary,
                          onClick: () {
                            Navigator.pushNamed(context, Routes.otpScreen);
                          }),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: getSize(context) / 22),
                child: Image.asset(ImageAssets.copyRight),
              ),
            ],
          ),
        );
      },
    );
  }
}
