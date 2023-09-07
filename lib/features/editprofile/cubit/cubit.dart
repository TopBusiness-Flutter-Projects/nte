import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/core/widgets/dialogs.dart';
import 'package:nte/features/editprofile/cubit/state.dart';
import 'package:nte/features/homescreen/cubit/cubit.dart';
import 'package:nte/features/profile/cubit/cubit.dart';

import '../../../core/models/city_model.dart';
import '../../../core/models/login_model.dart';
import '../../../core/preferences/preferences.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  CityData? city;

  EditProfileCubit(this.api) : super(EditProfileInit()) {
    getCities().then((value) => getProfile());
  }

  ServiceApi api;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  int? selectedValue;

  List<CityData> cities = [];
  Future getCities() async {
    emit(LoadingGetCities());
    final response = await api.getCities();
    response.fold((l) => emit(ErrorGetCities()), (r) {
      cities = r.data;

      emit(LoadedGetCities());
    });
  }

  Data? profileData;
  getProfile() async {
    emit(LoadingGetProfile());
    final response = await api.getProfile();
    response.fold((l) => emit(ErrorGetProfile()), (r) {
      profileData = r.data;
      fullNameController.text = r.data!.name;
      emailController.text = r.data!.email;
      phoneNumberController.text = r.data!.phone;
      selectedValue = r.data!.city.id;
      for (int i = 0; i < cities.length; i++) {
        if (profileData!.city.id == cities.elementAt(i).id) {
          city = cities[i];
        }
      }
      debugPrint(city!.name);
      emit(LoadedGetProfile());
    });
  }

  bool isValid = false;

  File? imageFile;
  // File? image;
  Future pickImage() async {
    emit(LoadingAddNewImage());
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      imageFile = imageTemporary;
      emit(LoadedAddNewImage());
    } on PlatformException catch (e) {
      print('error $e');
    }
  }

  ///
  updateProfile(BuildContext context) async {
    emit(LoadingUpdateProfile());
    final response = await api.updateProfile(
        name: fullNameController.text,
        email: emailController.text,
        phone: int.parse(phoneNumberController.text),
        cityId: selectedValue!,
        image: imageFile);
    response.fold((l) => emit(ErrorUpdateProfile()), (r) async {
      Preferences.instance.setUser(r).then((value) {
        context.read<ProfileCubit>().getProfile();
        context.read<HomeCubit>().getProfileInfo();
        imageFile = null;
        Navigator.pop(context);
        successGetBar(r.message);
        fullNameController.clear();
        emailController.clear();
        city = null;
        phoneNumberController.clear();
        emit(LoadedUpdateProfile());
      });

      ///
    });

    ///update in Profile cubit
  }
}
