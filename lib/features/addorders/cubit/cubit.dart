import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/addorders/cubit/state.dart';

class AddNewOrderCubit extends Cubit<AddNewOrderState> {
  AddNewOrderCubit(this.api) : super(AddNewOrderInitial());
  ServiceApi api;
}
