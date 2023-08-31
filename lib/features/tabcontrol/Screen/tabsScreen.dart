import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/features/tabcontrol/cubit/tab_control_cubit.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/getsize.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key? key, required this.titles, required this.Screens})
      : super(key: key);
  final List<String> titles;

  final List<Widget> Screens;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> with TickerProviderStateMixin {
  List<String> titles = [];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.titles.length, vsync: this);
    context.read<TabControlCubit>().currentIndex = 0;
    _tabController.animateTo(context.read<TabControlCubit>().currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    titles = widget.titles;
    return Scaffold(
      body: BlocBuilder<TabControlCubit, TabControlState>(
        builder: (context, state) {
          TabControlCubit cubit = context.read<TabControlCubit>();
          return Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(getSize(context) / 12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: getSize(context) / 16,
                ),
                Center(
                  child: TabBar(
                    controller: _tabController,
                    indicator: const BoxDecoration(),
                    tabs: List.generate(widget.titles.length, (index) {
                      return Container(
                        width: getSize(context) / 1.6,
                        padding: EdgeInsets.symmetric(
                          horizontal: getSize(context) / 44,
                          vertical: getSize(context) / 44,
                        ),
                        decoration: BoxDecoration(
                          color: cubit.currentIndex == index
                              ? AppColors.primary
                              : AppColors.gray4,
                          borderRadius: BorderRadius.circular(
                            getSize(context) / 20,
                          ),
                        ),
                        child: Text(
                          titles[index],
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: getSize(context) / 26,
                            color: cubit.currentIndex == index
                                ? AppColors.white
                                : AppColors.black,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      );
                    }),
                    onTap: (value) {
                      cubit.selectTap(value);
                      _tabController.animateTo(value);
                    },
                  ),
                ),
                SizedBox(
                  height: getSize(context) / 22,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: widget.Screens,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
