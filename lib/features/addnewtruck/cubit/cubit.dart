import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/addnewtruck/cubit/state.dart';

class AddNewTruckCubit extends Cubit<AddNewTruckState> {
  AddNewTruckCubit(this.api) : super(InitAddNewTruckState());
  ServiceApi api;
  ///////////////app
  String? selectedValue;
//this list from api >>
  List<String> truckType = ['trype one ', 'type two', 'type three'];
//
  bool isVisiable = false;
  showCabinList() {
    if (selectedValue != null) {
      isVisiable = true;
      emit(ShowCabinTruckState());
    } else {
      isVisiable = false;
      emit(ShowCabinTruckState());
    }
  }

  bool cabinIsVisiable = false;
  showDataOfCabinList() {
    if (cabinSelectedValue != null) {
      cabinIsVisiable = true;
      emit(ShowCabinDataTruckState());
    } else {
      cabinIsVisiable = false;
      emit(ShowCabinDataTruckState());
    }
  }

  String? cabinSelectedValue;
  //this list from api >> when be empty >> hide customDropDown of cabin
  List<String> cabinType = ['trype one ', 'type two', 'type three'];

  TextEditingController modelController = TextEditingController();
}
