import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/utils/assets_manager.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:nte/core/widgets/customappbar.dart';
import 'package:nte/core/widgets/my_svg_widget.dart';

import '../../../config/routes/app_routes.dart';
import '../../homescreen/cubit/cubit.dart';
import '../../homescreen/cubit/state.dart';
import '../widgets/customitemwidget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              backgroundColor: AppColors.buttonColor,
              body: Column(
                children: [
                  Container(
                    height: getSize(context) / 3.2,
                    width: double.infinity,
                    color: AppColors.blue1,
                    child: CustomAppBar(isHome: true),
                  ),
                  Flexible(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Flexible(
                          child: Container(
                              margin:
                                  EdgeInsets.only(top: getSize(context) / 12),
                              alignment: Alignment.center,
                              // color: AppColors.white,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          getSize(context) / 22),
                                      topRight: Radius.circular(
                                          getSize(context) / 22))),
                              child: Column(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.all(getSize(context) / 88),
                                    height: getSize(context) / 4.5,
                                    decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                getSize(context) / 22),
                                            topRight: Radius.circular(
                                                getSize(context) / 22))),
                                    alignment: Alignment.bottomCenter,
                                    child: Row(
                                      children: [
                                        Text(
                                          'order_list'.tr(),
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                            color: AppColors.buttonColor,
                                            fontSize: getSize(context) / 22,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Spacer(),
                                        IconButton(
                                            onPressed: () {},
                                            icon: Image.asset(
                                              ImageAssets.filterImage,
                                            ))
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.circular(
                                              getSize(context) / 22)),
                                      child: ListView.builder(
                                        itemCount: 50,
                                        physics: const BouncingScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(context,
                                                    Routes.orderDetailsScreen);
                                              },
                                              child: const OrdersWidget());
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        Positioned(
                          child: Container(
                            padding: EdgeInsets.all(getSize(context) / 66),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(getSize(context) / 22)),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            alignment: Alignment.center,
                            width: getSize(context) / 1.5,
                            height: getSize(context) / 5.8,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Column(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'wallet'.tr(),
                                      style: TextStyle(
                                        color: AppColors.buttonColor,
                                        fontSize: getSize(context) / 24,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Cairo',
                                      ),
                                    )),
                                    Expanded(
                                      child: MySvgWidget(
                                          path: ImageAssets.walletIcon,
                                          imageColor: AppColors.primary,
                                          size: getSize(context) / 16),
                                    )
                                  ],
                                )),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'charage'.tr(),
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: AppColors.buttonColor,
                                        fontSize: getSize(context) / 24,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Cairo',
                                      ),
                                    )),
                                    Expanded(
                                        child: Text(
                                      '100',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: AppColors.buttonColor,
                                        fontSize: getSize(context) / 24,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ))
                                  ],
                                )),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'add_charage'.tr(),
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: AppColors.buttonColor,
                                        fontSize: getSize(context) / 24,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )),
                                    Expanded(
                                      child: MySvgWidget(
                                          path: ImageAssets.plusIcon,
                                          imageColor: AppColors.primary,
                                          size: getSize(context) / 16),
                                    )
                                  ],
                                )),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
