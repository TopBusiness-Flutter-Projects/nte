import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nte/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:nte/features/onboarding/screens/onboarding1.dart';
import 'package:nte/features/onboarding/screens/onboarding2.dart';

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
                ],
              ),
            );
          },
        );
      },
    );
  }
}
