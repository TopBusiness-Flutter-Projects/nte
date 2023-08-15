import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/utils/app_colors.dart';

import '../../homescreen/cubit/cubit.dart';
import '../../homescreen/cubit/state.dart';

class MyTrunckScreen extends StatelessWidget {
  const MyTrunckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              body: Container(
            width: double.infinity,
            height: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: AppColors.white),
            child: Stack(
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
                                        color: AppColors.buttonColor),
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
                              color: Colors.white,
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
              ],
            ),
          )),
        );
      },
    );
  }
}
