import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/widgets/custom_button.dart';
import 'package:nte/core/widgets/my_svg_widget.dart';
import 'package:nte/features/mytruck/cubit/cubit.dart';
import 'package:nte/features/mytruck/cubit/state.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/customappbar.dart';

class MyTrunckScreen extends StatelessWidget {
  const MyTrunckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TruckCubit, TruckState>(
      builder: (context, state) {
        var cubit = context.read<TruckCubit>();
        return SafeArea(
          child: Scaffold(
              floatingActionButton: cubit.trucks.isEmpty
                  ? Container()
                  : FloatingActionButton(
                      backgroundColor: AppColors.primary,
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.addNewTruck);
                      },
                      child: Icon(Icons.add, color: AppColors.white),
                    ),
              backgroundColor: AppColors.buttonColor,
              body: cubit.trucks.isEmpty
                  ? Column(
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
                                    margin: EdgeInsets.only(
                                        top: getSize(context) / 12),
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                getSize(context) / 22),
                                            topRight: Radius.circular(
                                                getSize(context) / 22))),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            ImageAssets.truckEmptyImage,
                                            width: getSize(context) / 2.5,
                                          ),
                                          SizedBox(
                                              height: getSize(context) / 22),
                                          Text(
                                            'no_truck'.tr(),
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: getSize(context) / 18,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(
                                              height: getSize(context) / 22),
                                          CustomButton(
                                              paddingHorizontal:
                                                  getSize(context) / 12,
                                              text: 'add_new_truck'.tr(),
                                              color: AppColors.buttonColor,
                                              onClick: () {
                                                Navigator.pushNamed(context,
                                                    Routes.addNewTruck);
                                              })
                                        ],
                                      ),
                                    )),
                              ),
                              Positioned(
                                top: -10,
                                child: Container(
                                    padding:
                                        EdgeInsets.all(getSize(context) / 66),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'truck'.tr(),
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
                    )
                  : Column(
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
                                    margin: EdgeInsets.only(
                                        top: getSize(context) / 12),
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                getSize(context) / 22),
                                            topRight: Radius.circular(
                                                getSize(context) / 22))),
                                    child: GridView.builder(
                                      itemCount: cubit.trucks.length,
                                      physics: const BouncingScrollPhysics(),
                                      padding: EdgeInsets.symmetric(
                                          vertical: getSize(context) / 22,
                                          horizontal: getSize(context) / 66),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 1),
                                      itemBuilder: (context, index) {
                                        ///WILL EXTRACT THIS WIDGET AFTER MAKE MODEL
                                        return InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                Routes.truckDetailsScreen);
                                          },
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getSize(context) /
                                                              32),
                                                  child: Image.asset(
                                                      ImageAssets.carImage),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        getSize(context) / 16),
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  'شاحنة طويلة',
                                                  textAlign: TextAlign.right,
                                                  maxLines: 2,
                                                  overflow: TextOverflow.fade,
                                                  style: TextStyle(
                                                    color:
                                                        AppColors.buttonColor,
                                                    fontSize:
                                                        getSize(context) / 24,
                                                    fontFamily: 'Cairo',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        getSize(context) / 16),
                                                child: Row(
                                                  children: [
                                                    Flexible(
                                                      fit: FlexFit.tight,
                                                      child: Text(
                                                        'رموك',
                                                        textAlign:
                                                            TextAlign.right,
                                                        maxLines: 1,
                                                        overflow:
                                                            TextOverflow.fade,
                                                        style: TextStyle(
                                                          color:
                                                              AppColors.primary,
                                                          fontSize:
                                                              getSize(context) /
                                                                  24,
                                                          fontFamily: 'Cairo',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: MySvgWidget(
                                                            path: ImageAssets
                                                                .truckdetailsIcon,
                                                            imageColor:
                                                                AppColors
                                                                    .primary,
                                                            size: getSize(
                                                                    context) /
                                                                24))
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    )),
                              ),
                              Positioned(
                                top: -10,
                                child: Container(
                                    padding:
                                        EdgeInsets.all(getSize(context) / 66),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'truck'.tr(),
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
