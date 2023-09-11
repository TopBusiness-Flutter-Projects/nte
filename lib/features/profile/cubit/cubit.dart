import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:nte/core/preferences/preferences.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/core/widgets/dialogs.dart';
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

  deleteAccount(BuildContext context) async {
    emit(LoadingDeleteProfile());
    final response = await api.getProfile();
    response.fold((l) => emit(ErrorDeleteProfile()), (r) {
      if (r.code == 200) {
        Preferences.instance.clearAllData().then((value) {
          successGetBar(r.message);
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.loginRoute, (Route<dynamic> route) => false);
          emit(LoadedDeleteProfile());
        });
      } else {
        errorGetBar(r.message);
      }
    });
  }
}
