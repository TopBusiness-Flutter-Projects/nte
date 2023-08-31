import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/mainscreen/cubit/state.dart';

import '../../../core/models/ordersmodel.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit(this.api) : super(MainInitial());

  ServiceApi api;

  List<OrderModelData> completedOrder = [];
  List<OrderModelData> pendingOrder = [];

  ordersCompleted() async {
    emit(LoadingGetOrderComplete());
    final response = await api.ordersCompleted();
    response.fold((l) => emit(ErrorgGetOrderComplete()), (r) {
      completedOrder = r.data!;
      emit(LoadedGetOrderComplete());
    });
  }

  ordersNotCompleted() async {
    emit(LoadingGetNonOrderComplete());
    final response = await api.ordersNotCompleted();
    response.fold((l) => emit(ErrorgGetNonOrderComplete()), (r) {
      pendingOrder = r.data!;
      emit(LoadedGetNonOrderComplete());
    });
  }
}
