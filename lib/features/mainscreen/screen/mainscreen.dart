import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:nte/core/widgets/customappbar.dart';
import 'package:nte/features/mainscreen/cubit/cubit.dart';
import 'package:nte/features/mainscreen/cubit/state.dart';

import '../subscreens/completeoffers.dart';
import '../subscreens/pendingoffers.dart';
import '../../tabcontrol/Screen/tabsScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    context.read<MainCubit>().ordersCompleted();
    context.read<MainCubit>().ordersNotCompleted();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        var controller = context.read<MainCubit>();
        return SafeArea(
          child: Scaffold(
              backgroundColor: AppColors.secondPrimary2,
              body: Column(
                children: [
                  Container(
                    height: getSize(context) / 3.2,
                    width: double.infinity,
                    color: AppColors.blue1,
                    child: CustomAppBar(isHome: true),
                  ),
                  Flexible(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                            margin: EdgeInsets.only(top: getSize(context) / 12),
                            alignment: Alignment.center,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(getSize(context) / 22),
                                    topRight: Radius.circular(
                                        getSize(context) / 22))),
                            child: Column(
                              children: [
                                Flexible(
                                  child: Container(
                                      margin: EdgeInsets.only(
                                          top: getSize(context) / 32),
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                getSize(context) / 22),
                                            topRight: Radius.circular(
                                                getSize(context) / 22)),
                                      ),
                                      child: RefreshIndicator(
                                        onRefresh: () async {
                                          controller.ordersCompleted();
                                          controller.ordersNotCompleted();
                                        },
                                        child: TabScreen(
                                          titles: [
                                            'completed_offers'.tr(),
                                            'pending_offers'.tr()
                                          ],
                                          Screens: const [
                                            CompletedOffers(),
                                            PendingOffers()
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            )),
                        Positioned(
                          top: -10,
                          child: Container(
                              padding: EdgeInsets.all(getSize(context) / 66),
                              alignment: Alignment.center,
                              child: Text(
                                'order_list'.tr(),
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: getSize(context) / 24,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w600,
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
