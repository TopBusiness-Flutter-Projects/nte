import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:nte/core/models/city_model.dart';
import 'package:nte/core/preferences/preferences.dart';
import 'package:nte/core/remote/service.dart';
import '../../../core/widgets/dialogs.dart';

import 'package:nte/features/signup/cubit/state.dart';

import '../../../core/models/login_model.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.api) : super(InitSignUpState()) {
    getCities();
  }
  ServiceApi api;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController identityController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswprdController = TextEditingController();
  int selectedRadio = 0; //case 0 send person 1 send company

  toggleUserClient(int index) {
    selectedRadio = index;
    emit(ClientOrUserState());
  }

  bool isPassword = true;
  togglePassword() {
    isPassword = !isPassword;
    emit(ChangePasswordModeState());
  }

  bool isCofirmPassword = true;
  toggleCofirmPassword() {
    isCofirmPassword = !isCofirmPassword;
    emit(ChangeConfirmPasswordState());
  }

  int? selectedValue;

  List<CityData> cities = [];
  var formKey = GlobalKey<FormState>();
  LoginModel? userModel;
  registerAuth(BuildContext context) async {
    emit(LoadingSighUpAuth());
    var response = await api.registerAuth(
        name: fullNameController.text,
        email: emailController.text,
        password: passwordController.text,
        password_confirmation: confirmPasswprdController.text,
        national_id: int.parse(identityController.text),
        phone: int.parse(phoneNumberController.text),
        city_id: selectedValue!,
        user_type: selectedRadio == 0 ? "person" : "company");
    response.fold(
        (l) => emit(
              ErrorSighUpAuth(),
            ), (r) {
      if (r.code == 200) {
        userModel = r;
        Preferences.instance.setUser(r).then((value) {
          (userModel!.data!.type == 'user' && userModel!.data!.userType != null)
              ? Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.homeScreen,
                  (route) => false,
                )
              : Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.homeScreenDriver,
                  (route) => false,
                );
          successGetBar(r.message);
        });
      } else {
        errorGetBar(r.message);
        emit(ErrorSighUpAuth());
      }
    });
  }

  getCities() async {
    emit(LoadingGetCities());
    final response = await api.getCities();
    response.fold((l) => emit(ErrorGetCities()), (r) {
      cities = r.data;
      emit(LoadedGetCities());
    });
  }
}
