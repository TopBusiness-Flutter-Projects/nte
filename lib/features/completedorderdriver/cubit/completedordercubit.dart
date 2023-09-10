import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/core/widgets/dialogs.dart';
import 'package:nte/features/completedorderdriver/cubit/completedorderdriverstate.dart';

import '../../../core/models/completed_order_driver.dart';

class CompletedOrderDriverCubit extends Cubit<CompletedOrderDriverState> {
  CompletedOrderDriverCubit(this.api) : super(CompletedOrderDriverInitial());
  ServiceApi api;
  List<OrdersCompletedPayment> completedOrders = [];
  ordersCompletedDriver() async {
    emit(LoadingGetCpmpleted());
    var response = await api.ordersCompletedDriver();

    response.fold((l) => emit(ErrorGetCompleted()), (r) {
      if (r.code == 200) {
        completedOrders = r.data.ordersCompletedPayment;
        emit(LoadedGetCompleted());
      } else {
        errorGetBar(r.message);
        emit(ErrorGetCompleted());
      }
    });
  }
}
