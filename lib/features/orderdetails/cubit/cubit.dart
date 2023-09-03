import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/core/widgets/dialogs.dart';
import 'package:nte/features/mainscreen/cubit/cubit.dart';
import 'package:nte/features/orderdetails/cubit/state.dart';

import '../../../core/models/orderdetails.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this.api) : super(InitOrderDetailsState());
  ServiceApi api;

  TextEditingController sendOrderController = TextEditingController();

  //orderDetails
  OrderDetailsModelData? orderdetails;
  orderDetails(String orderId) async {
    emit(LoadingGetOrderDetailsState());
    final response = await api.orderDetails(orderId);

    response.fold((l) => emit(ErrorGetOrderDetailsState()), (r) {
      orderdetails = r.data;
      emit(LoadedGetOrderDetailsState());
    });
  }

  deleteOrder(BuildContext context, int id) async {
    emit(LoadingDeleteOrderDetailsState());
    final response = await api.deleteOrder(id);

    response.fold((l) => emit(ErrorDeleteOrderDetailsState()), (r) {
      successGetBar(r.message);
      context.read<MainCubit>().ordersNotCompleted();
      Navigator.pop(context);
      emit(LoadedDeleteOrderDetailsState());
    });
  }
}
