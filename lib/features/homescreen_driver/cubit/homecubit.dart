import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/homescreen_driver/cubit/homestate.dart';

import '../../../core/models/login_model.dart';
import '../../../core/preferences/preferences.dart';

class HomeDriverCubit extends Cubit<HomeDriverState> {
  HomeDriverCubit(this.api) : super(HomeDriverStateInit()) {
    getProfileInfo();
  }

  ServiceApi api;
  int selectedIndex = 0;
  LoginModel? profile;
  getProfileInfo() async {
    emit(LoadingGetUserData());
    await Preferences.instance.getUserModel().then((value) {
      profile = value;
      emit(LoadedGetUserData());
    });
  }

  onChangeBottomNav(int index) {
    selectedIndex = index;
    emit(ChangeBottomNavHomeState());
  }
}
