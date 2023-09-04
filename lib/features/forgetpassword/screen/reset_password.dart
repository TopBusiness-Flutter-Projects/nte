import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  var key = GlobalKey<FormState>();
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
                  // CustomLoginApBar(
                  //   subTitle: 'new_pass_subtitle'.tr(),
                  //   title: 'new_pass'.tr(),
                  //   isLogin: false,
                  // ),
                  SizedBox(height: getSize(context) / 8),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: getSize(context) / 16),
                      child: Image.asset(ImageAssets.newPass)),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(getSize(context) / 22),
                    child: Text(
                      'new_pass_subtitle'.tr(),
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          fontSize: getSize(context) / 22,
                          color: AppColors.buttonColor),
                    ),
                  ),
                  CustomTextField(
                      title: 'password'.tr(),
                      textInputType: TextInputType.text,
                      backgroundColor: AppColors.white,
                      prefixWidget: const Icon(Icons.lock_open_outlined),
                      validatorMessage: 'password_msg'.tr(),
                      controller: controller.passwordController,
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
                  CustomTextField(
                      title: 'confirm_password'.tr(),
                      textInputType: TextInputType.text,
                      backgroundColor: AppColors.white,
                      prefixWidget: const Icon(Icons.lock_open_outlined),
                      validatorMessage: 'password_msg'.tr(),
                      controller: controller.confirmPasswordController,
                      isPassword: controller.isConfirmPassword,
                      suffixIcon: InkWell(
                          onTap: () {
                            controller.toggleConfirmPassword();
                          },
                          child: Icon(
                            controller.isConfirmPassword
                                ? Icons.visibility_off_rounded
                                : Icons.visibility_rounded,
                          ))),
                  SizedBox(height: getSize(context) / 8),
                  CustomButton(
                      paddingHorizontal: getSize(context) / 8,
                      borderRadius: getSize(context) / 22,
                      text: 'confirm'.tr(),
                      color: AppColors.primary,
                      onClick: () {
                        if (key.currentState!.validate()) {
                          controller.resetPassword(context);
                        } else {}
                      }),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(
                  //       horizontal: getSize(context) / 4,
                  //       vertical: getSize(context) / 12),
                  //   child: Image.asset(ImageAssets.copyRight,
                  //       width: getSize(context) / 5),
                  // ),
                  const SizedBox(height: 10),
                ],
              ),
            ));
      },
    );
  }
}
