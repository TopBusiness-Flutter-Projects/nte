import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/getsize.dart';

class CustomLoginApBar extends StatefulWidget {
  CustomLoginApBar(
      {this.isLogin = false,
      required this.subTitle,
      required this.title,
      this.onTap,
      super.key});
  bool isLogin;
  String title;
  String subTitle;
  void Function()? onTap;
  @override
  State<CustomLoginApBar> createState() => _CustomLoginApBarState();
}

class _CustomLoginApBarState extends State<CustomLoginApBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getSize(context),
      height: getSize(context) / 2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -250,
            left: -120,
            child: CircleAvatar(
              radius: getSize(context) / 2,
              backgroundColor: AppColors.secondPrimary,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              alignment: Alignment.center,
              width: getSize(context) / 1.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: getSize(context) / 44),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        child: Text(
                          widget.title,
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: getSize(context) / 22,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: getSize(context) / 8,
                        height: getSize(context) / 8,
                        child: widget.isLogin
                            ? Container()
                            : IconButton(
                                onPressed: widget.onTap,
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: AppColors.white,
                                )),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      widget.subTitle,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
