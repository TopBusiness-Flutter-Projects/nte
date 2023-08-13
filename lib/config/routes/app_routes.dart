import 'package:flutter/material.dart';
import 'package:nte/features/splash/screens/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/utils/app_strings.dart';
import '../../features/login/screen/loginscreen.dart';

import '../../core/utils/app_strings.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
  static const String homeRoute = '/home';
  static const String otpRoute = '/otp';
  static const String notificationDetailsRoute = '/notificationDetails';
  static const String registerScreenRoute = '/registerScreen';
  static const String otpScreenRoute = '/otpScreen';
  static const String verificationScreenRoute = '/verificationScreen';
  static const String googleMapScreenRoute = '/googleMapScreen';
  static const String favoriteRoute = '/favorite';
  static const String fullScreenImageRoute = '/fullScreenImageRoute';
  static const String editProfileRoute = '/editProfile';
  static const String allServicesRoute = '/allServices';
  static const String privacyRoute = '/privacy_about';
  static const String myPostsRoute = '/my_posts';
  static const String detailsRoute = '/details';
  static const String contactUsRoute = '/contact_us';
  static const String googleMapDetailsRoute = '/google_map_details_screen';
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
          type: PageTransitionType.leftToRight,
          alignment: Alignment.center,
          duration: const Duration(milliseconds: 1300),
          child: const LoginScreen(),
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
