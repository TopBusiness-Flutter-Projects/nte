import 'dart:async';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nte/core/utils/assets_manager.dart';
import 'package:nte/core/widgets/custom_textfield.dart';
import 'package:nte/core/widgets/my_svg_widget.dart';
import 'package:nte/features/addorders/cubit/state.dart';
import '../../../core/models/allplaces.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/customappbar.dart';
import '../../../core/widgets/dialogs.dart';
import '../cubit/cubit.dart';
import '../widget/addorderwidget.dart';

class AddOrdersScreen extends StatefulWidget {
  const AddOrdersScreen({super.key});

  @override
  State<AddOrdersScreen> createState() => _AddOrdersScreenState();
}

class _AddOrdersScreenState extends State<AddOrdersScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    context.read<AddNewOrderCubit>().tabController =
        TabController(length: 2, vsync: this, initialIndex: 0);
    super.initState();
  }

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
    context.read<AddNewOrderCubit>().source = null;
    context.read<AddNewOrderCubit>().destination = null;
    context.read<AddNewOrderCubit>().info = null;

    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewOrderCubit, AddNewOrderState>(
      builder: (context, state) {
        var cubit = context.read<AddNewOrderCubit>();
        return DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: SafeArea(
            child: Scaffold(
                backgroundColor: AppColors.secondPrimary2,
                body: Column(
                  children: [
                    Container(
                      height: getSize(context) / 3.2,
                      width: double.infinity,
                      color: AppColors.blue1,
                      child: CustomAppBar(),
                    ),
                    Flexible(
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Flexible(
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: getSize(context) / 12),
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
                                              .map((e) => LatLng(
                                                  e.latitude, e.longitude))
                                              .toList(),
                                        ),
                                    },
                                    // onTap: (argument) {
                                    //   cubit.addMarker(argument);
                                    // },
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
                          Container(
                            margin: EdgeInsets.all(getSize(context) / 66),
                            padding: EdgeInsets.all(getSize(context) / 66),
                            height: MediaQuery.of(context).size.height / 2.5,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors.sheetColor,
                                borderRadius: BorderRadius.circular(
                                    getSize(context) / 22)),
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: cubit.tabController,
                              dragStartBehavior: DragStartBehavior.start,
                              children: [
                                const AddPageOne(),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: getSize(context) / 22,
                                    right: getSize(context) / 22,
                                  ),
                                  color: AppColors.sheetColor,
                                  child: Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: IconButton(
                                            onPressed: () {
                                              cubit.navigateToFirstTab(); //
                                            },
                                            icon: const Icon(Icons.arrow_back)),
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              height: getSize(context) / 3,
                                              decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                shadows: const [
                                                  BoxShadow(
                                                    color: Color(0x3F000000),
                                                    blurRadius: 8,
                                                    offset: Offset(0, 4),
                                                    spreadRadius: 0,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: getSize(context) / 32,
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              height: getSize(context) / 3,
                                              decoration: ShapeDecoration(
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      RadioListTile<String>(
                                          onChanged: (value) {},
                                          value: '',
                                          title: const Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'أوافق على ',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontFamily: 'Cairo',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'الشروط والأحكام ',
                                                  style: TextStyle(
                                                    color: Color(0xFFFF9700),
                                                    fontSize: 12,
                                                    fontFamily: 'Cairo',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'الخاصة بالشركة',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontFamily: 'Cairo',
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            textAlign: TextAlign.right,
                                          ),
                                          groupValue: '' //your group value,
                                          ),
                                      Flexible(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: getSize(context) / 44),
                                          child: CustomButton(
                                              width: getSize(context) / 1.4,
                                              text: "اضافة طلبية جديدة",
                                              color: AppColors.primary,
                                              borderRadius:
                                                  getSize(context) / 22,
                                              paddingHorizontal: 0,
                                              onClick: () {
                                                // if (_formKey.currentState!
                                                //     .validate()) {
                                                //   cubit.navigateToSecondTab();
                                                // } else {
                                                //   errorGetBar(
                                                //       'please enter data');
                                                // }

                                                ///validate and got to next screen
                                              }),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
          ),
        );
      },
    );
  }
}

class AddPageOne extends StatefulWidget {
  const AddPageOne({super.key});

  @override
  State<AddPageOne> createState() => _AddPageOneState();
}

class _AddPageOneState extends State<AddPageOne> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewOrderCubit, AddNewOrderState>(
      builder: (context, state) {
        var cubit = context.read<AddNewOrderCubit>();
        return Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getSize(context) / 32),
                        child: DropdownButtonFormField2<AllPlacesModelData>(
                          autofocus: true,
                          isExpanded: true,
                          isDense: true,
                          alignment: Alignment.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: getSize(context) / 44,
                                horizontal: getSize(context) / 44),
                            filled: true,
                            fillColor: AppColors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                getSize(context) / 22,
                              ),
                            ),

                            // Add more decoration..
                          ),
                          hint: Text(
                            'souurce'.tr(),
                            style: TextStyle(fontSize: getSize(context) / 22),
                          ),
                          items: cubit.cities
                              .map((item) =>
                                  DropdownMenuItem<AllPlacesModelData>(
                                    value: item,
                                    child: Text(
                                      item.name,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'city_msg'.tr();
                            }
                            return null;
                          },
                          onChanged: (value) {
                            cubit.onChangeSource(value);
                          },
                          onSaved: (value) {
                            cubit.onChangeSource(value);
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          iconStyleData: IconStyleData(
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: getSize(context) / 18,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getSize(context) / 32),
                        child: DropdownButtonFormField2<AllPlacesModelData>(
                          autofocus: true,
                          isExpanded: true,
                          isDense: true,
                          alignment: Alignment.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: getSize(context) / 44,
                                horizontal: getSize(context) / 44),
                            filled: true,
                            fillColor: AppColors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                getSize(context) / 22,
                              ),
                            ),

                            // Add more decoration..
                          ),
                          hint: Text(
                            'destination'.tr(),
                            style: TextStyle(fontSize: getSize(context) / 22),
                          ),
                          items: cubit.cities
                              .map((item) =>
                                  DropdownMenuItem<AllPlacesModelData>(
                                    value: item,
                                    child: Text(
                                      item.name,
                                      style: TextStyle(
                                        fontSize: getSize(context) / 22,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'city_msg'.tr();
                            }
                            return null;
                          },
                          onChanged: (value) {
                            cubit.onChangeDestination(value);
                          },
                          onSaved: (value) {
                            cubit.onChangeDestination(value);
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          iconStyleData: IconStyleData(
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: getSize(context) / 18,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Row(
                children: [
                  Addorderwidget(
                    title: 'weight'.tr(),
                    prefixWidget: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: getSize(context) / 22),
                      child: MySvgWidget(
                          path: ImageAssets.weightIcon,
                          imageColor: AppColors.primary,
                          size: getSize(context) / 22),
                    ),
                    controller: cubit.weightController,
                    validatorMessage: 'weight_msg'.tr(),
                  ),
                  Addorderwidget(
                    title: 'qantity'.tr(),
                    prefixWidget: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: getSize(context) / 22),
                      child: MySvgWidget(
                          path: ImageAssets.qantityIcon,
                          imageColor: AppColors.primary,
                          size: getSize(context) / 44),
                    ),
                    controller: cubit.qantityController,
                    validatorMessage: 'qantity_msg'.tr(),
                  ),
                ],
              )),
              Expanded(
                  child: Row(
                children: [
                  Addorderwidget(
                    title: 'price'.tr(),
                    prefixWidget: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: getSize(context) / 22),
                      child: MySvgWidget(
                          path: ImageAssets.moneyIcon,
                          imageColor: AppColors.primary,
                          size: getSize(context) / 22),
                    ),
                    controller: cubit.valueOfGoodsController,
                    validatorMessage: 'price_2_msg'.tr(),
                  ),
                  Addorderwidget(
                    textInputType: TextInputType.text,
                    title: 'truck_type'.tr(),
                    prefixWidget: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: getSize(context) / 22),
                      child: MySvgWidget(
                          path: ImageAssets.trunckIcon,
                          imageColor: AppColors.primary,
                          size: getSize(context) / 44),
                    ),
                    controller: cubit.typeOfTuckController,
                    validatorMessage: 'truck_msg'.tr(),
                  ),
                ],
              )),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: getSize(context) / 44),
                child: CustomButton(
                    width: getSize(context) / 1.4,
                    text: 'next'.tr(),
                    color: AppColors.primary,
                    borderRadius: getSize(context) / 22,
                    paddingHorizontal: 0,
                    onClick: () {
                      if (_formKey.currentState!.validate()) {
                        cubit.navigateToSecondTab();
                      } else {
                        errorGetBar('please enter data');
                      }

                      ///validate and got to next screen
                    }),
              )),
            ],
          ),
        );
      },
    );
  }
}
