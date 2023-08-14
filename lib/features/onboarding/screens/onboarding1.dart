import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/utils/assets_manager.dart';
import 'package:nte/features/onboarding/cubit/onboarding_cubit.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        OnboardingCubit cubit = context.read<OnboardingCubit>();
        return Scaffold(
          body: Column(
            children: [
              const Spacer(flex: 2),
              Center(
                child: Image.asset(
                  ImageAssets.onBoarding1Image,
                  width: width / 1.4,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Container(
                height: height / 2.3,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    color: AppColors.yellow2,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.yellow1,
                          AppColors.yellow2,
                        ])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                     Text(
                      'our_app'.tr(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.5),
                      child: Text(
                        'only_app_connect'.tr(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w400,
                          height: 1.52,
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    //2 buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            cubit.pageController.animateToPage(2,
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.slowMiddle);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.blue1,
                                borderRadius: BorderRadius.circular(20)),
                            alignment: Alignment.center,
                            width: width * 0.3,
                            height: height * 0.05,
                            child:  Text(
                              "next".tr(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.loginRoute);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    width: 2, color: AppColors.blue1)),
                            alignment: Alignment.center,
                            width: width * 0.3,
                            height: height * 0.05,
                            child: Text(
                              "finish".tr(),
                              style: TextStyle(
                                color: AppColors.blue1,
                                fontSize: 20,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(
                      flex: 2,
                    ),
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
