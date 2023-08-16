import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/features/offers/screen/subscreens/completeoffers.dart';
import 'package:nte/features/offers/screen/subscreens/pendingoffers.dart';
import 'package:nte/features/offers/widget/offer_row.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/customappbar.dart';
import '../../homescreen/cubit/cubit.dart';
import '../../homescreen/cubit/state.dart';
import '../../tabcontrol/Screen/tabsScreen.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        return SafeArea(
          child: Scaffold(
              backgroundColor: AppColors.buttonColor,
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
                        Flexible(
                          child: Container(
                              margin:
                              EdgeInsets.only(top: getSize(context) / 12),
                              alignment: Alignment.center,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          getSize(context) / 22),
                                      topRight: Radius.circular(
                                          getSize(context) / 22))),
                              child: TabScreen(titles: ['completed_offers'.tr(),'pending_offers'.tr()], Screens: [CompletedOffers(),PendingOffers()],)
                             ),
                        ),
                    //title

                        Positioned(
                          top: -10,
                          child: Container(
                              padding: EdgeInsets.all(getSize(context) / 66),
                              alignment: Alignment.center,
                              child: Text(
                                'my_offers'.tr(),
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
