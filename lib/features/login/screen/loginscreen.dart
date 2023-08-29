import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/widgets/custom_button.dart';
import 'package:nte/features/login/cubit/cubit.dart';
import 'package:nte/features/login/cubit/state.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/customloginstatusbutton.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoadingLoginAuth) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        var controller = BlocProvider.of<LoginCubit>(context);
        return SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: SizedBox(
                    width: getSize(context),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            SizedBox(height: getSize(context) / 6),
                            Padding(
                              padding: EdgeInsets.all(getSize(context) / 22),
                              child: Image.asset(
                                ImageAssets.logo,
                                width: getSize(context) / 2.6,
                              ),
                            ),
                            // CustomLoginApBar(
                            //   subTitle: 'log_to_driver_shipment'.tr(),
                            //   title: 'loginIn'.tr(),
                            //   isLogin: true,
                            // ),
                            SizedBox(height: getSize(context) / 100),
                            SizedBox(
                              height: getSize(context) / 5,
                              width: getSize(context),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CustomLoginStatusWidget(
                                    buttonName: 'user'.tr(),
                                    isActive: controller.currentUser == 2
                                        ? true
                                        : false,
                                    onTap: () {
                                      controller.toggleUser();
                                    },
                                  ),
                                  CustomLoginStatusWidget(
                                    buttonName: 'driver'.tr(),
                                    isActive: controller.currentUser == 1
                                        ? true
                                        : false,
                                    onTap: () {
                                      controller.toggleDriver();
                                    },
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: getSize(context) / 32),

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
                                isLoading: isLoading,
                                paddingHorizontal: getSize(context) / 8,
                                borderRadius: getSize(context) / 22,
                                text: 'loginIn'.tr(),
                                color: AppColors.primary,
                                onClick: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.loginAuth(context);
                                  } else {}
                                }),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getSize(context) / 22,
                                  vertical: getSize(context) / 22),
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.forgetPassword);
                                },
                                child: Text(
                                  'forget_pass'.tr(),
                                  style: TextStyle(
                                      color: AppColors.secondPrimary,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Cairo',
                                      fontSize: getSize(context) / 22),
                                ),
                              ),
                            ),
                            SizedBox(height: getSize(context) / 22),
                            controller.currentUser == 1
                                ? Container()
                                : Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: getSize(context) / 22),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'dont_have_account'.tr(),
                                            style: TextStyle(
                                                color: AppColors.black,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.w400,
                                                fontSize:
                                                    getSize(context) / 22),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pushNamed(
                                                  context, Routes.signUp);
                                            },
                                            child: Text(
                                              'create_account'.tr(),
                                              style: TextStyle(
                                                  fontFamily: 'Cairo',
                                                  color:
                                                      AppColors.secondPrimary,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize:
                                                      getSize(context) / 22),
                                            ),
                                          ),
                                        ]),
                                  ),
                            SizedBox(height: getSize(context) / 8),
                          ],
                        ),
                      ),
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
