import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/allplaces.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/dialogs.dart';
import '../../../core/widgets/my_svg_widget.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import 'addorderwidget.dart';

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
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getSize(context) / 36),
                        child: DropdownButtonFormField2<AllPlacesModelData>(
                          autofocus: true,
                          isExpanded: true,
                          isDense: true,
                          alignment: Alignment.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
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
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: getSize(context) / 28,
                                fontFamily: 'Cairo'),
                          ),
                          items: cubit.cities
                              .map((item) =>
                                  DropdownMenuItem<AllPlacesModelData>(
                                    value: item,
                                    child: Text(
                                      item.name,
                                      style: TextStyle(
                                          fontSize: getSize(context) / 28,
                                          fontFamily: 'Cairo'),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'city_msg'.tr();
                            }
                            return null;
                          },
                          value:
                              cubit.cities.contains(cubit.selectedValueSource)
                                  ? cubit.selectedValueSource
                                  : null,
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
                            horizontal: getSize(context) / 36),
                        child: DropdownButtonFormField2<AllPlacesModelData>(
                          autofocus: true,
                          isExpanded: true,
                          isDense: true,
                          alignment: Alignment.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: getSize(context) / 44),
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
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: getSize(context) / 28,
                                fontFamily: 'Cairo'),
                          ),
                          items: cubit.cities
                              .map((item) =>
                                  DropdownMenuItem<AllPlacesModelData>(
                                    value: item,
                                    child: Text(
                                      item.name,
                                      style: TextStyle(
                                          fontSize: getSize(context) / 28,
                                          fontFamily: 'Cairo'),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'city_msg'.tr();
                            }
                            return null;
                          },
                          value: cubit.cities
                                  .contains(cubit.selectedValueDestination)
                              ? cubit.selectedValueDestination
                              : null,
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
                SizedBox(height: getSize(context) / 44),
                Row(
                  children: [
                    Addorderwidget(
                      maxLengthOfCharacter: 16,
                      title: 'weight'.tr(),
                      prefixWidget: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getSize(context) / 22),
                        child: MySvgWidget(
                            path: ImageAssets.weightIcon,
                            imageColor: AppColors.primary,
                            size: getSize(context) / 22),
                      ),
                      controller: cubit.weightController,
                      validatorMessage: 'weight_msg'.tr(),
                    ),
                    Addorderwidget(
                      maxLengthOfCharacter: 16,
                      title: 'qantity'.tr(),
                      prefixWidget: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getSize(context) / 22),
                        child: MySvgWidget(
                            path: ImageAssets.qantityIcon,
                            imageColor: AppColors.primary,
                            size: getSize(context) / 44),
                      ),
                      controller: cubit.qantityController,
                      validatorMessage: 'qantity_msg'.tr(),
                    ),
                  ],
                ),
                SizedBox(height: getSize(context) / 44),
                Row(
                  children: [
                    Addorderwidget(
                      maxLengthOfCharacter: 16,
                      title: 'price'.tr(),
                      prefixWidget: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: getSize(context) / 22),
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
                        padding: EdgeInsets.symmetric(
                            vertical: getSize(context) / 22),
                        child: MySvgWidget(
                            path: ImageAssets.trunckIcon,
                            imageColor: AppColors.primary,
                            size: getSize(context) / 44),
                      ),
                      controller: cubit.typeOfTuckController,
                      validatorMessage: 'truck_msg'.tr(),
                    ),
                  ],
                ),
                SizedBox(height: getSize(context) / 44),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
