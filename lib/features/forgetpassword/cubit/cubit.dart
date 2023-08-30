import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/core/widgets/dialogs.dart';
import 'package:nte/features/forgetpassword/cubit/state.dart';
import 'package:otp_text_field/otp_field.dart';

import '../../../config/routes/app_routes.dart';

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

  phoneCheck(BuildContext context) async {
    emit(LoadingCheckPhoneExistState());
    final response = await api.phoneCheck(phone: phoneController.text);

    response.fold((l) => emit(ErrorCheckPhoneExistState()), (r) {
      if (r.code == 200) {
        Navigator.pushNamed(context, Routes.otpScreen);
        successGetBar(r.message);
        sendSmsCode(code: phoneCode, phoneNum: phoneController.text);

        ///
      } else {
        errorGetBar(r.message);
      }
      emit(LoadedCheckPhoneExistState());
    });
  }

  FirebaseAuth auth = FirebaseAuth.instance;
  String smsCode = '';
  String verficationCode = '';
  bool isRegister = false;
  String phoneCode = '+966';
  final FirebaseAuth _mAuth = FirebaseAuth.instance;
  String? verificationId;
  int? resendToken;

  Future sendSmsCode({String? code, String? phoneNum}) async {
    print('================================================');
    print('code :$code');
    print("phoneNum : $phoneNum");
    print('================================================');
    emit(SendCodeLoading());
    _mAuth.setSettings(forceRecaptchaFlow: true);
    _mAuth.verifyPhoneNumber(
      forceResendingToken: resendToken,
      phoneNumber: '${code ?? phoneCode}' "${phoneNum ?? phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) {
        smsCode = credential.smsCode!;
        verificationId = credential.verificationId;
        print('++++++++++++++++++++++++++++++++++');
        print("verificationId=>$verificationId");
        print('smsCode : $smsCode');
        print('++++++++++++++++++++++++++++++++++');

        emit(OnSmsCodeSent(smsCode));
        // verifySmsCode(smsCode);
      },
      verificationFailed: (FirebaseAuthException e) {
        emit(CheckCodeInvalidCode());
        print("Errrrorrrrr : ${e.message}");
      },
      codeSent: (String verificationId, int? resendToken) {
        this.resendToken = resendToken;
        this.verificationId = verificationId;
        print("verificationId=>$verificationId");
        emit(OnSmsCodeSent(''));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this.verificationId = verificationId;
        print('*************************************');
        print("verificationId=>$verificationId");
        print('smsCode : $smsCode');
        print('*************************************');
      },
    );
  }

  ///at otp screen
  verifySmsCode(String smsCode, BuildContext context) async {
    print(verificationId);
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId!,
      smsCode: smsCode,
    );
    await _mAuth.signInWithCredential(credential).then((value) {
      emit(CheckCodeSuccessfully());
      Navigator.pushReplacementNamed(context, Routes.resetPassword);
    }).catchError((error) {
      errorGetBar(error.toString());
      emit(CheckCodeErrorfully());
    });
  }

  resetPassword(BuildContext context) async {
    emit(LoadingResetPassword());

    final response = await api.resetPassword(
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text);
    response.fold((l) => emit(ErrorResetPassword()), (r) {
      if (r.code == 200) {
        successGetBar(r.message);
        Navigator.pushReplacementNamed(context, Routes.loginRoute);
      } else {
        errorGetBar(r.message);
      }
      emit(LoadedResetPassword());
    });
  }

  ///
}
