import 'package:flutter/material.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/widgets/my_svg_widget.dart';

import '../../../core/utils/getsize.dart';

class OrdersDetailsWidget extends StatelessWidget {
  OrdersDetailsWidget(
      {required this.title,
      required this.price,
      required this.pathImage,
      super.key});
  String title;
  String price;
  String pathImage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: getSize(context) / 3,
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
          Container(
              margin: EdgeInsets.symmetric(horizontal: getSize(context) / 12),
              padding: EdgeInsets.symmetric(
                  vertical: getSize(context) / 44,
                  horizontal: getSize(context) / 18),
              alignment: Alignment.centerRight,
              width: double.infinity,
              decoration: ShapeDecoration(
                color: const Color(0x19FF9700),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                children: [
                  MySvgWidget(
                      path: pathImage,
                      imageColor: AppColors.primary,
                      size: getSize(context) / 22),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getSize(context) / 32),
                      child: Text(
                        price,
                        // maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: getSize(context) / 22,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
