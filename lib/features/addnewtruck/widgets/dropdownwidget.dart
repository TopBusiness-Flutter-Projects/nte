import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/features/addnewtruck/cubit/cubit.dart';
import 'package:nte/features/addnewtruck/cubit/state.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/my_svg_widget.dart';

class CustomDropDownWidget extends StatelessWidget {
  CustomDropDownWidget(
      {required this.listValue,
      this.selectedValue,
      this.isTruck = false,
      required this.title,
      super.key});
  String? selectedValue;
  List<String> listValue;
  String title;
  bool isTruck;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewTruckCubit, AddNewTruckState>(
      builder: (context, state) {
        var cubit = context.read<AddNewTruckCubit>();
        return Container(
          margin: EdgeInsets.all(getSize(context) / 22),
          height: getSize(context) / 7,
          child: DropdownButtonFormField2<String>(
            isExpanded: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.greyColor,
              contentPadding: EdgeInsets.all(getSize(context) / 22),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(getSize(context) / 88),
                  borderSide: BorderSide.none),
            ),
            hint: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: getSize(context) / 32,
                fontWeight: FontWeight.w400,
                fontFamily: 'Cairo',
              ),
            ),
            items: listValue
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: getSize(context) / 32,
                        ),
                      ),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'select_type'.tr();
              }
              return null;
            },
            onChanged: (value) {
              if (isTruck) {
                cubit.selectedValue = value;
                cubit.showCabinList();
              } else {
                cubit.cabinSelectedValue = value;
                cubit.showDataOfCabinList();
                //will be changed to controoll at items at last screen
              }
            },
            onSaved: (value) {
              selectedValue = value.toString();
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 8),
            ),
            iconStyleData: IconStyleData(
              icon: MySvgWidget(
                  path: ImageAssets.downIcon,
                  imageColor: AppColors.black,
                  size: getSize(context) / 22),
              iconSize: getSize(context) / 24,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(getSize(context) / 88),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        );
      },
    );
  }
}
