import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/features/mainscreen_driver/maincubit/mainstate.dart';

import '../../../core/models/allorder_driver.dart';

class MainOrderDriverCubit extends Cubit<MainOrdersDriverState> {
  MainOrderDriverCubit(this.api) : super(MainOrderDriverInitial());
  ServiceApi api;

  List<Order> orders = [];
  getMainOrders() async {
    emit(LoadingGetMainOrders());
    var response = await api.allOrdersDriver(search: currentFilter);
    response.fold((l) => emit(ErrorGetMainOrders()), (r) {
      orders = r.data.orders;
      emit(LoadedGetMainOrders());
    });
  }

  String? currentFilter;
  int currentFilterNum = 0;
  toggleToWaiting(String filter) {
    currentFilterNum = 1;
    currentFilter = filter;
    emit(ChangeFilterGetMainOrders());
  }

  toggleToHanging(String filter) {
    currentFilterNum = 2;
    currentFilter = filter;
    emit(ChangeFilter2GetMainOrders());
  }

  onTapSubmit(BuildContext context) async {
    Navigator.pop(context);
    await getMainOrders();
    emit(SubmitFilterGetMainOrders());
  }

  onCancel(BuildContext context) async {
    currentFilter = null;
    currentFilterNum = -1;
    await getMainOrders();
    Navigator.pop(context);
  }
}
