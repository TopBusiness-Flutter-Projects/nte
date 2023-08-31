import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/homescreen/cubit/state.dart';

import '../../../core/models/ordersmodel.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(InitHomeState());
  ServiceApi api;

  int selectedIndex = 0;

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
}
