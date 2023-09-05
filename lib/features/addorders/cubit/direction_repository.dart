import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nte/.env.dart';

import '../../../core/models/directions_model.dart';

class DirectionsRepository {
  static const String _baseUrl =
      'https://maps.googleapis.com/maps/api/directions/json?';
  late Dio dio;

  DirectionsRepository({Dio? dio}) : dio = dio ?? Dio();

  Future<Directions> getDirections(
      {required LatLng source, required LatLng destination}) async {
    final response = await dio.get(_baseUrl, queryParameters: {
      'origin': '${source.latitude},${source.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
      'key': googleMapKey
    });
    print(response.statusCode);
    print('..............................');
    if (response.statusCode == 200) {
      print(response.data);
      return Directions.fromMap(response.data);
    } else {
      return Directions();
    }
  }
}
