import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:nte/features/homescreen/cubit/cubit.dart';
import 'package:nte/features/homescreen/cubit/state.dart';

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
                left: -56,
                top: -100,
                child: SizedBox(
                  width: 496,
                  height: 366,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 496,
                          height: 290,
                          child: Stack(
                            children: [
                              Positioned(
                                left: 56,
                                top: 100,
                                child: Container(
                                  width: 430,
                                  height: 190,
                                  decoration: BoxDecoration(
                                      color: AppColors.secondPrimary2),
                                ),
                              ),
                              //the left yellow oval
                              Positioned(
                                left: 0,
                                top: 52,
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: ShapeDecoration(
                                    color: AppColors.primary,
                                    shape: const OvalBorder(),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 296,
                                top: 0,
                                child: SizedBox(
                                  width: 200,
                                  height: 188,
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left: 0,
                                        top: 0,
                                        child: Container(
                                          width: 200,
                                          height: 188,
                                          decoration: const ShapeDecoration(
                                            color: Color(0x19E8B100),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 40,
                                        top: 34,
                                        child: Container(
                                          width: 120,
                                          height: 120,
                                          decoration: const ShapeDecoration(
                                            color: Color(0x33E8B100),
                                            shape: OvalBorder(),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 88,
                                        top: 65,
                                        child: Container(
                                          width: 70,
                                          height: 70,
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
                        left: 56,
                        top: 265,
                        child: Container(
                          width: 430,
                          height: 101,
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
                                  : cubit.navToProfile(context, isDriver);
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
                                cubit.navToProfile(context, isDriver);
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getSize(context) / 44),
                                child: Text(
                                  '${'welcome'.tr()} , ${cubit.profile == null ? '' : cubit.profile!.data!.name}',
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
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
