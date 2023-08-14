import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/signup/cubit/state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.api) : super(InitSignUpState());
  ServiceApi api;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController accountController = TextEditingController();

  TextEditingController passwprdController = TextEditingController();
  TextEditingController confirmPasswprdController = TextEditingController();
  int currentUser = 0; //0 admin 1 driver  2  user

  // toggleDriver(){
  //   currentUser = 1 ;
  //   emit(DriverState());
 // }

   toggleUserDriver(int index){
    if(index==1){
      currentUser = 1 ;
      emit(DriverState());
    }
    else{
      currentUser = 2 ;
      emit(UserState());
    }
    }
  // toggleUser(){
  //   currentUser = 2 ;
  //   emit(UserState());
  // }
  bool isPassword = true;
  togglePassword() {
    isPassword = !isPassword;
    emit(ChangePasswordState());
  }
}
