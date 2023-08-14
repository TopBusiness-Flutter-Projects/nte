import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:nte/features/onboarding/screens/onboarding1.dart';
import 'package:nte/features/onboarding/screens/onboarding2.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        OnboardingCubit cubit = context.read<OnboardingCubit>();
        return OrientationBuilder(
          builder: (context, orientation) {
            SystemChrome.setPreferredOrientations(
                [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
            return Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  PageView(
                    controller: cubit.pageController,
                    reverse: true,
                    onPageChanged: (int page) {
                      cubit.onPageChanged(page);
                    },
                    children: const [
                      OnBoarding1(),
                      OnBoarding2(),
                    ],
                  ),
              Positioned(
                top:MediaQuery.of(context).size.height*.5 ,
              //  bottom: MediaQuery.of(context).size.height*.20,
                right: 0,
                left: 0,
                child:Center(
                  child: SmoothPageIndicator(
                    controller: cubit.pageController,
                    count: cubit.numPages,
                    effect:  WormEffect(
                      activeDotColor: AppColors.yellow2,
                      dotColor: AppColors.gray3,
                      dotHeight: 6,
                      dotWidth: 16,
                      type: WormType.underground,
                    ),
                  ),
                ),)
                  // here is the change
                  // Positioned(
                  //   bottom: 0,
                  //   right: 0,
                  //   left: 0,
                  //   child: Container(
                  //     height: height / 2.3,
                  //     decoration: BoxDecoration(
                  //         borderRadius: const BorderRadius.only(
                  //             topLeft: Radius.circular(50),
                  //             topRight: Radius.circular(50)),
                  //         color: AppColors.yellow2,
                  //         gradient: LinearGradient(
                  //             begin: Alignment.topCenter,
                  //             end: Alignment.bottomCenter,
                  //             colors: [
                  //               AppColors.yellow1,
                  //               AppColors.yellow2,
                  //             ])),
                  //     child: Column(
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         const Spacer(
                  //           flex: 1,
                  //         ),
                  //         cubit.currentPage ==0?
                  //         const Text(
                  //           'تطبيقنا',
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 22,
                  //             fontFamily: 'Cairo',
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ):
                  //         const Text(
                  //           'المناديب الشاحنات',
                  //           style: TextStyle(
                  //             color: Colors.white,
                  //             fontSize: 22,
                  //             fontFamily: 'Cairo',
                  //             fontWeight: FontWeight.w600,
                  //           ),
                  //         ),
                  //         const SizedBox(
                  //           height: 10,
                  //         ),
                  //
                  //          Padding(
                  //           padding: EdgeInsets.symmetric(horizontal: 10.5),
                  //           child: Text(
                  //             cubit.currentPage==0?
                  //             'التطبيق الاول الذى يربط بين صاحب الشحنة واصحاب النقل داخل وخارج البلاد':
                  //             "تقدم خدماتنا حلا شاملا لجميع احتياجات الشحن الخاص بك",
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //               fontSize: 17,
                  //               fontFamily: 'Cairo',
                  //               fontWeight: FontWeight.w400,
                  //               height: 1.52,
                  //             ),
                  //           ),
                  //         ),
                  //         const Spacer(
                  //           flex: 1,
                  //         ),
                  //         cubit.currentPage==0?
                  //         //2 buttons
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //           children: [
                  //             InkWell(
                  //               onTap: () {
                  //                 cubit.pageController.animateToPage(2, duration: Duration(milliseconds: 1000), curve: Curves.bounceOut);
                  //               },
                  //               child: Container(
                  //                 decoration: BoxDecoration(
                  //                     color: AppColors.blue1,
                  //                     borderRadius: BorderRadius.circular(20)),
                  //                 alignment: Alignment.center,
                  //                 width: width * 0.3,
                  //                 height: height * 0.05,
                  //                 child: const Text(
                  //                   "التالى",
                  //                   style: TextStyle(
                  //                     color: Colors.white,
                  //                     fontSize: 20,
                  //                     fontFamily: 'Cairo',
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             InkWell(
                  //               onTap: () {
                  //                 Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  //               },
                  //               child: Container(
                  //                 decoration: BoxDecoration(
                  //                     color: Colors.transparent,
                  //                     borderRadius: BorderRadius.circular(20),
                  //                     border: Border.all(width: 2, color: AppColors.blue1)),
                  //                 alignment: Alignment.center,
                  //                 width: width * 0.3,
                  //                 height: height * 0.05,
                  //                 child: Text(
                  //                   "انهاء",
                  //                   style: TextStyle(
                  //                     color: AppColors.blue1,
                  //                     fontSize: 20,
                  //                     fontFamily: 'Cairo',
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ):
                  //               InkWell(
                  //                 onTap: () {
                  //                   Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  //                 },
                  //                 child: Container(
                  //                   margin: EdgeInsets.symmetric(horizontal: 5),
                  //                   decoration: BoxDecoration(
                  //                       color: AppColors.blue1,
                  //                       borderRadius: BorderRadius.circular(20)),
                  //                   alignment: Alignment.center,
                  //                   width: width * 0.3,
                  //                   height: height * 0.05,
                  //                   child: const Text(
                  //                     "انضم الينا",
                  //                     style: TextStyle(
                  //                       color: Colors.white,
                  //                       fontSize: 20,
                  //                       fontFamily: 'Cairo',
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //         const Spacer(
                  //           flex: 2,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            );
          },
        );
      },
    );
  }
}
