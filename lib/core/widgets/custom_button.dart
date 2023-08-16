import 'package:flutter/material.dart';
import 'package:nte/core/utils/getsize.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.text,
      required this.color,
      required this.onClick,
      this.paddingHorizontal = 0,
      this.borderRadius = 8,
      this.textcolor = Colors.white})
      : super(key: key);
  final String text;
  final Color color;
  final Color textcolor;
  final double paddingHorizontal;
  final double? borderRadius;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
      ),
      child: InkWell(
        onTap: onClick,
        child: Container(
          width: getSize(context) / 1.5,
          height: getSize(context) / 8.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          child: Text(
            text,
            style: TextStyle(
                fontFamily: 'Cairo',
                color: textcolor,
                fontSize: getSize(context) / 20,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
