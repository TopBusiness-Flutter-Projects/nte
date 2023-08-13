import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/widgets/custom_button.dart';
import 'package:nte/features/login/cubit/cubit.dart';
import 'package:nte/features/login/cubit/state.dart';

import '../../../core/utils/getsize.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/customloginstatusbutton.dart';
import '../../../core/widgets/loginappbar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var controller = BlocProvider.of<LoginCubit>(context);
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: getSize(context),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomLoginApBar(
                      subTitle: 'log_to_driver_shipment'.tr(),
                      title: 'loginIn'.tr(),
                      isLogin: true,
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
                          SizedBox(width: getSize(context) / 8),
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
                      textInputType: TextInputType.emailAddress,
                      backgroundColor: AppColors.white,
                      prefixWidget: const Icon(Icons.email_outlined),
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
                    SizedBox(height: getSize(context) / 22),
                    CustomButton(
                        paddingHorizontal: getSize(context) / 22,
                        borderRadius: getSize(context) / 16,
                        text: 'loginIn'.tr(),
                        color: AppColors.buttonColor,
                        onClick: () {}),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: getSize(context) / 22,
                          vertical: getSize(context) / 22),
                      alignment: Alignment.centerLeft,
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          'forget_pass'.tr(),
                          style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w400,
                              fontSize: getSize(context) / 22),
                        ),
                      ),
                    ),
                    SizedBox(height: getSize(context) / 8),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getSize(context) / 22),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'dont_have_account'.tr(),
                              style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: getSize(context) / 22),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                'create_account'.tr(),
                                style: TextStyle(
                                    color: AppColors.primary,
                                    fontWeight: FontWeight.w400,
                                    fontSize: getSize(context) / 22),
                              ),
                            ),
                          ]),
                    )
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
