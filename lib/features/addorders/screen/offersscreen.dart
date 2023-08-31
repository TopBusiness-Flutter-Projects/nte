import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/customappbar.dart';
import '../../homescreen/cubit/cubit.dart';
import '../../homescreen/cubit/state.dart';

class AddOrdersScreen extends StatefulWidget {
  const AddOrdersScreen({super.key});

  @override
  State<AddOrdersScreen> createState() => _AddOrdersScreenState();
}

class _AddOrdersScreenState extends State<AddOrdersScreen> {
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
                              child: Container(
                                  //map
                                  )),
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
