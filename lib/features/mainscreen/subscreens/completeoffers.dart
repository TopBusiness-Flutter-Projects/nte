import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/features/mainscreen/cubit/cubit.dart';
import 'package:nte/features/mainscreen/cubit/state.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/getsize.dart';

import '../../orderdetails/screen/orderdetails.dart';
import '../widgets/customitemwidget.dart';

class CompletedOffers extends StatefulWidget {
  const CompletedOffers({super.key});

  @override
  State<CompletedOffers> createState() => _CompletedOffersState();
}

class _CompletedOffersState extends State<CompletedOffers> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        if (state is LoadingGetOrderComplete) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        var controller = context.read<MainCubit>();
        return RefreshIndicator(
          onRefresh: () async {
            controller.ordersCompleted();
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(getSize(context) / 22)),
            child: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  )
                : ListView.builder(
                    itemCount: controller.completedOrder.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderDetailsScreen(
                                          orderid: controller
                                              .completedOrder[index].id,
                                        )));
                          },
                          child: OrdersWidget(
                            orderModelData: controller.completedOrder[index],
                          ));
                    },
                  ),
          ),
        );
      },
    );
  }
}
