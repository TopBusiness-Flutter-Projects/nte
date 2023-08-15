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
        return SafeArea(
            child: Scaffold(
                body: ListView(
          children: [
            CustomLoginApBar(
              subTitle: 'otp_subtitle'.tr(),
              title: 'otp'.tr(),
              isLogin: false,
            ),
            SizedBox(height: getSize(context) / 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: getSize(context) / 16),
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
