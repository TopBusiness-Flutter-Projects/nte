import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nte/core/widgets/my_svg_widget.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/customappbar.dart';

class TruckDetailsScreen extends StatelessWidget {
  const TruckDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.buttonColor,
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
                  alignment: Alignment.topCenter,
                  children: [
                    Flexible(
                      child: Container(
                          margin: EdgeInsets.only(top: getSize(context) / 12),
                          alignment: Alignment.center,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft:
                                      Radius.circular(getSize(context) / 22),
                                  topRight:
                                      Radius.circular(getSize(context) / 22))),
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                      margin:
                                          EdgeInsets.all(getSize(context) / 16),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              getSize(context) / 22)),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            ImageAssets.carImage,
                                            fit: BoxFit.contain,
                                            height: getSize(context) / 2,
                                            width: getSize(context) / 2,
                                          ),
                                          Text(
                                            'شاحنة طويلة',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: AppColors.buttonColor,
                                              fontSize: getSize(context) / 24,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'رموك',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: AppColors.primary,
                                              fontSize: getSize(context) / 26,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )
                                        ],
                                      )),
                                  Positioned(
                                    right: getSize(context) / 12,
                                    top: getSize(context) / 12,
                                    child: Container(
                                      alignment: Alignment.topCenter,
                                      child: Column(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: MySvgWidget(
                                                  path: ImageAssets.editIcon,
                                                  imageColor: AppColors.primary,
                                                  size: getSize(context) / 18)),
                                          IconButton(
                                              //deleteIcon
                                              onPressed: () {},
                                              icon: MySvgWidget(
                                                  path: ImageAssets.deleteIcon,
                                                  imageColor: AppColors.primary,
                                                  size: getSize(context) / 18)),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getSize(context) / 22),
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'truck_gray_card'.tr(),
                                    style: TextStyle(
                                      fontSize: getSize(context) / 22,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),
                              Container(
                                margin: EdgeInsets.all(getSize(context) / 22),
                                height: getSize(context) / 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(ImageAssets.carImage),
                                    Image.asset(ImageAssets.carImage),
                                  ],
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getSize(context) / 22),
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'cabin_gray_card'.tr(),
                                    style: TextStyle(
                                      fontSize: getSize(context) / 22,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  )),
                              SizedBox(
                                height: getSize(context) / 3,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset(ImageAssets.carImage),
                                    Image.asset(ImageAssets.carImage),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: getSize(context) / 2,
                              )
                            ],
                          )),
                    ),
                    Positioned(
                      top: -10,
                      child: Container(
                          padding: EdgeInsets.all(getSize(context) / 66),
                          alignment: Alignment.center,
                          child: Text(
                            'truck_details'.tr(),
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
  }
}
