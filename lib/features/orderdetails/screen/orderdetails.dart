import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/widgets/custom_button.dart';
import 'package:nte/core/widgets/my_svg_widget.dart';
import 'package:nte/features/addorders/cubit/cubit.dart';
import 'package:nte/features/addorders/cubit/state.dart';
import 'package:nte/features/homescreen/cubit/cubit.dart';
import 'package:nte/features/orderdetails/cubit/cubit.dart';
import 'package:nte/features/orderdetails/cubit/state.dart';
import 'package:nte/features/orderdetails/widget/orderdetailswidgetdescription.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/customappbar.dart';
import '../../homescreen/cubit/state.dart';
import '../widget/drive_hanging.dart';
import '../widget/drive_waiting.dart';
import '../widget/driverdetails.dart';
import '../widget/orderdetailswidget.dart';
import '../widget/orderdetailswidgetinfo.dart';

class OrderDetailsScreen extends StatefulWidget {
  OrderDetailsScreen({required this.orderid, super.key});

  int orderid;

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  void initState() {
    context.read<OrderDetailsCubit>().orderdetails = null;
    context.read<OrderDetailsCubit>().orderDetails(widget.orderid.toString());
    super.initState();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderDetailsCubit, OrderDetailsState>(
      listener: (context, state) {
        if (state is LoadingGetOrderDetailsState) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        var cubit = context.read<OrderDetailsCubit>();
        return BlocBuilder<AddNewOrderCubit, AddNewOrderState>(
          builder: (context, state) {
            var cubit2 = context.read<AddNewOrderCubit>();
            return SafeArea(
              child: Scaffold(
                  backgroundColor: AppColors.secondPrimary2,
                  body: Column(
                    children: [
                      Container(
                        height: getSize(context) / 3.2,
                        width: double.infinity,
                        color: AppColors.blue1,
                        child: CustomAppBar(),
                      ),
                      Expanded(
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            isLoading
                                ? Center(
                                    child: CircularProgressIndicator(
                                        color: AppColors.primary),
                                  )
                                : cubit.orderdetails == null
                                    ? Center(
                                        child: CircularProgressIndicator(
                                            color: AppColors.primary),
                                      )
                                    : Container(
                                        margin: EdgeInsets.only(
                                            top: getSize(context) / 12),
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            color: AppColors.white,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    getSize(context) / 22),
                                                topRight: Radius.circular(
                                                    getSize(context) / 22))),
                                        child: cubit.orderdetails == null
                                            ? CircularProgressIndicator(
                                                color: AppColors.primary,
                                              )
                                            : ListView(
                                                physics:
                                                    const BouncingScrollPhysics(),
                                                children: [
                                                  Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.symmetric(
                                                            horizontal: getSize(
                                                                    context) /
                                                                6,
                                                            vertical: getSize(
                                                                    context) /
                                                                12),
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadius
                                                                .circular(getSize(
                                                                        context) /
                                                                    22)),
                                                        child: ClipRRect(
                                                          borderRadius: BorderRadius
                                                              .circular(getSize(
                                                                      context) /
                                                                  22),
                                                          child: Image.network(
                                                            cubit.orderdetails!
                                                                .image,
                                                            errorBuilder:
                                                                (BuildContext
                                                                        context,
                                                                    Object
                                                                        exception,
                                                                    StackTrace?
                                                                        stackTrace) {
                                                              return MySvgWidget(
                                                                  imageColor:
                                                                      AppColors
                                                                          .primary,
                                                                  path: ImageAssets
                                                                      .trunckIcon,
                                                                  size: getSize(
                                                                          context) /
                                                                      1);
                                                            },
                                                            fit:
                                                                BoxFit.fitWidth,
                                                            height: getSize(
                                                                    context) /
                                                                1.8,
                                                            width: getSize(
                                                                    context) /
                                                                1.2,
                                                          ),
                                                        ),
                                                      ),
                                                      cubit.orderdetails!
                                                                  .status ==
                                                              'hanging'
                                                          ? Positioned(
                                                              right: getSize(
                                                                      context) /
                                                                  24,
                                                              top: getSize(
                                                                      context) /
                                                                  12,
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    cubit.deleteOrder(
                                                                        context,
                                                                        cubit
                                                                            .orderdetails!
                                                                            .id);

                                                                    ///delete
                                                                    ///Navigator.pop(context);
                                                                  },
                                                                  icon: Icon(
                                                                    CupertinoIcons
                                                                        .delete,
                                                                    color: AppColors
                                                                        .primary,
                                                                  )))
                                                          : Container(),
                                                      cubit.orderdetails!.status ==
                                                              'hanging'
                                                          ? Positioned(
                                                              right: getSize(
                                                                      context) /
                                                                  24,
                                                              top: getSize(
                                                                      context) /
                                                                  5,
                                                              child: IconButton(
                                                                  onPressed:
                                                                      () {
                                                                    cubit2.onTapToEditOrder(
                                                                        context,
                                                                        cubit
                                                                            .orderdetails!);

                                                                    ///Navigator.Edit screen;
                                                                  },
                                                                  icon: MySvgWidget(
                                                                      path: ImageAssets
                                                                          .editIcon,
                                                                      imageColor:
                                                                          AppColors
                                                                              .primary,
                                                                      size: getSize(
                                                                              context) /
                                                                          16)))
                                                          : Container()
                                                    ],
                                                  ),
                                                  // CustomButton(
                                                  //     paddingHorizontal: getSize(context) / 8,
                                                  //     borderRadius: getSize(context) / 16,
                                                  //     text: 'submit_offer'.tr(),
                                                  //     color: AppColors.buttonColor,
                                                  //     onClick: () {
                                                  //       _showBottomSheet(
                                                  //         context,
                                                  //       );
                                                  //       //show botton sheet
                                                  //     }),

                                                  ///
                                                  ///
                                                  OrdersDetailsWidgetInfo(
                                                    qantity: cubit
                                                        .orderdetails!.quantity
                                                        .toString(),
                                                    weight: cubit
                                                        .orderdetails!.weight
                                                        .toString(),
                                                    title: 'truck_info'.tr(),
                                                    destination: cubit
                                                        .orderdetails!
                                                        .toWarehouse
                                                        .name,
                                                    source: cubit.orderdetails!
                                                        .fromWarehouse.name,
                                                  ),
                                                  OrdersDetailsWidget(
                                                    pathImage:
                                                        ImageAssets.moneyIcon,
                                                    title: 'price'.tr(),
                                                    price: cubit
                                                        .orderdetails!.value
                                                        .toString(),
                                                  ),

                                                  OrdersDetailsWidget(
                                                    pathImage:
                                                        ImageAssets.trunckIcon,
                                                    title: 'qantity_type'.tr(),
                                                    price: cubit
                                                        .orderdetails!.type
                                                        .toString(),
                                                  ),
                                                  OrdersDetailsWidgetDesc(
                                                      title: 'description'.tr(),
                                                      description: cubit
                                                          .orderdetails!
                                                          .description),
                                                  cubit.orderdetails!.price ==
                                                          null
                                                      ? Container()
                                                      : OrdersDetailsWidget(
                                                          pathImage: ImageAssets
                                                              .dateIcon,
                                                          title: 'price_2'.tr(),
                                                          price: cubit
                                                              .orderdetails!
                                                              .price
                                                              .toString(),
                                                        ),
                                                  cubit.orderdetails!.status ==
                                                          'complete'
                                                      ? DriverInfo(
                                                          title: 'driver_info'
                                                              .tr(),
                                                          driverName: cubit
                                                              .orderdetails!
                                                              .driver!
                                                              .name,
                                                          date: cubit
                                                              .orderdetails!
                                                              .driver!
                                                              .dateArrival)
                                                      : cubit.orderdetails!
                                                                  .status ==
                                                              'hanging'
                                                          ? DriverInfoHanging(
                                                              title:
                                                                  'driver_info'
                                                                      .tr())
                                                          : DriverInfoWaiting(
                                                              title:
                                                                  'driver_info'
                                                                      .tr()),

                                                  SizedBox(
                                                    height:
                                                        getSize(context) / 8,
                                                  )
                                                ],
                                              )),
                            Positioned(
                              top: -10,
                              child: Container(
                                  padding:
                                      EdgeInsets.all(getSize(context) / 66),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'order_details'.tr(),
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
      },
    );
  }
}
