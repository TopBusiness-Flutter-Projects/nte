import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:nte/features/homescreen/cubit/cubit.dart';
import 'package:nte/features/homescreen/cubit/state.dart';
import 'package:nte/features/homescreen_driver/cubit/homecubit.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {this.isHome = false,
      this.isProfile = false,
      this.isEditProfile = false,
      this.isAddOrder = false,
      this.isDriver = false,
      super.key});
  bool isHome;
  bool isProfile;
  bool isEditProfile;
  bool isAddOrder;
  bool isDriver;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        return Container(
          width: double.infinity,
          height: double.infinity,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: AppColors.secondPrimary2),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: -getSize(context) / 6,
                top: -getSize(context) / 3.5,
                child: SizedBox(
                  width: getSize(context) * 2,
                  height: getSize(context),
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: getSize(context) * 2,
                          height: getSize(context),
                          child: Stack(
                            children: [
                              Positioned(
                                left: getSize(context) / 4,
                                top: getSize(context) / 2.5,
                                child: Container(
                                  width: getSize(context),
                                  height: getSize(context) / 3,
                                  decoration: BoxDecoration(
                                      color: AppColors.secondPrimary2),
                                ),
                              ),
                              //the left yellow oval
                              Positioned(
                                left: 0,
                                top: getSize(context) / 7,
                                child: Container(
                                  width: getSize(context) / 2.5,
                                  height: getSize(context) / 2.5,
                                  decoration: ShapeDecoration(
                                    color: AppColors.primary,
                                    shape: const OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: getSize(context) / 1.5,
                                top: 0,
                                child: SizedBox(
                                  width: getSize(context) / 1.5,
                                  height: getSize(context) / 2,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: getSize(context) / 2,
                                          height: getSize(context) / 2,
                                          decoration: const ShapeDecoration(
                                            color: Color(0x19E8B100),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: getSize(context) / 9,
                                        top: getSize(context) / 9.9,
                                        child: Container(
                                          width: getSize(context) / 3,
                                          height: getSize(context) / 3,
                                          decoration: const ShapeDecoration(
                                            color: Color(0x33E8B100),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: getSize(context) / 4.1,
                                        top: getSize(context) / 5.4,
                                        child: Container(
                                          width: getSize(context) / 5.1,
                                          height: getSize(context) / 5.1,
                                          decoration: ShapeDecoration(
                                            color: AppColors.primary,
                                            shape: const OvalBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: getSize(context) / 6,
                        top: getSize(context) / 1.5,
                        child: Container(
                          width: getSize(context) * 2,
                          height: getSize(context) / 3,
                          decoration: ShapeDecoration(
                            color: AppColors.secondPrimary2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              isProfile
                  ? Container()
                  : SizedBox(
                      height: getSize(context) / 7,
                      width: double.infinity,
                      child: Row(
                        children: [
                          SizedBox(width: getSize(context) / 66),
                          InkWell(
                            onTap: () {
                              isEditProfile
                                  ? Navigator.pop(context)
                                  : isDriver
                                      ? context
                                          .read<HomeDriverCubit>()
                                          .navToProfile(context)
                                      : cubit.navToProfile(context);
                            },
                            child: CircleAvatar(
                                backgroundColor: AppColors.greyColor,
                                child: Icon(
                                  Icons.person,
                                  color: AppColors.grayTextColor,
                                  size: getSize(context) / 16,
                                )),
                          ),
                          Flexible(
                            fit: FlexFit.tight,
                            child: InkWell(
                              onTap: () {
                                isDriver
                                    ? context
                                        .read<HomeDriverCubit>()
                                        .navToProfile(context)
                                    : cubit.navToProfile(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getSize(context) / 44),
                                child: Text(
                                  '${'welcome'.tr()} , ${cubit.profile == null ? '' : cubit.profile!.data!.name}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: getSize(context) / 22,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          isHome
                              ? Container()
                              : IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: AppColors.white,
                                  ),
                                )
                        ],
                      ),
                    )
            ],
          ),
        );
      },
    );
  }
}
