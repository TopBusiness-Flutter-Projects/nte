import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/orderdetails/cubit/state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this.api) : super(InitOrderDetailsState());
  ServiceApi api;

  TextEditingController sendOrderController = TextEditingController();
}
