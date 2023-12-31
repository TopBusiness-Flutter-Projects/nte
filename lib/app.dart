import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:nte/features/editprofile/cubit/cubit.dart';
import 'package:nte/features/homescreen_driver/cubit/homecubit.dart';
import 'package:nte/features/mainscreen_driver/maincubit/maincubit.dart';
import 'package:nte/features/mytruck/cubit/cubit.dart';
import 'package:nte/features/onboarding/cubit/onboarding_cubit.dart';
import 'package:nte/features/profile/cubit/cubit.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';
import 'core/utils/app_strings.dart';
import 'package:nte/injector.dart' as injector;

import 'features/addnewtruck/cubit/cubit.dart';
import 'features/changepassword/cubit/cubit.dart';
import 'features/completedorderdriver/cubit/completedordercubit.dart';
import 'features/driver_order_details/cubit/orderdetailscubit.dart';
import 'features/forgetpassword/cubit/cubit.dart';
import 'features/homescreen/cubit/cubit.dart';
import 'features/login/cubit/cubit.dart';
import 'features/addorders/cubit/cubit.dart';
import 'features/mainscreen/cubit/cubit.dart';
import 'features/orderdetails/cubit/cubit.dart';
import 'features/signup/cubit/cubit.dart';
import 'features/tabcontrol/cubit/tab_control_cubit.dart';

class NTE extends StatefulWidget {
  const NTE({Key? key}) : super(key: key);

  @override
  State<NTE> createState() => _NTEState();
}

class _NTEState extends State<NTE> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(text);

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => injector.serviceLocator<LoginCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<SignUpCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<OnboardingCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<ForgetPasswordCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<HomeCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<OrderDetailsCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<TabControlCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<AddNewTruckCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<TruckCubit>(),
          ),
          //
          BlocProvider(
            create: (_) => injector.serviceLocator<AddNewOrderCubit>(),
          ),
          //
          //
          BlocProvider(
            create: (_) => injector.serviceLocator<MainCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<ProfileCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<EditProfileCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<HomeDriverCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<CompletedOrderDriverCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<MainOrderDriverCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<ChangePasswordCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<OrderDetailsDriverCubit>(),
          ),
          //BlocProvider(
          // create: (_) => injector.serviceLocator<MainCubit>(),
          // ),
        ],
        child: GetMaterialApp(
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: appTheme(),
          themeMode: ThemeMode.light,
          darkTheme: ThemeData.light(),

          // standard dark theme
          localizationsDelegates: context.localizationDelegates,
          debugShowCheckedModeBanner: false,
          title: AppStrings.appName,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        ));
  }
}
