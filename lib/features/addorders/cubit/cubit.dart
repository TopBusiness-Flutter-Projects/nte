import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/addorders/cubit/direction_repository.dart';
import 'package:nte/features/addorders/cubit/state.dart';

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

  // drawLine() async {
  //   final directions = await DirectionsRepository().getDirections(
  //       source: source!.position, destination: destination!.position);
  //   info = directions;
  //   emit(Adding3NewOffer());
  // }
}
