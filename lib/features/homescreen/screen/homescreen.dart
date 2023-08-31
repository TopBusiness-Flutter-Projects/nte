import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:nte/features/homescreen/cubit/cubit.dart';
import 'package:nte/features/homescreen/cubit/state.dart';
import 'package:nte/features/addorders/screen/offersscreen.dart';
import 'package:nte/features/profile/screen/profilescreen.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/my_svg_widget.dart';
import '../../mainscreen/screen/mainscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> screens = const [
    MainScreen(),
    AddOrdersScreen(),
    // MyTrunckScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        return PersistentTabView(
          context,
          screens: screens,
          controller: _controller,
          items: [
            PersistentBottomNavBarItem(
              icon: MySvgWidget(
                  path: ImageAssets.ordersIcon,
                  imageColor: cubit.selectedIndex == 0
                      ? AppColors.primary
                      : AppColors.buttonColor,
                  size: getSize(context) / 18),
            ),
            PersistentBottomNavBarItem(
                activeColorPrimary: AppColors.primary,
                activeColorSecondary: AppColors.primary,
                contentPadding: 0,
                icon: Material(
                  elevation: 100,
                  shadowColor: AppColors.red,
                  color: AppColors.transparent,
                  type: MaterialType.circle,
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.add,
                      size: getSize(context) / 12,
                      color: AppColors.white,
                    ),
                  ),
                )),
            PersistentBottomNavBarItem(
              icon: MySvgWidget(
                  path: ImageAssets.profileIcon,
                  imageColor: cubit.selectedIndex == 1
                      ? AppColors.primary
                      : AppColors.buttonColor,
                  size: getSize(context) / 18),
            ),

            // PersistentBottomNavBarItem(
            //   icon: MySvgWidget(
            //       path: ImageAssets.profileIcon,
            //       imageColor: cubit.selectedIndex == 3
            //           ? AppColors.primary
            //           : AppColors.buttonColor,
            //       size: getSize(context) / 18),
            //   label: 'profile',
            // ),
          ],
          confineInSafeArea: true,
          backgroundColor: Colors.white,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          stateManagement: true,
          hideNavigationBarWhenKeyboardShows: true,
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),
          navBarStyle: NavBarStyle.style15,
        );
      },
    );

    ///home that have bottom Nav bar and all screens >> 4
  }
}
/*

BottomNavigationBar(
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
 */