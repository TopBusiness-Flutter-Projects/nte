import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/widgets/custom_button.dart';
import 'package:nte/core/widgets/custom_textfield.dart';
import 'package:nte/core/widgets/dialogs.dart';
import 'package:nte/features/changepassword/cubit/cubit.dart';
import 'package:nte/features/changepassword/cubit/state.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/customappbar.dart';

class ChangePasswordDriver extends StatefulWidget {
  const ChangePasswordDriver({super.key});

  @override
  State<ChangePasswordDriver> createState() => _ChangePasswordDriverState();
}

class _ChangePasswordDriverState extends State<ChangePasswordDriver> {
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is LoadingChangePassword) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        var cubit = context.read<ChangePasswordCubit>();
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  height: getSize(context) / 3.2,
                  width: double.infinity,
                  color: AppColors.blue1,
                  child: CustomAppBar(
                    isHome: true,
                    isDriver: true,
                  ),
                ),
                Flexible(
                  child: Container(
                      margin: EdgeInsets.only(top: getSize(context) / 12),
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(getSize(context) / 22),
                              topRight:
                                  Radius.circular(getSize(context) / 22))),
                      child: Form(
                        key: formKey,
                        child: ListView(
                          children: [
                            CustomTextField(
                                validatorMessage: 'password'.tr(),
                                controller: cubit.currentPasswordController,
                                suffixIcon: InkWell(
                                    onTap: () {
                                      cubit.toggleCurrentPassword();
                                    },
                                    child: Icon(
                                      cubit.isCurrentPassword
                                          ? Icons.visibility_off_rounded
                                          : Icons.visibility_rounded,
                                    )),
                                isPassword: cubit.isCurrentPassword,
                                prefixWidget:
                                    Icon(Icons.lock, color: AppColors.primary),
                                title: 'current_pass'.tr(),
                                textInputType: TextInputType.visiblePassword,
                                backgroundColor: AppColors.white),
                            SizedBox(height: getSize(context) / 22),
                            CustomTextField(
                                validatorMessage: 'password'.tr(),
                                controller: cubit.newPasswordController,
                                suffixIcon: InkWell(
                                    onTap: () {
                                      cubit.toggleNewPassword();
                                    },
                                    child: Icon(
                                      cubit.isNewPassword
                                          ? Icons.visibility_off_rounded
                                          : Icons.visibility_rounded,
                                    )),
                                isPassword: cubit.isNewPassword,
                                prefixWidget:
                                    Icon(Icons.lock, color: AppColors.primary),
                                title: 'new_pass'.tr(),
                                textInputType: TextInputType.visiblePassword,
                                backgroundColor: AppColors.white),
                            SizedBox(height: getSize(context) / 22),
                            CustomTextField(
                                validatorMessage: 'password'.tr(),
                                controller: cubit.confirmPasswordController,
                                suffixIcon: InkWell(
                                    onTap: () {
                                      cubit.toggleConfirmPassword();
                                    },
                                    child: Icon(
                                      cubit.isConfirmPassword
                                          ? Icons.visibility_off_rounded
                                          : Icons.visibility_rounded,
                                    )),
                                isPassword: cubit.isConfirmPassword,
                                prefixWidget:
                                    Icon(Icons.lock, color: AppColors.primary),
                                title: 'confirm_password'.tr(),
                                textInputType: TextInputType.visiblePassword,
                                backgroundColor: AppColors.white),
                            SizedBox(height: getSize(context) / 12),
                            CustomButton(
                                paddingHorizontal: getSize(context) / 8,
                                text: 'confirm_pass',
                                color: AppColors.primary,
                                borderRadius: getSize(context) / 22,
                                isLoading: isLoading,
                                onClick: () {
                                  if (formKey.currentState!.validate()) {
                                    if (cubit.newPasswordController.text ==
                                        cubit.confirmPasswordController.text) {
                                      cubit.changePassword(context);
                                      /////check 200 >>
                                    } else {
                                      errorGetBar('not_same'.tr());
                                    }
                                  }

                                  ///validate
                                })
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
