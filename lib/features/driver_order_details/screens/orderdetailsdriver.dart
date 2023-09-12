import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/widgets/custom_button.dart';
import 'package:nte/core/widgets/my_svg_widget.dart';
import 'package:nte/features/driver_order_details/cubit/orderdetailsstate.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/customappbar.dart';
import '../../orderdetails/widget/driverdetails.dart';
import '../../orderdetails/widget/orderdetailswidget.dart';
import '../../orderdetails/widget/orderdetailswidgetdescription.dart';
import '../../orderdetails/widget/orderdetailswidgetinfo.dart';
import '../cubit/orderdetailscubit.dart';

class OrderDetailsDriver extends StatefulWidget {
  OrderDetailsDriver({required this.orderId, super.key});
  String orderId;
  @override
  State<OrderDetailsDriver> createState() => _OrderDetailsDriverState();
}

class _OrderDetailsDriverState extends State<OrderDetailsDriver> {
  @override
  void initState() {
    context.read<OrderDetailsDriverCubit>().orderDetails(widget.orderId);
    super.initState();
  }

  bool isLoading2 = false;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderDetailsDriverCubit, OrderDetailsDriverState>(
      listener: (context, state) {
        if (state is LoadingGetOrderDetailsDriver) {
          isLoading = true;
        } else if (state is LoadingUpdateOrderDetailsDriver) {
          isLoading2 = true;
        } else {
          isLoading2 = false;
          isLoading = false;
        }
      },
      builder: (context, state) {
        var cubit = context.read<OrderDetailsDriverCubit>();
        return SafeArea(
            child: Scaffold(
          backgroundColor: AppColors.secondPrimary2,
          body: Column(children: [
            Container(
              height: getSize(context) / 3.2,
              width: double.infinity,
              color: AppColors.blue1,
              child: CustomAppBar(
                isHome: false,
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
                        topRight: Radius.circular(getSize(context) / 22))),
                child: isLoading
                    ? Center(
                        child:
                            CircularProgressIndicator(color: AppColors.primary),
                      )
                    : cubit.orderDate == null
                        ? Center(
                            child: CircularProgressIndicator(
                                color: AppColors.primary),
                          )
                        : ListView(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: getSize(context) / 6,
                                    vertical: getSize(context) / 12),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        getSize(context) / 22)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      getSize(context) / 22),
                                  child: Image.network(
                                    cubit.orderDate!.image,
                                    fit: BoxFit.fitWidth,
                                    height: getSize(context) / 1.8,
                                    width: getSize(context) / 1.2,
                                  ),
                                ),
                              ),
                              CustomButton(
                                  paddingHorizontal: getSize(context) / 8,
                                  borderRadius: getSize(context) / 22,
                                  text: cubit.orderDate!.status == 'complete'
                                      ? 'is_paied'.tr()
                                      : cubit.orderDate!.status == 'waiting'
                                          ? 'waiting'.tr()
                                          : 'hanging'.tr(),
                                  color: AppColors.primary,
                                  onClick: () {
                                    cubit.orderDate!.status == 'complete'
                                        ? print(
                                            'complete') //it will requst of delete item and subit task arrived
                                        : cubit.orderDate!.status == 'hanging'
                                            ? showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius
                                                            .all(Radius.circular(
                                                                getSize(context) /
                                                                    32))),
                                                    title: Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: MySvgWidget(
                                                            path: ImageAssets
                                                                .closeIcon,
                                                            imageColor:
                                                                AppColors.red,
                                                            size: getSize(
                                                                    context) /
                                                                22),
                                                      ),
                                                    ),
                                                    content:
                                                        SingleChildScrollView(
                                                      child: ListBody(
                                                        children: <Widget>[
                                                          MySvgWidget(
                                                              path: ImageAssets
                                                                  .sureIcon,
                                                              imageColor:
                                                                  AppColors
                                                                      .greenColor,
                                                              size: getSize(
                                                                      context) /
                                                                  8),
                                                          Text(
                                                            'sure_submit'.tr(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              fontSize: getSize(
                                                                      context) /
                                                                  22,
                                                              fontFamily:
                                                                  'Cairo',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    actionsAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    actions: <Widget>[
                                                      InkWell(
                                                          onTap: () {
                                                            cubit.changeStatusOfOrderDriver(
                                                                orderId: cubit
                                                                    .orderDate!
                                                                    .id
                                                                    .toString(),
                                                                context:
                                                                    context);
                                                          },
                                                          child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        getSize(context) /
                                                                            22),
                                                            alignment: Alignment
                                                                .center,
                                                            width: getSize(
                                                                    context) /
                                                                3,
                                                            height: getSize(
                                                                    context) /
                                                                10,
                                                            decoration:
                                                                ShapeDecoration(
                                                              color: AppColors
                                                                  .greenColorLight,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                side: BorderSide(
                                                                    color: AppColors
                                                                        .greenColor,
                                                                    width: 1),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                        getSize(context) /
                                                                            32),
                                                              ),
                                                            ),
                                                            child: isLoading2
                                                                ? CircularProgressIndicator(
                                                                    color: AppColors
                                                                        .greenColor)
                                                                : Text(
                                                                    'sure'.tr(),
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppColors
                                                                          .greenColor,
                                                                      fontSize:
                                                                          getSize(context) /
                                                                              22,
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                    ),
                                                                  ),
                                                          )),
                                                    ],
                                                  );
                                                },
                                              )
                                            : print('waiting');
                                  }),
                              OrdersDetailsWidgetInfo(
                                qantity: cubit.orderDate!.quantity.toString(),
                                weight: cubit.orderDate!.weight.toString(),
                                title: 'truck_info'.tr(),
                                destination: cubit.orderDate!.toWarehouse.name,
                                source: cubit.orderDate!.fromWarehouse.name,
                              ),
                              OrdersDetailsWidget(
                                pathImage: ImageAssets.moneyIcon,
                                title: 'price'.tr(),
                                price: cubit.orderDate!.value.toString(),
                              ),
                              OrdersDetailsWidget(
                                pathImage: ImageAssets.trunckIcon,
                                title: 'qantity_type'.tr(),
                                price: cubit.orderDate!.type.toString(),
                              ),
                              OrdersDetailsWidgetDesc(
                                  title: 'description'.tr(),
                                  description: cubit.orderDate!.description),
                              (cubit.orderDate!.status == 'waiting' ||
                                      cubit.orderDate!.status == 'hanging')
                                  ? Container()
                                  : DriverInfo(
                                      title2: 'price_2'.tr(),
                                      path1: ImageAssets.moneyIcon,
                                      title: 'goods_info'.tr(),
                                      driverName: cubit
                                          .orderDate!.arrivalInformation!.price
                                          .toString(),
                                      date: cubit.orderDate!.arrivalInformation!
                                          .dateArrival),
                              SizedBox(height: getSize(context) / 22),
                            ],
                          ),
              ),
            )
          ]),
        ));
      },
    );
  }
}
