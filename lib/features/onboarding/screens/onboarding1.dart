import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/utils/assets_manager.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:nte/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/widgets/my_svg_widget.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        OnboardingCubit cubit = context.read<OnboardingCubit>();
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            actions: [
              InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: getSize(context) / 44,
                        horizontal: getSize(context) / 44),
                    padding: EdgeInsets.symmetric(
                        vertical: getSize(context) / 100,
                        horizontal: getSize(context) / 32),
                    decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius:
                            BorderRadius.circular(getSize(context) / 44)),
                    child: Text(
                      'finish'.tr(),
                      style: TextStyle(
                          fontFamily: 'Cairo',
                          color: AppColors.white,
                          fontSize: getSize(context) / 22),
                    ),
                  ))
            ],
          ),
          body: Column(
            children: [
              SizedBox(height: getSize(context) / 44),
              SizedBox(
                height: getSize(context) / 22,
              ),
              Padding(
                padding: EdgeInsets.all(getSize(context) / 22),
                child: Image.asset(
                  ImageAssets.onbording1,
                  width: getSize(context) / 1.1,
                ),
              ),
              const Flexible(fit: FlexFit.tight, child: SizedBox()),
              Positioned(
                bottom: 0,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset(
                      ImageAssets.vector1,
                      width: double.infinity,
                    ),
                    Image.asset(
                      ImageAssets.vector2,
                      width: double.infinity,
                    ),
                    Column(
                      children: [
                        SizedBox(height: getSize(context) / 4),
                        Container(
                          padding: EdgeInsets.all(getSize(context) / 22),
                          alignment: Alignment.centerRight,
                          child: Text(
                            'our_app'.tr(),
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: getSize(context) / 18,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: getSize(context) / 22),
                          alignment: Alignment.centerRight,
                          child: Text(
                            'only_app_connect'.tr(),
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: getSize(context) / 22,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w600,
                              height: 1.52,
                            ),
                          ),
                          //only_app_connect
                        ),
                        SizedBox(height: getSize(context) / 12),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: getSize(context) / 22),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  cubit.pageController.animateToPage(2,
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      curve: Curves.slowMiddle);
                                },
                                child: CircleAvatar(
                                    backgroundColor: AppColors.white,
                                    radius: getSize(context) / 12,
                                    child: MySvgWidget(
                                        path: ImageAssets.arrowIcon,
                                        imageColor: AppColors.primary,
                                        size: getSize(context) / 12)),
                              ),
                              const Spacer(),
                              SmoothPageIndicator(
                                controller: cubit.pageController,
                                count: cubit.numPages,
                                effect: WormEffect(
                                  activeDotColor: AppColors.gray,
                                  dotColor: AppColors.white,
                                  dotHeight: getSize(context) / 44,
                                  dotWidth: getSize(context) / 44,
                                  type: WormType.underground,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Image.asset(
                                ImageAssets.copyRight2,
                                width: getSize(context) / 2.5,
                              ),
                            )),
                      ],
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
