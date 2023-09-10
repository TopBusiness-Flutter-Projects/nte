import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/utils/assets_manager.dart';
import 'package:nte/core/widgets/custom_button.dart';
import 'package:nte/core/widgets/my_svg_widget.dart';
import 'package:nte/features/mainscreen/widgets/customitemwidget.dart';
import 'package:nte/features/mainscreen_driver/maincubit/mainstate.dart';

import '../../../core/models/ordersmodel.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/customappbar.dart';
import '../../driver_order_details/screens/orderdetailsdriver.dart';
import '../maincubit/maincubit.dart';

class MainScreenDriver extends StatefulWidget {
  const MainScreenDriver({super.key});

  @override
  State<MainScreenDriver> createState() => _MainScreenDriverState();
}

class _MainScreenDriverState extends State<MainScreenDriver> {
  bool isLoading = true;
  @override
  void initState() {
    context.read<MainOrderDriverCubit>().getMainOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainOrderDriverCubit, MainOrdersDriverState>(
      listener: (context, state) {
        if (state is LoadingGetMainOrders) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        var cubit = context.read<MainOrderDriverCubit>();
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.secondPrimary2,
            body: Column(
              children: [
                Container(
                  height: getSize(context) / 3.2,
                  width: double.infinity,
                  color: AppColors.blue1,
                  child: CustomAppBar(
                    isHome: true,
                    isDriver: true,
                  ),
                ),
                Flexible(
                  child: Container(
                      margin: EdgeInsets.only(top: getSize(context) / 12),
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(getSize(context) / 22),
                              topRight:
                                  Radius.circular(getSize(context) / 22))),
                      child: isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                  color: AppColors.primary),
                            )
                          : Column(
                              children: [
                                Container(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(
                                      right: getSize(context) / 44),
                                  margin: EdgeInsets.all(getSize(context) / 44),
                                  height: getSize(context) / 12,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'order_lists'.tr(),
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            color: AppColors.black,
                                            fontFamily: 'Cairo',
                                            fontWeight: FontWeight.w700,
                                            fontSize: getSize(context) / 20),
                                      ),
                                      const Spacer(),
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: InkWell(
                                          onTap: () {
                                            showModalBottomSheet(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        getSize(context) / 22),
                                                    topLeft: Radius.circular(
                                                        getSize(context) / 22)),
                                              ),
                                              context: context,
                                              builder: (context) {
                                                return BlocBuilder<
                                                    MainOrderDriverCubit,
                                                    MainOrdersDriverState>(
                                                  builder: (context, state) {
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: AppColors.white,
                                                        borderRadius: BorderRadius.only(
                                                            topRight: Radius
                                                                .circular(getSize(
                                                                        context) /
                                                                    22),
                                                            topLeft: Radius
                                                                .circular(getSize(
                                                                        context) /
                                                                    22)),
                                                      ),
                                                      height: getSize(context) /
                                                          1.5,
                                                      width: double.infinity,
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              alignment: Alignment
                                                                  .centerRight,
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    cubit.onCancel(
                                                                        context);
                                                                  },
                                                                  icon: MySvgWidget(
                                                                      path: ImageAssets
                                                                          .closeIcon,
                                                                      imageColor:
                                                                          AppColors
                                                                              .red,
                                                                      size: getSize(
                                                                              context) /
                                                                          22)),
                                                            ),
                                                            CustomButton(
                                                                borderRadius:
                                                                    getSize(context) /
                                                                        22,
                                                                text: 'waiting'
                                                                    .tr(),
                                                                color: cubit.currentFilterNum ==
                                                                        1
                                                                    ? AppColors
                                                                        .primary
                                                                    : AppColors
                                                                        .gray,
                                                                onClick: () {
                                                                  cubit.toggleToWaiting(
                                                                      'waiting');
                                                                }),
                                                            SizedBox(
                                                              height: getSize(
                                                                      context) /
                                                                  22,
                                                            ),
                                                            CustomButton(
                                                                borderRadius:
                                                                    getSize(context) /
                                                                        22,
                                                                text: 'pending'
                                                                    .tr(),
                                                                color: cubit.currentFilterNum ==
                                                                        2
                                                                    ? AppColors
                                                                        .primary
                                                                    : AppColors
                                                                        .gray,
                                                                onClick: () {
                                                                  cubit.toggleToHanging(
                                                                      'hanging');
                                                                }),
                                                            SizedBox(
                                                              height: getSize(
                                                                      context) /
                                                                  22,
                                                            ),
                                                            CustomButton(
                                                                borderRadius:
                                                                    getSize(context) /
                                                                        22,
                                                                text: 'search'
                                                                    .tr(),
                                                                color: AppColors
                                                                    .secondPrimary2,
                                                                onClick: () {
                                                                  cubit.onTapSubmit(
                                                                      context);
                                                                }),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          },
                                          child: MySvgWidget(
                                              path: ImageAssets.filterIcon,
                                              imageColor: AppColors.black,
                                              size: getSize(context) / 22),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Flexible(
                                    child: RefreshIndicator(
                                  onRefresh: () async {
                                    cubit.getMainOrders();
                                  },
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: cubit.orders.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    OrderDetailsDriver(
                                                        orderId: cubit
                                                            .orders[index].id
                                                            .toString()),
                                              ));
                                        },
                                        child: OrdersWidget(
                                          orderModelData: OrderModelData(
                                              id: cubit.orders[index].id,
                                              image: cubit.orders[index].image,
                                              type: cubit.orders[index].type,
                                              fromWarehouse: cubit
                                                  .orders[index].fromWarehouse,
                                              toWarehouse: cubit
                                                  .orders[index].toWarehouse,
                                              status:
                                                  cubit.orders[index].status,
                                              createdAt:
                                                  cubit.orders[index].createdAt,
                                              updatedAt: cubit
                                                  .orders[index].updatedAt),
                                        ),
                                      );
                                    },
                                  ),
                                ))
                              ],
                            )),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
