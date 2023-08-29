import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/widgets/my_svg_widget.dart';

import 'package:nte/features/signup/cubit/cubit.dart';
import 'package:nte/features/signup/cubit/state.dart';

import '../../../core/models/city_model.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/dialogs.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is LoadingSighUpAuth) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        var controller = BlocProvider.of<SignUpCubit>(context);
        // controller.cities.isEmpty ? controller.getCities() : null;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.secondPrimary,
                )),
          ),
          body: SizedBox(
            width: getSize(context),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    // CustomLoginApBar(
                    //   subTitle: 'new_account'.tr(),
                    //   title: 'create_account'.tr(),
                    //   isLogin: false,
                    // ),

                    Padding(
                      padding: EdgeInsets.all(getSize(context) / 22),
                      child: Image.asset(
                        ImageAssets.logo,
                        width: getSize(context) / 2.6,
                      ),
                    ),
                    Container(
                      height: getSize(context) / 5,
                      alignment: Alignment.center,
                      child: ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: 0,
                                activeColor: AppColors.secondPrimary,
                                groupValue: controller.selectedRadio,
                                onChanged: (index) {
                                  controller.toggleUserClient(index!);
                                },
                              ),
                              Text(
                                'person'.tr(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Cairo',
                                ),
                              ), // Add your label or text here
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Radio(
                                value: 1,
                                activeColor: AppColors.secondPrimary,
                                groupValue: controller.selectedRadio,
                                onChanged: (index) {
                                  controller.toggleUserClient(index!);
                                },
                              ),
                              Text(
                                'business'.tr(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Cairo',
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    CustomTextField(
                      title: 'fullname'.tr(),
                      textInputType: TextInputType.name,
                      backgroundColor: AppColors.white,
                      prefixWidget: const Icon(CupertinoIcons.person),
                      validatorMessage: 'fullname_msg'.tr(),
                      controller: controller.fullNameController,
                    ),
                    SizedBox(height: getSize(context) / 30),
                    CustomTextField(
                      title: 'phone'.tr(),
                      textInputType: TextInputType.phone,
                      backgroundColor: AppColors.white,
                      prefixWidget: const Icon(CupertinoIcons.phone),
                      validatorMessage: 'phone_msg'.tr(),
                      controller: controller.phoneNumberController,
                    ),
                    SizedBox(height: getSize(context) / 30),
                    CustomTextField(
                      title: 'email'.tr(),
                      textInputType: TextInputType.emailAddress,
                      backgroundColor: AppColors.white,
                      prefixWidget: const Icon(CupertinoIcons.mail),
                      validatorMessage: 'email_msg'.tr(),
                      controller: controller.emailController,
                    ),
                    SizedBox(height: getSize(context) / 30),
                    CustomTextField(
                      title: 'identity'.tr(),
                      textInputType: TextInputType.number,
                      backgroundColor: AppColors.white,
                      prefixWidget: Container(
                        margin: EdgeInsets.symmetric(
                            vertical: getSize(context) / 44,
                            horizontal: getSize(context) / 44),
                        child: MySvgWidget(
                            path: ImageAssets.identityIcon,
                            imageColor: AppColors.buttonColor,
                            size: getSize(context) / 100),
                      ),
                      validatorMessage: 'identity_msg'.tr(),
                      controller: controller.identityController,
                    ),
                    SizedBox(height: getSize(context) / 30),
                    // CustomTextField(
                    //   title: 'city'.tr(),
                    //   textInputType: TextInputType.streetAddress,
                    //   backgroundColor: AppColors.white,
                    //   prefixWidget: const Icon(Icons.home_rounded),
                    //   validatorMessage: 'city_msg'.tr(),
                    //   suffixIcon: const Icon(Icons.arrow_drop_down),
                    //   controller: controller.cityController,
                    // ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getSize(context) / 22),
                      child: DropdownButtonFormField2<CityData>(
                        isExpanded: true,
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Cairo',
                            color: AppColors.black),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 14, horizontal: 14),
                          hintText: 'city'.tr(),
                          hintStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Cairo',
                            color: AppColors.gray6,
                          ),
                          helperStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Cairo',
                            color: AppColors.gray6,
                          ),
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
                          prefixIcon: const Icon(Icons.home_outlined),
                          suffixIconColor: AppColors.buttonColor,
                          prefixIconColor: AppColors.buttonColor,
                          fillColor: AppColors.white,
                          filled: true,
                        ),
                        items: controller.cities
                            .map((item) => DropdownMenuItem<CityData>(
                                  value: item,
                                  child: Text(
                                    item.nameAr,
                                    style: TextStyle(
                                        fontFamily: 'Cairo',
                                        // color: AppColors.black,
                                        fontWeight: FontWeight.w400,
                                        fontSize: getSize(context) / 22),
                                  ),
                                ))
                            .toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'city_msg'.tr();
                          }
                          return null;
                        },
                        onChanged: (value) {
                          controller.selectedValue = value!.id;
                        },
                        onSaved: (value) {
                          controller.selectedValue = value!.id;
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 8),
                        ),
                        iconStyleData: IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: AppColors.buttonColor,
                          ),
                          iconSize: getSize(context) / 12,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),

                    SizedBox(height: getSize(context) / 30),

                    CustomTextField(
                        title: 'password'.tr(),
                        textInputType: TextInputType.text,
                        backgroundColor: AppColors.white,
                        prefixWidget: const Icon(Icons.lock_outline),
                        validatorMessage: 'password'.tr(),
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
                    SizedBox(height: getSize(context) / 30),
                    CustomTextField(
                        title: 'confirm_password'.tr(),
                        textInputType: TextInputType.text,
                        backgroundColor: AppColors.white,
                        prefixWidget: const Icon(Icons.lock_outline),
                        validatorMessage: 'password'.tr(),
                        controller: controller.confirmPasswprdController,
                        isPassword: controller.isCofirmPassword,
                        suffixIcon: InkWell(
                            onTap: () {
                              controller.toggleCofirmPassword();
                            },
                            child: Icon(
                              controller.isCofirmPassword
                                  ? Icons.visibility_off_rounded
                                  : Icons.visibility_rounded,
                            ))),
                    SizedBox(height: getSize(context) / 22),
                    CustomButton(
                        isLoading: isLoading,
                        paddingHorizontal: getSize(context) / 8,
                        borderRadius: getSize(context) / 22,
                        text: 'create_account'.tr(),
                        color: AppColors.primary,
                        onClick: () {
                          if (controller.formKey.currentState!.validate()) {
                            if (controller.passwordController.text ==
                                controller.confirmPasswprdController.text) {
                              controller.registerAuth(context);
                            } else {
                              errorGetBar('same_pass_msg'.tr());
                            }
                          } else {}

                          ///check two pass equal
                          ///
                        }),
                    SizedBox(height: getSize(context) / 22),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: getSize(context) / 22),
                      child: Image.asset(ImageAssets.copyRight),
                    ),
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
