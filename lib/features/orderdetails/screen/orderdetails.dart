import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/widgets/custom_button.dart';
import 'package:nte/core/widgets/my_svg_widget.dart';
import 'package:nte/features/homescreen/cubit/cubit.dart';
import 'package:nte/features/orderdetails/cubit/cubit.dart';
import 'package:nte/features/orderdetails/cubit/state.dart';
import 'package:nte/features/orderdetails/widget/orderdetailswidgetdescription.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/customappbar.dart';
import '../../homescreen/cubit/state.dart';
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
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      // isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (BuildContext context) {
        return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
          builder: (context, state) {
            return BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                var cubit = context.read<OrderDetailsCubit>();
                var controller = context.read<HomeCubit>();
                return Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: getSize(context) / 22,
                      right: getSize(context) / 22,
                      top: getSize(context) / 22),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                          getSize(context) / 22), // Adjust the radius as needed
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: MySvgWidget(
                                path: ImageAssets.closeIcon,
                                imageColor: AppColors.red,
                                size: getSize(context) / 16),
                          ),
                        ),
                        Text(
                          'send_offer'.tr(),
                          style: TextStyle(
                            fontSize: getSize(context) / 18,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: getSize(context) / 12),
                        TextFormField(
                          controller: cubit.sendOrderController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'enter_offer'.tr();
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      getSize(context) / 22))),
                        ),
                        SizedBox(height: getSize(context) / 12),
                        CustomButton(
                            borderRadius: getSize(context) / 12,
                            text: 'send'.tr(),
                            color: AppColors.buttonColor,
                            onClick: () {
                              controller.navToOrders(context);

                              ///Nav to offers
                            }),
                        SizedBox(height: getSize(context) / 12),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  @override
  void initState() {
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
                  Flexible(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Flexible(
                          child: isLoading
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
                                            Container(
                                              margin: EdgeInsets.all(
                                                  getSize(context) / 16),
                                              height: getSize(context) / 2,
                                              width: getSize(context) / 2,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          getSize(context) /
                                                              22)),
                                              child: Image.asset(
                                                ImageAssets.carImage,
                                                fit: BoxFit.contain,
                                              ),
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
                                              weight: cubit.orderdetails!.weight
                                                  .toString(),
                                              title: 'truck_info'.tr(),
                                              destination: cubit.orderdetails!
                                                  .toWarehouse.name,
                                              source: cubit.orderdetails!
                                                  .fromWarehouse.name,
                                            ),

                                            OrdersDetailsWidget(
                                              pathImage: ImageAssets.dateIcon,
                                              title: 'transfer_date'.tr(),
                                              price: cubit
                                                  .orderdetails!.createdAt
                                                  .toString(),
                                            ),
                                            OrdersDetailsWidget(
                                              pathImage: ImageAssets.trunckIcon,
                                              title: 'qantity_type'.tr(),
                                              price: cubit.orderdetails!.type
                                                  .toString(),
                                            ),
                                            OrdersDetailsWidgetDesc(
                                                title: 'description'.tr(),
                                                description: cubit
                                                    .orderdetails!.description),
                                            OrdersDetailsWidget(
                                              pathImage: ImageAssets.moneyIcon,
                                              title: 'price'.tr(),
                                              price: cubit.orderdetails!.price
                                                  .toString(),
                                            ),
                                            DriverInfo(
                                                title: 'driver_info'.tr(),
                                                driverName: cubit
                                                    .orderdetails!.driver.name,
                                                date: cubit.orderdetails!.driver
                                                    .dateArrival),
                                            SizedBox(
                                              height: getSize(context) / 8,
                                            )
                                          ],
                                        )),
                        ),
                        Positioned(
                          top: -10,
                          child: Container(
                              padding: EdgeInsets.all(getSize(context) / 66),
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
  }
}
