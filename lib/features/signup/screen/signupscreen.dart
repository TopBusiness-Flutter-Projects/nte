import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/features/signup/cubit/cubit.dart';
import 'package:nte/features/signup/cubit/state.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/customloginstatusbutton.dart';
import '../../../core/widgets/loginappbar.dart';
import '../../login/cubit/cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        var controller = BlocProvider.of<SignUpCubit>(context);
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: getSize(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomLoginApBar(
                      subTitle: 'new_account'.tr(),
                      title: 'create_account'.tr(),
                      onTap: () {
                        Navigator.pop(context);
                      },
                      isLogin: false,
                    ),
                    SizedBox(
                      height: getSize(context) / 5,
                      width: getSize(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomLoginStatusWidget(
                            ButtonName: 'user'.tr(),
                            isActive:
                                controller.currentUser == 2 ? true : false,
                            onTap: () {
                              setState(() {
                                controller.currentUser = 2;
                              });
                            },
                          ),
                          SizedBox(width: getSize(context) / 12),
                          CustomLoginStatusWidget(
                            ButtonName: 'driver'.tr(),
                            isActive:
                                controller.currentUser == 1 ? true : false,
                            onTap: () {
                              setState(() {
                                controller.currentUser = 1;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    CustomTextField(
                      title: 'email'.tr(),
                      textInputType: TextInputType.name,
                      backgroundColor: AppColors.white,
                      prefixWidget: const Icon(Icons.person),
                      validatorMessage: 'email_msg'.tr(),
                      controller: controller.emailController,
                    ),
                    SizedBox(height: getSize(context) / 30),
                    CustomTextField(
                      title: 'email'.tr(),
                      textInputType: TextInputType.phone,
                      backgroundColor: AppColors.white,
                      prefixWidget: const Icon(Icons.phone),
                      validatorMessage: 'email_msg'.tr(),
                      controller: controller.emailController,
                    ),
                    SizedBox(height: getSize(context) / 30),
                    CustomTextField(
                      title: 'email'.tr(),
                      textInputType: TextInputType.emailAddress,
                      backgroundColor: AppColors.white,
                      prefixWidget: const Icon(Icons.email_outlined),
                      validatorMessage: 'email_msg'.tr(),
                      controller: controller.emailController,
                    ),
                    SizedBox(height: getSize(context) / 30),
                    CustomTextField(
                      title: 'email'.tr(),
                      textInputType: TextInputType.streetAddress,
                      backgroundColor: AppColors.white,
                      prefixWidget: const Icon(Icons.home_rounded),
                      validatorMessage: 'email_msg'.tr(),
                      controller: controller.emailController,
                    ),
                    SizedBox(height: getSize(context) / 30),
                    CustomTextField(
                        title: 'password'.tr(),
                        textInputType: TextInputType.text,
                        backgroundColor: AppColors.white,
                        prefixWidget: const Icon(Icons.lock_outline),
                        validatorMessage: 'password'.tr(),
                        controller: controller.passwprdController,
                        isPassword: controller.isPassword,
                        suffixIcon: InkWell(
                            onTap: () {
                              controller.togglePassword();
                            },
                            child: Icon(
                              controller.isPassword
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                            ))),
                    SizedBox(height: getSize(context) / 30),
                    CustomTextField(
                        title: 'confirm_password'.tr(),
                        textInputType: TextInputType.text,
                        backgroundColor: AppColors.white,
                        prefixWidget: const Icon(Icons.lock_outline),
                        validatorMessage: 'password'.tr(),
                        controller: controller.passwprdController,
                        isPassword: controller.isPassword,
                        suffixIcon: InkWell(
                            onTap: () {
                              controller.togglePassword();
                            },
                            child: Icon(
                              controller.isPassword
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                            ))),
                    SizedBox(height: getSize(context) / 22),
                    CustomButton(
                        paddingHorizontal: getSize(context) / 22,
                        borderRadius: getSize(context) / 16,
                        text: 'create_account'.tr(),
                        color: AppColors.buttonColor,
                        onClick: () {}),
                    SizedBox(height: getSize(context) / 22),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
