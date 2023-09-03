import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/models/ordersmodel.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/my_svg_widget.dart';

class OrdersWidget extends StatelessWidget {
//////
  OrdersWidget({required this.orderModelData, super.key});
  OrderModelData orderModelData;

  @override
  Widget build(BuildContext context) {
    bool isAr =
        EasyLocalization.of(context)!.currentLocale!.languageCode == 'ar';

    return Container(
      margin: EdgeInsets.all(getSize(context) / 44),
      height: getSize(context) / 2.6,
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
                  Expanded(child: Image.network(orderModelData.image)),
                  SizedBox(width: getSize(context) / 44),
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
                                    path: ImageAssets.trunckIcon,
                                    imageColor: AppColors.primary,
                                    size: getSize(context) / 22),
                                SizedBox(
                                  width: getSize(context) / 66,
                                ),
                                Text(
                                  'transfer_type'.tr(),
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 16,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Flexible(
                                    fit: FlexFit.tight, child: Container()),
                                orderModelData.status == 'complete'
                                    ? Container()
                                    : Container(
                                        height: getSize(context) / 16,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: getSize(context) / 32,
                                            vertical: 0),
                                        alignment: Alignment.center,
                                        decoration: ShapeDecoration(
                                          color: const Color(0x66FF9700),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                        ),
                                        child: Text(
                                          isAr
                                              ? orderModelData.status ==
                                                      'waiting'
                                                  ? 'فى انتظار الدفع'
                                                  : 'معلقة'
                                              : orderModelData.status ==
                                                      'waiting'
                                                  ? "waiting"
                                                  : "hanging",
                                          style: TextStyle(
                                              fontSize: getSize(context) / 28,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.primary),
                                        ),
                                      )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              orderModelData.type,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: getSize(context) / 24,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
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
                width: getSize(context) / 22,
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
                    Text(
                      orderModelData.fromWarehouse.name,
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
                    Text(
                      orderModelData.toWarehouse.name,
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
          )),
          SizedBox(height: getSize(context) / 44),
        ],
      ),
    );
  }
}
