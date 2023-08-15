import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/my_svg_widget.dart';

class OrdersWidget extends StatelessWidget {
  const OrdersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(getSize(context) / 44),
      height: getSize(context) / 2.7,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 5,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(getSize(context) / 44),
              child: Row(
                children: [
                  Expanded(child: Image.asset('assets/images/onboarding1.png')),
                  Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                                  'transfer_day'.tr(),
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
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              '8/3/2023',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
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
                    const Text(
                      'الدار البيضاء',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: VerticalDivider(
                  thickness: 2,
                  color: AppColors.dividerColor,
                ),
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
                              path: ImageAssets.mapIcon,
                              imageColor: AppColors.primary,
                              size: getSize(context) / 22),
                          SizedBox(
                            width: getSize(context) / 66,
                          ),
                          Text(
                            'destination'.tr(),
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
                    const Text(
                      'الدار البيضاء',
                      textAlign: TextAlign.right,
                      style: TextStyle(
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
          )),
          SizedBox(height: getSize(context) / 66),
        ],
      ),
    );
  }
}
