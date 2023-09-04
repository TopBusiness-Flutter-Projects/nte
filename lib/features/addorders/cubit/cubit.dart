import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/addorders/cubit/direction_repository.dart';
import 'package:nte/features/addorders/cubit/state.dart';

import '../../../core/models/directions_model.dart';

class AddNewOrderCubit extends Cubit<AddNewOrderState> {
  AddNewOrderCubit(this.api) : super(AddNewOrderInitial());
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
      emit(Adding3NewOffer());
    }
  }
}
