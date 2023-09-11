import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:nte/core/preferences/preferences.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/homescreen/cubit/state.dart';

import '../../../core/models/login_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(InitHomeState()) {
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

  navToOrders(BuildContext context) {
    selectedIndex = 1;
    Navigator.pop(context);
    Navigator.pop(context);
    emit(NavToOrdersHomeState());
  }

  navToProfile(BuildContext context) {
    selectedIndex = 1;
    emit(NavToHomeState());
  }

  onSelectIgtem(int index, BuildContext context) {
    selectedIndex = index;

    emit(OnSelectNewitem());
  }

  ontapFloatingActionButton(BuildContext context) {
    Navigator.pushNamed(context, Routes.addNewOrder);
    emit(NavToHome2State());
  }
}
