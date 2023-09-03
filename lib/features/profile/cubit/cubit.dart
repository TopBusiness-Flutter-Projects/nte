import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/profile/cubit/state.dart';

import '../../../core/models/login_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.api) : super(InitProfileState());

  ServiceApi api;
  /////////////
  Data? profileData;

  getProfile() async {
    emit(LoadingGetProfile());
    final response = await api.getProfile();
    response.fold((l) => emit(ErrorGetProfile()), (r) {
      profileData = r.data;
      emit(LoadedGetProfile());
    });
  }
}
