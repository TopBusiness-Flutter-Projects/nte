import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/homescreen/cubit/state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.api) : super(InitHomeState());
  ServiceApi api;
}