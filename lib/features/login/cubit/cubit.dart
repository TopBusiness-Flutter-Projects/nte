import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/models/login_model.dart';
import 'package:nte/core/preferences/preferences.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/login/cubit/state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/widgets/dialogs.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(InitLoginState());
  ServiceApi api;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwprdController = TextEditingController();

  int currentUser = 2; // 1 driver  2  user

  toggleDriver() {
    currentUser = 1;
    emit(DriverState());
  }

  toggleUser() {
    currentUser = 2;
    emit(UserState());
  }

  bool isPassword = true;

  togglePassword() {
    isPassword = !isPassword;
    emit(ChangePasswordState());
  }

  var formKey = GlobalKey<FormState>();
  LoginModel? userModel;
  loginAuth(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    emit(LoadingLoginAuth());
    final response = await api.loginAuth(
        email: emailController.text,
        password: passwprdController.text,
        type: currentUser == 2 ? "user" : "driver");
    response.fold((l) => emit(ErrorLoginAuth()), (r) {
      if (r.code == 200) {
        Preferences.instance.setUser(r).then((value) {
          userModel = r;
          Navigator.pushNamed(context, Routes.homeScreen);
          successGetBar(r.message);
        });
        emailController.clear();
        passwprdController.clear();
        pref.setBool('onBoarding', true);
        emit(LoadedLoginAuth());
      } else {
        errorGetBar(r.message);
        emit(ErrorLoginAuth());
      }
    });
  }
}
