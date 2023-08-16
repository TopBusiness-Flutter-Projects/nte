import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/mytruck/cubit/state.dart';

class TruckCubit extends Cubit<TruckState> {
  TruckCubit(this.api) : super(InitTruckState());
  ServiceApi api;
  List trucks = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
}
