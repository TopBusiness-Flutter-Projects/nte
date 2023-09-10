import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/core/widgets/dialogs.dart';
import 'package:nte/features/changepassword/cubit/state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.api) : super(ChangePasswordInit());

  ServiceApi api;
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isCurrentPassword = true;
  toggleCurrentPassword() {
    isCurrentPassword = !isCurrentPassword;
    emit(ChangeCurrentPasswordModeState());
  }

  bool isNewPassword = true;
  toggleNewPassword() {
    isNewPassword = !isNewPassword;
    emit(ChangeNewPasswordModeState());
  }

  bool isConfirmPassword = true;
  toggleConfirmPassword() {
    isConfirmPassword = !isConfirmPassword;
    emit(ChangeConfirmPasswordModeState());
  }

  changePassword(BuildContext context) async {
    emit(LoadingChangePassword());
    var response = await api.changePassword(
        currentPass: currentPasswordController.text,
        newPass: newPasswordController.text,
        confirmPass: confirmPasswordController.text);
    response.fold((l) => emit(ErrorChangePassword()), (r) {
      if (r.code == 200) {
        Navigator.pop(context);
        successGetBar(r.message);
      } else {
        errorGetBar(r.message);
        emit(ErrorChangePassword());
      }
    });
  }
}
