import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/my_svg_widget.dart';
import 'package:dotted_line/dotted_line.dart';

class DriverInfo extends StatelessWidget {
  DriverInfo(
      {required this.driverName,
      required this.title,
      required this.date,
      super.key});
  String driverName;
  DateTime date;
  String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSize(context) / 2,
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: getSize(context) / 44,
                  horizontal: getSize(context) / 22),
              alignment: Alignment.centerRight,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: getSize(context) / 22,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.bold,
                ),
              )),
          Flexible(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: getSize(context) / 12),
                padding: EdgeInsets.symmetric(
                    vertical: getSize(context) / 44,
                    horizontal: getSize(context) / 18),
                alignment: Alignment.centerRight,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.primary2,
                    borderRadius:
                        BorderRadius.circular(getSize(context) / 100)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: getSize(context) / 100,
                          ),
                          Flexible(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      MySvgWidget(
                                          path: ImageAssets.identityIcon,
                                          imageColor: AppColors.primary,
                                          size: getSize(context) / 22),
                                      SizedBox(
                                        width: getSize(context) / 66,
                                      ),
                                      Text(
                                        'driver_name'.tr(),
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 16,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  driverName,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: getSize(context) / 24,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(getSize(context) / 44),
                      child: const DottedLine(),
                    ),

                    ////2
                    Flexible(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: getSize(context) / 100,
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      MySvgWidget(
                                          path: ImageAssets.dateIcon,
                                          imageColor: AppColors.primary,
                                          size: getSize(context) / 22),
                                      SizedBox(
                                        width: getSize(context) / 66,
                                      ),
                                      Text(
                                        'trasfer_date'.tr(),
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: AppColors.primary,
                                          fontSize: 16,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  DateFormat('yyyy-MM-dd hh:mm').format(date),
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: getSize(context) / 24,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
