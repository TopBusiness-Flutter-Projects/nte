import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Directions {
  final LatLngBounds? bounds;
  final List<PointLatLng>? polyLinePoints;
  final String? totalDistance;
  final String? totalDuration;

  Directions(
      {this.bounds,
      this.polyLinePoints,
      this.totalDistance,
      this.totalDuration});
  factory Directions.fromMap(Map<String, dynamic> map) {
    // Check if route is not available
    if ((map['routes'] as List).isEmpty) {}

    // Get route information
    final data = map['routes'] == null || (map['routes'] as List).isEmpty
        ? null
        : Map<String, dynamic>.from(map['routes'][0]);

    // Bounds
    final northeast = data == null ? null : data['bounds']['northeast'];
    final southwest = data == null ? null : data['bounds']['southwest'];
    final bounds = LatLngBounds(
      northeast: LatLng(northeast == null ? 0 : northeast['lat'] ?? 0,
          northeast == null ? 0 : northeast['lng'] ?? 0),
      southwest: LatLng(southwest == null ? 0 : southwest['lat'] ?? 0,
          southwest == null ? 0 : southwest['lng'] ?? 0),
    );

    // Distance & Duration
    String distance = '';
    String duration = '';
    if (data != null && (data['legs'] as List).isNotEmpty) {
      final leg = data['legs'][0];
      distance = leg['distance']['text'];
      duration = leg['duration']['text'];
    }

    return Directions(
      bounds: bounds,
      polyLinePoints: PolylinePoints().decodePolyline(
          data == null ? '' : data['overview_polyline']['points']),
      totalDistance: distance,
      totalDuration: duration,
    );
  }
}
