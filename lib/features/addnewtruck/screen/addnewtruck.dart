import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nte/core/widgets/custom_button.dart';
import 'package:nte/features/addnewtruck/cubit/cubit.dart';
import 'package:nte/features/addnewtruck/cubit/state.dart';
import 'package:nte/features/addnewtruck/widgets/dropdownwidget.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/customappbar.dart';
import '../widgets/addwidget.dart';

class AddNewTruckScreen extends StatelessWidget {
  const AddNewTruckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewTruckCubit, AddNewTruckState>(
      builder: (context, state) {
        var cubit = context.read<AddNewTruckCubit>();
        return WillPopScope(
          onWillPop: () async {
            cubit.selectedValue = null;
            cubit.cabinSelectedValue = null;
            cubit.isVisiable = false;
            cubit.cabinIsVisiable = false;
            cubit.modelController.clear();
            Navigator.pop(context);
            return false;
          },
          child: SafeArea(
            child: Scaffold(
                backgroundColor: AppColors.buttonColor,
                body: Column(
                  children: [
                    Container(
                      height: getSize(context) / 3.2,
                      width: double.infinity,
                      color: AppColors.blue1,
                      child: CustomAppBar(isAddTruck: true),
                    ),
                    Flexible(
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Flexible(
                            child: Container(
                              margin:
                                  EdgeInsets.only(top: getSize(context) / 12),
                              alignment: Alignment.center,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          getSize(context) / 22),
                                      topRight: Radius.circular(
                                          getSize(context) / 22))),
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  SizedBox(height: getSize(context) / 100),
                                  CustomDropDownWidget(
                                      isTruck: true,
                                      listValue: cubit.truckType,
                                      selectedValue: cubit.selectedValue,
                                      title: 'truck_type'.tr()),
                                  Visibility(
                                      visible: cubit.isVisiable,
                                      child: CustomDropDownWidget(
                                        listValue: cubit.cabinType,
                                        selectedValue: cubit.cabinSelectedValue,
                                        title: 'cabin_type'.tr(),
                                      )),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: getSize(context) / 22,
                                        right: getSize(context) / 22,
                                        top: getSize(context) / 22),
                                    height: getSize(context) / 7,
                                    decoration: BoxDecoration(
                                        color: AppColors.greyColor,
                                        borderRadius: BorderRadius.circular(
                                            getSize(context) / 88)),
                                    child: TextField(
                                      controller: cubit.modelController,
                                      inputFormatters: <TextInputFormatter>[
                                        LengthLimitingTextInputFormatter(4),
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                        FilteringTextInputFormatter.digitsOnly
                                      ],
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: getSize(context) / 12),
                                        hintText: 'model'.tr(),
                                        hintStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: getSize(context) / 24,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w400,
                                        ),
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                            borderRadius: BorderRadius.circular(
                                                getSize(context) / 22)),
                                      ),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: getSize(context) / 22,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                  ),
                                  //truck image
                                  Container(
                                    margin:
                                        EdgeInsets.all(getSize(context) / 22),
                                    width: double.infinity,
                                    child: Text(
                                      'truck_image'.tr(),
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: getSize(context) / 22,
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  AddImageWidget(image: null),
                                  SizedBox(height: getSize(context) / 22),
                                  //البطاقة الرمادية للشاحنة
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: getSize(context) / 22,
                                        vertical: getSize(context) / 44),
                                    width: double.infinity,
                                    child: Text(
                                      'truck_gray_card'.tr(),
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: getSize(context) / 22,
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: getSize(context) / 22),
                                    width: double.infinity,
                                    child: Text(
                                      'please_add_images'.tr(),
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: getSize(context) / 24,
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: getSize(context) / 22),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      AddImageWidget(image: null),
                                      AddImageWidget(image: null),
                                    ],
                                  ),
                                  //add_new_truck
                                  SizedBox(height: getSize(context) / 22),
                                  //البطاقة الرمادية للمقصورة
                                  Visibility(
                                    visible: cubit.cabinIsVisiable,
                                    //hide like cabin
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: getSize(context) / 22,
                                              vertical: getSize(context) / 44),
                                          width: double.infinity,
                                          child: Text(
                                            'cabin_gray_card'.tr(),
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: getSize(context) / 22,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal:
                                                  getSize(context) / 22),
                                          width: double.infinity,
                                          child: Text(
                                            'please_add_images'.tr(),
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: getSize(context) / 24,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: getSize(context) / 22),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            AddImageWidget(image: null),
                                            AddImageWidget(image: null),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  /////
                                  SizedBox(height: getSize(context) / 12),
                                  CustomButton(
                                      paddingHorizontal: getSize(context) / 22,
                                      text: 'add_new_truck'.tr(),
                                      color: AppColors.buttonColor,
                                      onClick: () {}),
                                  SizedBox(height: getSize(context) / 2),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -10,
                            child: Container(
                                padding: EdgeInsets.all(getSize(context) / 66),
                                alignment: Alignment.center,
                                child: Text(
                                  'add_truck'.tr(),
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
