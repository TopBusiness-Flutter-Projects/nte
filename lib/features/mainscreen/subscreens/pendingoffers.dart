import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/features/mainscreen/cubit/state.dart';
import 'package:nte/features/orderdetails/screen/orderdetails.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/getsize.dart';
import '../cubit/cubit.dart';
import '../widgets/customitemwidget.dart';

class PendingOffers extends StatefulWidget {
  const PendingOffers({super.key});

  @override
  State<PendingOffers> createState() => _PendingOffersState();
}

class _PendingOffersState extends State<PendingOffers> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        if (state is LoadingGetNonOrderComplete) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        var controller = context.read<MainCubit>();
        return RefreshIndicator(
          onRefresh: () async {
            controller.ordersNotCompleted();
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
                    itemCount: controller.pendingOrder.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            print(controller.pendingOrder[index].type);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OrderDetailsScreen(
                                        orderid: controller
                                            .pendingOrder[index].id)));
                          },
                          child: OrdersWidget(
                            orderModelData: controller.pendingOrder[index],
                          ));
                    },
                  ),
          ),
        );
      },
    );
  }
}
