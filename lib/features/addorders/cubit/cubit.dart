import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/core/widgets/dialogs.dart';
import 'package:nte/features/addorders/cubit/direction_repository.dart';
import 'package:nte/features/addorders/cubit/state.dart';
import 'package:nte/features/homescreen/cubit/cubit.dart';
import 'package:nte/features/mainscreen/cubit/cubit.dart';

import '../../../core/models/allplaces.dart';
import '../../../core/models/directions_model.dart';

class AddNewOrderCubit extends Cubit<AddNewOrderState> {
  AddNewOrderCubit(this.api) : super(AddNewOrderInitial()) {
    getAllPlaces();
  }
  ServiceApi api;

  ///https://maps.googleapis.com/maps/api/directions/json?
  Marker? source;
  Marker? destination;

  Directions? info;
  void addMarker(LatLng pos) async {
    if (source == null || (source != null && destination != null)) {
      source = Marker(
          markerId: const MarkerId("source"),
          infoWindow: const InfoWindow(title: "source"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos);
      destination = null;
      info = null;

      emit(Adding1NewOffer());
    } else {
      destination = Marker(
          markerId: const MarkerId("destination"),
          infoWindow: const InfoWindow(title: "destination"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
          position: pos);
      emit(Adding2NewOffer());
      final directions = await DirectionsRepository()
          .getDirections(source: source!.position, destination: pos);
      info = directions;

      if (info != null) {
        CameraUpdate.newLatLngBounds(info!.bounds!, 100);
      } else {
        CameraUpdate.newCameraPosition(const CameraPosition(
          target: LatLng(24.774265, 46.738586),
          zoom: 14.4746,
        ));
      }
      emit(Adding3NewOffer());
    }
  }

  TabController? tabController;
  void navigateToSecondTab() {
    tabController!.animateTo(1);
  }

  void navigateToFirstTab() {
    tabController!.animateTo(0);
  }

  List<AllPlacesModelData> cities = [];

  AllPlacesModelData? selectedValueSource;
  AllPlacesModelData? selectedValueDestination;

  getAllPlaces() async {
    emit(LoadingGetAllPlaces());
    final response = await api.getAllPlaces();
    response.fold((l) => emit(ErrorGetAllPlaces()), (r) {
      cities = r.data;
      emit(LoadedGetAllPlaces());
    });
  }

  onChangeSource(AllPlacesModelData? value) {
    selectedValueSource = value;
    source = Marker(
        markerId: const MarkerId("source"),
        infoWindow: const InfoWindow(title: "source"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
        position: LatLng(double.parse(value!.lat), double.parse(value.lang)));
    destination = null;
    info = null;
    emit(ChangePlacesSource());
  }

  onChangeDestination(AllPlacesModelData? value) async {
    selectedValueDestination = value;
    destination = Marker(
        markerId: const MarkerId("destination"),
        infoWindow: const InfoWindow(title: "destination"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        position: LatLng(double.parse(value!.lat), double.parse(value.lang)));
    emit(Adding2NewOffer());
    final directions = await DirectionsRepository().getDirections(
        source: source!.position,
        destination: LatLng(double.parse(value.lat), double.parse(value.lang)));
    info = directions;
    emit(ChangePlacesDestination());
  }

  TextEditingController weightController = TextEditingController();
  TextEditingController qantityController = TextEditingController();
  TextEditingController valueOfGoodsController = TextEditingController();
  TextEditingController typeOfTuckController = TextEditingController();
  TextEditingController descOfTuckController = TextEditingController();

  bool checkBox = false;
  changeCheckBox() {
    checkBox = !checkBox;
    emit(ChangeCheckBoxValue());
  }

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

  addNewOrder(BuildContext context) async {
    emit(LoadingAddNewOrder());
    final response = await api.addNewOrder(
      description: descOfTuckController.text,
      from_warehouse: selectedValueSource!.id,
      image: imageFile!,
      qty: double.parse(qantityController.text),
      to_warehouse: selectedValueDestination!.id,
      type: typeOfTuckController.text,
      value: double.parse(valueOfGoodsController.text),
      weight: double.parse(weightController.text),
    );
    response.fold((l) => emit(ErrorAddNewOrder()), (r) {
      if (r.code == 200) {
        context.read<MainCubit>().ordersNotCompleted();
        successGetBar(r.message);

        typeOfTuckController.clear();
        weightController.clear();
        qantityController.clear();
        valueOfGoodsController.clear();
        descOfTuckController.clear();
        imageFile = null;
        checkBox = false;
        selectedValueSource = null;
        source = null;
        destination = null;
        info = null;
        selectedValueDestination = null;
        Navigator.pop(context);
        context.read<HomeCubit>().selectedIndex = 0;
        emit(LoadedAddNewOrder());
      } else {
        errorGetBar(r.message);
        emit(ErrorAddNewOrder());
      }
    });
  }

  // Future<void> moveMapCamera({required GoogleMapController controllers}) async {
  //   CameraPosition nepPos = CameraPosition(
  //     target: LatLng(lat, lng),
  //     zoom: 14,
  //   );

  //   final GoogleMapController controller = await controllers.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(nepPos));
  // }
}
