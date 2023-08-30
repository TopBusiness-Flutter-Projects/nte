import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/utils/assets_manager.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:nte/features/forgetpassword/cubit/cubit.dart';
import 'package:nte/features/forgetpassword/cubit/state.dart';

import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_button.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  var key = GlobalKey<FormState>();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, state) {
        if (state is LoadingCheckPhoneExistState) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
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
            child: Column(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
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
                        // CustomTextField(
                        //   title: 'phone'.tr(),
                        //   textInputType: TextInputType.phone,
                        //   backgroundColor: AppColors.white,
                        //   prefixWidget: const Icon(CupertinoIcons.phone),
                        //   validatorMessage: 'phone_msg'.tr(),
                        //   controller: controller.phoneController,
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getSize(context) / 22),
                          child: InternationalPhoneNumberInput(
                            countries: const ['SA', 'EG'],
                            inputDecoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(getSize(context) / 8),
                                borderSide:
                                    BorderSide(color: AppColors.buttonColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(getSize(context) / 8),
                                borderSide:
                                    BorderSide(color: AppColors.buttonColor),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(getSize(context) / 8),
                                borderSide:
                                    BorderSide(color: AppColors.buttonColor),
                              ),
                              fillColor: AppColors.white,
                              filled: true,
                            ),
                            searchBoxDecoration: InputDecoration(
                              labelText: 'search'.tr(),
                            ),
                            errorMessage: null,
                            isEnabled: true,
                            onInputChanged: (PhoneNumber number) {
                              controller.phoneCode = number.dialCode!;
                            },
                            autoFocusSearch: true,
                            initialValue: PhoneNumber(
                              isoCode:
                                  controller.phoneCode == '+966' ? "SA" : 'EG',
                            ),
                            selectorConfig: const SelectorConfig(
                              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                              showFlags: false,
                              setSelectorButtonAsPrefixIcon: false,
                              useEmoji: true,
                              trailingSpace: false,
                              leadingPadding: 0,
                            ),
                            ignoreBlank: true,
                            selectorTextStyle: TextStyle(
                              color: AppColors.black,
                              fontSize: getSize(context) / 22,
                            ),
                            hintText: 'search',
                            textStyle: TextStyle(
                              color: AppColors.black,
                              fontSize: getSize(context) / 22,
                            ),
                            textAlign: TextAlign.end,
                            formatInput: false,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'phone_msg'.tr();
                              }
                              return null;
                            },
                            textFieldController: controller.phoneController,
                            keyboardType: TextInputType.phone,
                            keyboardAction: TextInputAction.go,
                            inputBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: AppColors.buttonColor,
                              strokeAlign: 1,
                            )),
                          ),
                        ),
                        SizedBox(height: getSize(context) / 8),
                        CustomButton(
                            isLoading: isLoading,
                            paddingHorizontal: getSize(context) / 8,
                            borderRadius: getSize(context) / 22,
                            text: 'send'.tr(),
                            color: AppColors.primary,
                            onClick: () {
                              if (key.currentState!.validate()) {
                                controller.phoneCheck(context);
                              }
                            }),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: getSize(context) / 22),
                  child: Image.asset(ImageAssets.copyRight),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
