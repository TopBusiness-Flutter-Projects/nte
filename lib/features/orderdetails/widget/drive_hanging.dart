import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/my_svg_widget.dart';

class DriverInfoHanging extends StatelessWidget {
  DriverInfoHanging({super.key, required this.title});
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
                  borderRadius: BorderRadius.circular(getSize(context) / 100)),
              child: Column(
                children: [
                  Expanded(
                    child: MySvgWidget(
                        path: ImageAssets.lockIcon,
                        imageColor: AppColors.primary,
                        size: getSize(context) / 14),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: getSize(context) / 44,
                            horizontal: getSize(context) / 22),
                        alignment: Alignment.center,
                        child: Text(
                          'pay_hanging'.tr(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: getSize(context) / 22,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w400,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
