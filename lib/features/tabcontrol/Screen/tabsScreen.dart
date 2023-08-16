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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getSize(context) / 16,
              ),
              Center(
                child: Container(
                  child: TabBar(
                    controller: _tabController,
                    indicator: BoxDecoration(),
                    tabs: List.generate(widget.titles.length, (index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: getSize(context) / 16,
                          vertical: getSize(context) / 32,
                        ),
                        decoration: BoxDecoration(
                          color: cubit.currentIndex == index
                              ? AppColors.primary
                              : AppColors.gray4,
                          borderRadius: BorderRadius.circular(
                            getSize(context) / 20,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            titles[index],
                            style: TextStyle(
                              fontSize: getSize(context) / 24,
                              color: cubit.currentIndex == index
                                  ? AppColors.white
                                  : AppColors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }),
                    onTap: (value) {
                      cubit.selectTap(value);
                      print(cubit.currentIndex);
                      _tabController.animateTo(value);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: getSize(context) / 22,
              ),
              Expanded(
                child: TabBarView(

                  controller: _tabController,
                  physics: NeverScrollableScrollPhysics(),
                  children: widget.Screens,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
