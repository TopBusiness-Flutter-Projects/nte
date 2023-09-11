import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/homescreen_driver/cubit/homestate.dart';

class HomeDriverCubit extends Cubit<HomeDriverState> {
  HomeDriverCubit(this.api) : super(HomeDriverStateInit());

  ServiceApi api;
  int selectedIndex = 0;

  onChangeBottomNav(int index) {
    selectedIndex = index;
    emit(ChangeBottomNavHomeState());
  }

  navToProfile(BuildContext context) {
    selectedIndex = 2;
    emit(NavToHomeState());
  }
}
