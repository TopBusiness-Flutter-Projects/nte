import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/widgets/custom_button.dart';
import 'package:nte/core/widgets/my_svg_widget.dart';
import 'package:nte/features/orderdetails/cubit/cubit.dart';
import 'package:nte/features/orderdetails/widget/orderdetailswidgetdescription.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/customappbar.dart';
import '../cubit/state.dart';
import '../widget/orderdetailswidget.dart';
import '../widget/orderdetailswidgetinfo.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});
  void _showBottomSheet(BuildContext context, String msg) {
    showModalBottomSheet(
      // isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (BuildContext context) {
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
                  controller:
                      context.read<OrderDetailsCubit>().sendOrderController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'please send offer';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(getSize(context) / 22))),
                ),
                SizedBox(height: getSize(context) / 12),
                CustomButton(
                    borderRadius: getSize(context) / 12,
                    text: 'send'.tr(),
                    color: AppColors.buttonColor,
                    onClick: () {}),
                SizedBox(height: getSize(context) / 12),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        var cubit = context.read<OrderDetailsCubit>();
        return SafeArea(
          child: Scaffold(
              backgroundColor: AppColors.buttonColor,
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
                              child: ListView(
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.all(getSize(context) / 16),
                                    height: getSize(context) / 2,
                                    width: getSize(context) / 2,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            getSize(context) / 22)),
                                    child: Image.asset(
                                      ImageAssets.carImage,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  CustomButton(
                                      paddingHorizontal: getSize(context) / 8,
                                      borderRadius: getSize(context) / 16,
                                      text: 'submit_offer'.tr(),
                                      color: AppColors.buttonColor,
                                      onClick: () {
                                        _showBottomSheet(
                                            context, 'enter your offer');
                                        //show botton sheet
                                      }),

                                  ///
                                  ///
                                  OrdersDetailsWidget(
                                    title: 'price'.tr(),
                                    price: '7500',
                                  ),
                                  OrdersDetailsWidget(
                                    title: 'transfer_date'.tr(),
                                    price: '8/3/2023',
                                  ),
                                  OrdersDetailsWidgetInfo(
                                    title: 'truck_info'.tr(),
                                    destination: "شبين الكوم",
                                    source: "القاهره",
                                  ),
                                  OrdersDetailsWidgetDesc(
                                      title: 'description'.tr(),
                                      description: 'فياج خفيف\nسلعة كلينيكس'),
                                  SizedBox(
                                    height: getSize(context) / 2,
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
