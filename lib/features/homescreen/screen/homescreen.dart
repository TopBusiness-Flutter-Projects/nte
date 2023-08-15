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

import '../../mainscreen/screen/mainscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = const [
    MainScreen(),
    MyTrunckScreen(),
    OffersScreen(),
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
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_text),
                label: 'offers',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fire_truck_outlined),
                label: 'my trunck',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
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
