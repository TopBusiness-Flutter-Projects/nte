import 'package:flutter/material.dart';
import 'package:nte/features/forgetpassword/screen/forget_password.dart';
import 'package:nte/features/forgetpassword/screen/otp.dart';
import 'package:nte/features/forgetpassword/screen/reset_password.dart';
import 'package:nte/features/homescreen/screen/homescreen.dart';
import 'package:nte/features/splash/screens/splash_screen.dart';
import 'package:nte/features/onboarding/screens/onboarding_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/utils/app_strings.dart';
import '../../features/addnewtruck/screen/addnewtruck.dart';
import '../../features/login/screen/loginscreen.dart';
import '../../features/orderdetails/screen/orderdetails.dart';
import '../../features/profile/screen/profilescreen.dart';
import '../../features/signup/screen/signupscreen.dart';
import '../../features/truckdetails/screen/truckdetails.dart';

class Routes {
  static const String initialRoute = '/';
  static const String onBoardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String signUp = '/signUp';
  static const String forgetPassword = '/forgetPassword';
  static const String resetPassword = '/resetPassword';
  static const String otpScreen = '/otpScreen';
  static const String homeScreen = '/homeScreen';
  static const String orderDetailsScreen = '/orderDetailsScreen';
  static const String profileScreen = '/profileScreen';
  static const String addNewTruck = '/addNewTruckScreen';
  static const String truckDetailsScreen = '/truckDetailsScreen';
}

class AppRoutes {
  static String route = '';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case Routes.loginRoute:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: LoginScreen(),
        );
      case Routes.forgetPassword:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: ForgetPassword(),
        );
      case Routes.resetPassword:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: const ResetPassword(),
        );

      case Routes.otpScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: OTPScreen(),
        );
      case Routes.onBoardingRoute:
        return MaterialPageRoute(
          builder: (context) => const OnBoardingScreen(),
        );
      case Routes.homeScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: const HomeScreen(),
        );
      case Routes.orderDetailsScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: const OrderDetailsScreen(),
        );
      case Routes.profileScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: const ProfileScreen(),
        );
      case Routes.addNewTruck:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: const AddNewTruckScreen(),
        );
      //TruckDetailsScreen
      case Routes.truckDetailsScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: const TruckDetailsScreen(),
        );
      // case Routes.detailsRoute:
      //   final service = settings.arguments as ServicesModel;
      //   return MaterialPageRoute(
      //     // Extract the service model argument from the settings arguments map
      //
      //     builder: (context) => Details(service: service),
      //   );
      //

      case Routes.signUp:
        return PageTransition(
          type: PageTransitionType.fade,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: SignUpScreen(),
        );
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
