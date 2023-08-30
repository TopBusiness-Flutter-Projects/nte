abstract class ForgetPasswordState {}

class InitForgetPassword extends ForgetPasswordState {}

class ChangePasswordState extends ForgetPasswordState {}

class LoadingCheckPhoneExistState extends ForgetPasswordState {}

class LoadedCheckPhoneExistState extends ForgetPasswordState {}

class ErrorCheckPhoneExistState extends ForgetPasswordState {}

class SendCodeLoading extends ForgetPasswordState {}

class OnSmsCodeSent extends ForgetPasswordState {
  final String smsCode;

  OnSmsCodeSent(this.smsCode);
}

class CheckCodeInvalidCode extends ForgetPasswordState {}

class CheckCodeSuccessfully extends ForgetPasswordState {}

class CheckCodeErrorfully extends ForgetPasswordState {}

class LoginLoading extends ForgetPasswordState {}

class LoginLoaded extends ForgetPasswordState {}

class LoginFailure extends ForgetPasswordState {}

class LoadingResetPassword extends ForgetPasswordState {}

class LoadedResetPassword extends ForgetPasswordState {}

class ErrorResetPassword extends ForgetPasswordState {}
