import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/forgetpassword/cubit/state.dart';
import 'package:otp_text_field/otp_field.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.api) : super(InitForgetPassword());
  ServiceApi api;
  TextEditingController phoneController = TextEditingController();
  OtpFieldController otpFieldController = OtpFieldController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isPassword = true;
  bool isConfirmPassword = true;

  togglePassword() {
    isPassword = !isPassword;
    emit(ChangePasswordState());
  }

  toggleConfirmPassword() {
    isConfirmPassword = !isConfirmPassword;
    emit(ChangePasswordState());
  }

  ///
}
