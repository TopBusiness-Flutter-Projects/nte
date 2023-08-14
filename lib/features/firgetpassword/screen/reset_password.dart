import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/loginappbar.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
      builder: (context, state) {
        var controller = context.read<ForgetPasswordCubit>();
        return SafeArea(
            child: Scaffold(
                body: ListView(
          children: [
            CustomLoginApBar(
              subTitle: 'new_pass_subtitle'.tr(),
              title: 'new_pass'.tr(),
              isLogin: false,
            ),
            SizedBox(height: getSize(context) / 8),
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
                      controller.isPassword
                          ? Icons.visibility_off_rounded
                          : Icons.visibility_rounded,
                    ))),
            SizedBox(height: getSize(context) / 8),
            CustomButton(
                paddingHorizontal: getSize(context) / 8,
                borderRadius: getSize(context) / 22,
                text: 'confirm'.tr(),
                color: AppColors.buttonColor,
                onClick: () {
                  //vslidate
                  Navigator.pushNamed(context, Routes.resetPassword);
                }),
          ],
        )));
      },
    );
  }
}
