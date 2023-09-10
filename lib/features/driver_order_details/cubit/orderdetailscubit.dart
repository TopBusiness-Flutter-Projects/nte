import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';

import '../../../core/models/order_details_driver.dart';
import 'orderdetailsstate.dart';

class OrderDetailsDriverCubit extends Cubit<OrderDetailsDriverState> {
  OrderDetailsDriverCubit(this.api) : super(OrderDetailsDriverInitial());
  ServiceApi api;

  DriverOrderDetailsData? orderDate;
  orderDetails(String orderId) async {
    var response = await api.orderDetailsDriver(orderId);
    response.fold((l) => emit(ErrorGetOrderDetailsDriver()), (r) {
      orderDate = r.data;
      emit(LoadedGetOrderDetailsDriver());
    });
  }
}
