import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/my_svg_widget.dart';

class DriverInfoWaiting extends StatelessWidget {
  DriverInfoWaiting({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getSize(context) / 1.3,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
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
          ),
          Expanded(
            flex: 3,
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
                  children: [
                    Flexible(
                      child: MySvgWidget(
                          path: ImageAssets.lockIcon,
                          imageColor: AppColors.primary,
                          size: getSize(context) / 8),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: getSize(context) / 44,
                            horizontal: getSize(context) / 22),
                        alignment: Alignment.centerRight,
                        child: Text(
                          'pay_msg'.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: getSize(context) / 22,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                    Material(
                      elevation: 5,
                      borderRadius:
                          BorderRadius.circular(getSize(context) / 32),
                      child: Container(
                          alignment: Alignment.center,
                          height: getSize(context) / 10,
                          width: getSize(context) / 3,
                          decoration: BoxDecoration(
                              color: AppColors.secondPrimary2,
                              borderRadius:
                                  BorderRadius.circular(getSize(context) / 32)),
                          child: Text(
                            'pay_now'.tr(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: getSize(context) / 44,
                            horizontal: getSize(context) / 22),
                        alignment: Alignment.centerRight,
                        child: Text(
                          'pay_wait'.tr(),
                          style: TextStyle(
                            color: AppColors.redColor,
                            fontSize: getSize(context) / 24,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
