abstract class ChangePasswordState {}

class ChangePasswordInit extends ChangePasswordState {}

class ChangeCurrentPasswordModeState extends ChangePasswordState {}

class ChangeNewPasswordModeState extends ChangePasswordState {}

class ChangeConfirmPasswordModeState extends ChangePasswordState {}

class LoadingChangePassword extends ChangePasswordState {}

class LoadedChangePassword extends ChangePasswordState {}

class ErrorChangePassword extends ChangePasswordState {}
