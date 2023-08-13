import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/signup/cubit/state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.api) : super(InitSignUpState());
  ServiceApi api;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwprdController = TextEditingController();
  int currentUser = 0; //0 admin 1 driver  2  user
  bool isPassword = true;
  togglePassword() {
    isPassword = !isPassword;
    emit(ChangePasswordState());
  }
}
