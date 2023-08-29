import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:nte/features/forgetpassword/cubit/cubit.dart';
import 'package:nte/features/forgetpassword/cubit/state.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/loginappbar.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
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
                  child: ListView(
                    children: [
                      SizedBox(height: getSize(context) / 8),

                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: getSize(context) / 16),
                          child: Image.asset(ImageAssets.code)),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(getSize(context) / 22),
                        child: Text(
                          'otp_subtitle'.tr(),
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400,
                              fontSize: getSize(context) / 22,
                              color: AppColors.buttonColor),
                        ),
                      ),
                      //otp_subtitle
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getSize(context) / 16),
                        child: OTPTextField(
                          otpFieldStyle: OtpFieldStyle(
                            borderColor: AppColors.buttonColor,
                            enabledBorderColor: AppColors.buttonColor,
                            disabledBorderColor: AppColors.buttonColor,
                          ),
                          length: 6,
                          controller: controller.otpFieldController,
                          width: MediaQuery.of(context).size.width,
                          fieldWidth: getSize(context) / 10,
                          style: TextStyle(
                              fontSize: getSize(context) / 22,
                              color: AppColors.buttonColor),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.underline,
                          outlineBorderRadius: 10,
                          onCompleted: (pin) {
                            // widget.con.OTP = pin;
                          },
                        ),
                      ),
                      SizedBox(height: getSize(context) / 8),
                      CustomButton(
                          paddingHorizontal: getSize(context) / 8,
                          borderRadius: getSize(context) / 22,
                          text: 'next'.tr(),
                          color: AppColors.primary,
                          onClick: () {
                            //vslidate
                            Navigator.pushNamed(context, Routes.resetPassword);
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: getSize(context) / 22),
                  child: Image.asset(ImageAssets.copyRight),
                ),
              ],
            ));
      },
    );
  }
}
