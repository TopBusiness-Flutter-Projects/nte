import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/utils/app_colors.dart';
import 'package:nte/core/widgets/my_svg_widget.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/customappbar.dart';
import '../../homescreen/cubit/cubit.dart';
import '../../homescreen/cubit/state.dart';

class MyTrunckScreen extends StatelessWidget {
  const MyTrunckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = context.read<HomeCubit>();
        return SafeArea(
          child: Scaffold(
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColors.primary,
                onPressed: () {},
                child: Icon(Icons.add, color: AppColors.white),
              ),
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
                              child: GridView.builder(
                                itemCount: 50,
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.all(getSize(context) / 22),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 1 / 1),
                                itemBuilder: (context, index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        flex: 6,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              getSize(context) / 22),
                                          child:
                                              Image.asset(ImageAssets.carImage),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 0,
                                              horizontal:
                                                  getSize(context) / 22),
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            'شاحنة طويلة',
                                            textAlign: TextAlign.right,
                                            style: TextStyle(
                                              color: AppColors.buttonColor,
                                              fontSize: getSize(context) / 24,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 0,
                                              horizontal:
                                                  getSize(context) / 22),
                                          child: Row(
                                            children: [
                                              Flexible(
                                                fit: FlexFit.tight,
                                                child: Text(
                                                  'رموك',
                                                  textAlign: TextAlign.right,
                                                  style: TextStyle(
                                                    color: AppColors.primary,
                                                    fontSize:
                                                        getSize(context) / 24,
                                                    fontFamily: 'Cairo',
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: MySvgWidget(
                                                      path: ImageAssets
                                                          .truckdetailsIcon,
                                                      imageColor:
                                                          AppColors.primary,
                                                      size: getSize(context) /
                                                          24))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(child: Container())
                                    ],
                                  );
                                },
                              )),
                        ),
                        Positioned(
                          top: -10,
                          child: Container(
                              padding: EdgeInsets.all(getSize(context) / 66),
                              alignment: Alignment.center,
                              child: Text(
                                'truck'.tr(),
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
