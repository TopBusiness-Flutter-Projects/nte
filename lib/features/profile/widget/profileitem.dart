import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/getsize.dart';

class ClientProfileItem extends StatelessWidget {
  ClientProfileItem(
      {super.key,
      required this.title,
      this.desc,
      this.isString = true,
      this.color,
      this.onPressed,
      this.icon});
  String title;
  String? desc;
  bool isString;
  Color? color;
  Widget? icon;
  void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: getSize(context) / 6,
      margin: EdgeInsets.symmetric(
        horizontal: getSize(context) / 22,
        vertical: getSize(context) / 66,
      ),
      padding: EdgeInsets.all(getSize(context) / 22),
      decoration: BoxDecoration(
        color: AppColors.primary2,
        borderRadius: BorderRadius.circular(getSize(context) / 22),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: AppColors.black,
              fontSize: getSize(context) / 24,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
            ),
          ),
          Flexible(
              fit: FlexFit.loose,
              child: isString
                  ? Text(
                      desc!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: color ?? AppColors.primary,
                        fontSize: getSize(context) / 24,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  : icon != null
                      ? InkWell(
                          onTap: onPressed,
                          child: icon!,
                        )
                      : Container())
        ],
      ),
    );
  }
}
