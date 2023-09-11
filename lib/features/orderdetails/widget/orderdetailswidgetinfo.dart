import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/my_svg_widget.dart';
import 'package:dotted_line/dotted_line.dart';

class OrdersDetailsWidgetInfo extends StatelessWidget {
  OrdersDetailsWidgetInfo(
      {required this.title,
      required this.source,
      required this.destination,
      required this.qantity,
      required this.weight,
      super.key});
  String title;
  String source;
  String destination;
  String weight;
  String qantity;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSize(context) / 1.8,
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
                  fontWeight: FontWeight.w700,
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
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      MySvgWidget(
                                          path: ImageAssets.homeIcon,
                                          imageColor: AppColors.primary,
                                          size: getSize(context) / 22),
                                      SizedBox(
                                        width: getSize(context) / 66,
                                      ),
                                      Text(
                                        'souurce'.tr(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                                  source,
                                  textAlign: TextAlign.right,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      MySvgWidget(
                                          path: ImageAssets.mapIcon,
                                          imageColor: AppColors.primary,
                                          size: getSize(context) / 22),
                                      SizedBox(
                                        width: getSize(context) / 66,
                                      ),
                                      Text(
                                        'destination'.tr(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                                  destination,
                                  textAlign: TextAlign.right,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColors.black,
                                    fontSize: 14,
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
                    Expanded(
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
                                          path: ImageAssets.weightIcon,
                                          imageColor: AppColors.primary,
                                          size: getSize(context) / 22),
                                      SizedBox(
                                        width: getSize(context) / 66,
                                      ),
                                      Text(
                                        'weight'.tr(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                                  weight,
                                  textAlign: TextAlign.right,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Row(
                                    children: [
                                      MySvgWidget(
                                          path: ImageAssets.qantityIcon,
                                          imageColor: AppColors.primary,
                                          size: getSize(context) / 22),
                                      SizedBox(
                                        width: getSize(context) / 66,
                                      ),
                                      Text(
                                        'qantity'.tr(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
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
                                  qantity,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.right,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
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
