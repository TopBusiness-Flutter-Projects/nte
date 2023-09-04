import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nte/core/models/directions_model.dart';
import 'package:nte/features/addorders/cubit/state.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/customappbar.dart';
import '../../homescreen/cubit/cubit.dart';
import '../../homescreen/cubit/state.dart';
import '../cubit/cubit.dart';
import '../cubit/direction_repository.dart';

class AddOrdersScreen extends StatefulWidget {
  const AddOrdersScreen({super.key});

  @override
  State<AddOrdersScreen> createState() => _AddOrdersScreenState();
}

class _AddOrdersScreenState extends State<AddOrdersScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.774265, 46.738586),
    zoom: 14.4746,
  );

  late GoogleMapController _googleMapController;

  // Marker? source;
  // Marker? destination;

  // Directions? info;
  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewOrderCubit, AddNewOrderState>(
      builder: (context, state) {
        var cubit = context.read<AddNewOrderCubit>();
        return SafeArea(
          child: Scaffold(
              backgroundColor: AppColors.secondPrimary2,
              body: Column(
                children: [
                  Container(
                    height: getSize(context) / 3.2,
                    width: double.infinity,
                    color: AppColors.blue1,
                    child: CustomAppBar(isHome: true),
                  ),
                  Flexible(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.only(top: getSize(context) / 12),
                            alignment: Alignment.center,
                            width: double.infinity,
                            color: AppColors.white,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                GoogleMap(
                                  myLocationButtonEnabled: false,
                                  zoomControlsEnabled: false,
                                  mapType: MapType.normal,
                                  initialCameraPosition: _kGooglePlex,
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    _googleMapController = controller;
                                    _controller.complete(controller);
                                  },
                                  markers: {
                                    if (cubit.source != null) cubit.source!,
                                    if (cubit.destination != null)
                                      cubit.destination!,
                                  },
                                  polylines: {
                                    if (cubit.info != null)
                                      Polyline(
                                        polylineId: const PolylineId(
                                            'overview_polyline'),
                                        color: Colors.red,
                                        width: 5,
                                        points: cubit.info!.polyLinePoints!
                                            .map((e) =>
                                                LatLng(e.latitude, e.longitude))
                                            .toList(),
                                      ),
                                  },
                                  onTap: (argument) {
                                    cubit.addMarker(argument);
                                  },
                                ),
                                if (cubit.info != null)
                                  Positioned(
                                    top: 20.0,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 6.0,
                                        horizontal: 12.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.yellowAccent,
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 2),
                                            blurRadius: 6.0,
                                          )
                                        ],
                                      ),
                                      child: Text(
                                        '${cubit.info!.totalDistance}, ${cubit.info!.totalDuration}',
                                        style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        //title

                        Positioned(
                          top: -10,
                          child: Container(
                              padding: EdgeInsets.all(getSize(context) / 66),
                              alignment: Alignment.center,
                              child: Text(
                                'my_offers'.tr(),
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: getSize(context) / 24,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}