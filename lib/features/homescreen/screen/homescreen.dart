import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:nte/features/homescreen/cubit/cubit.dart';
import 'package:nte/features/homescreen/cubit/state.dart';
import 'package:nte/features/mytruck/screens/mytrunckscreen.dart';
import 'package:nte/features/offers/screen/offersscreen.dart';
import 'package:nte/features/profile/screen/profilescreen.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/my_svg_widget.dart';
import '../../mainscreen/screen/mainscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = const [
    MainScreen(),
    OffersScreen(),
    MyTrunckScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        return Scaffold(
          body: screens[cubit.selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 10,
            backgroundColor: AppColors.white,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: MySvgWidget(
                    path: ImageAssets.ordersIcon,
                    imageColor: cubit.selectedIndex == 0
                        ? AppColors.primary
                        : AppColors.buttonColor,
                    size: getSize(context) / 18),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: MySvgWidget(
                    path: ImageAssets.qouteIcon,
                    imageColor: cubit.selectedIndex == 1
                        ? AppColors.primary
                        : AppColors.buttonColor,
                    size: getSize(context) / 18),
                label: 'offers',
              ),
              BottomNavigationBarItem(
                icon: MySvgWidget(
                    path: ImageAssets.trunckIcon,
                    imageColor: cubit.selectedIndex == 2
                        ? AppColors.primary
                        : AppColors.buttonColor,
                    size: getSize(context) / 18),
                label: 'my trunck',
              ),
              BottomNavigationBarItem(
                icon: MySvgWidget(
                    path: ImageAssets.profileIcon,
                    imageColor: cubit.selectedIndex == 3
                        ? AppColors.primary
                        : AppColors.buttonColor,
                    size: getSize(context) / 18),
                label: 'profile',
              ),
            ],
            currentIndex: cubit.selectedIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.buttonColor,
            onTap: (index) {
              cubit.onChangeBottomNav(index);
            },
          ),
        );
      },
    );

    ///home that have bottom Nav bar and all screens >> 4
  }
}
