import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/core/models/ordersmodel.dart';
import 'package:nte/features/driver_order_details/screens/orderdetailsdriver.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/customappbar.dart';
import '../../mainscreen/widgets/customitemwidget.dart';
import '../cubit/completedordercubit.dart';
import '../cubit/completedorderdriverstate.dart';

class CompletedOrdersDriver extends StatefulWidget {
  const CompletedOrdersDriver({super.key});

  @override
  State<CompletedOrdersDriver> createState() => _CompletedOrdersDriverState();
}

class _CompletedOrdersDriverState extends State<CompletedOrdersDriver> {
  @override
  void initState() {
    context.read<CompletedOrderDriverCubit>().ordersCompletedDriver();
    super.initState();
  }

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompletedOrderDriverCubit, CompletedOrderDriverState>(
      listener: (context, state) {
        if (state is LoadingGetCpmpleted) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        var cubit = context.read<CompletedOrderDriverCubit>();
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
                                  child: Text(
                                    'completed_order'.tr(),
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: getSize(context) / 20,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: ListView.builder(
                                    itemCount: cubit.completedOrders.length,
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    OrderDetailsDriver(
                                                        orderId: cubit
                                                            .completedOrders[
                                                                index]
                                                            .id
                                                            .toString()),
                                              ));
                                        },
                                        child: OrdersWidget(
                                          orderModelData: OrderModelData(
                                              id: cubit
                                                  .completedOrders[index].id,
                                              image: cubit
                                                  .completedOrders[index].image,
                                              type: cubit
                                                  .completedOrders[index].type,
                                              fromWarehouse: cubit
                                                  .completedOrders[index]
                                                  .fromWarehouse,
                                              toWarehouse: cubit
                                                  .completedOrders[index]
                                                  .toWarehouse,
                                              status: cubit
                                                  .completedOrders[index]
                                                  .status,
                                              createdAt: cubit
                                                  .completedOrders[index]
                                                  .createdAt,
                                              updatedAt: cubit
                                                  .completedOrders[index]
                                                  .updatedAt),
                                        ),
                                      );
                                    },
                                  ),
                                )
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
