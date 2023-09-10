import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nte/core/remote/service.dart';
import 'package:nte/features/completedorderdriver/cubit/completedordercubit.dart';
import 'package:nte/features/homescreen_driver/cubit/homecubit.dart';
import 'package:nte/features/onboarding/cubit/onboarding_cubit.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'core/api/app_interceptors.dart';
import 'core/api/base_api_consumer.dart';
import 'core/api/dio_consumer.dart';
import 'features/addnewtruck/cubit/cubit.dart';
import 'features/changepassword/cubit/cubit.dart';
import 'features/driver_order_details/cubit/orderdetailscubit.dart';
import 'features/editprofile/cubit/cubit.dart';
import 'features/forgetpassword/cubit/cubit.dart';
import 'features/homescreen/cubit/cubit.dart';
import 'features/login/cubit/cubit.dart';
import 'features/mainscreen/cubit/cubit.dart';
import 'features/mainscreen_driver/maincubit/maincubit.dart';
import 'features/mytruck/cubit/cubit.dart';
import 'features/addorders/cubit/cubit.dart';
import 'features/orderdetails/cubit/cubit.dart';
import 'features/profile/cubit/cubit.dart';
import 'features/signup/cubit/cubit.dart';
import 'features/tabcontrol/cubit/tab_control_cubit.dart';

// import 'features/downloads_videos/cubit/downloads_videos_cubit.dart';

final serviceLocator = GetIt.instance;

Future<void> setup() async {
  //! Features

  ///////////////////////// Blocs ////////////////////////
  //
  serviceLocator.registerFactory(() => LoginCubit(
        serviceLocator(),
      ));
  serviceLocator.registerFactory(
    () => SignUpCubit(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => OnboardingCubit(),
  );
  serviceLocator.registerFactory(
    () => TabControlCubit(),
  );
  serviceLocator.registerFactory(
    () => ForgetPasswordCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => HomeCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => OrderDetailsCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => AddNewTruckCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => TruckCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => AddNewOrderCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => MainCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(() => ProfileCubit(
        serviceLocator(),
      ));
  serviceLocator.registerFactory(
    () => EditProfileCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => HomeDriverCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => CompletedOrderDriverCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => MainOrderDriverCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => ChangePasswordCubit(
      serviceLocator(),
    ),
  );
  serviceLocator.registerFactory(
    () => OrderDetailsDriverCubit(
      serviceLocator(),
    ),
  );
  // serviceLocator.registerFactory(
  //       () => AddServiceCubit(
  //     serviceLocator(),
  //   ),
  //
  // );
  // serviceLocator.registerFactory(
  //       () => DetailsCubit(
  //     serviceLocator(),
  //   ),
  //
  // );
  //
  // serviceLocator.registerFactory(
  //       () => PrivacyCubit(
  //     serviceLocator(),
  //   ),
  //
  // );
  // serviceLocator.registerFactory(
  //       () => ContactUsCubit(
  //     serviceLocator(),
  //   ),
  //
  // );
  // serviceLocator.registerFactory(
  //       () => NottificationCubit(
  //     serviceLocator(),
  //   ),
  //
  // );

  ///////////////////////////////////////////////////////////////////////////////

  //! External
  // Shared Preferences
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);

  serviceLocator.registerLazySingleton(() => ServiceApi(serviceLocator()));

  serviceLocator.registerLazySingleton<BaseApiConsumer>(
      () => DioConsumer(client: serviceLocator()));
  serviceLocator.registerLazySingleton(() => AppInterceptors());

  // Dio
  serviceLocator.registerLazySingleton(
    () => Dio(
      BaseOptions(
        contentType: "application/x-www-form-urlencoded",
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      ),
    ),
  );
  serviceLocator.registerLazySingleton(
    () => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ),
  );
}
