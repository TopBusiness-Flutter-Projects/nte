import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/getsize.dart';

class OrdersDetailsWidget extends StatelessWidget {
  OrdersDetailsWidget({required this.title, required this.price, super.key});
  String title;
  String price;
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
              decoration: BoxDecoration(
                  color: AppColors.greyColor,
                  borderRadius: BorderRadius.circular(getSize(context) / 100)),
              child: Text(
                price,
                maxLines: 1,
                overflow: TextOverflow.clip,
                style: TextStyle(
                  fontSize: getSize(context) / 22,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w400,
                ),
              ))
        ],
      ),
    );
  }
}
