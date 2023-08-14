import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/login/cubit/state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(InitLoginState());
  ServiceApi api;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwprdController = TextEditingController();

  int currentUser = 0; //0 admin 1 driver  2  user

  toggleDriver(){
    currentUser = 1 ;
    emit(DriverState());
  }


  toggleUser(){
    currentUser = 2 ;
    emit(UserState());
  }

  bool isPassword = true;

  togglePassword() {
    isPassword = !isPassword;
    emit(ChangePasswordState());
  }
}
