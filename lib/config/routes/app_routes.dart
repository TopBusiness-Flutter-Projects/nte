import 'package:flutter/material.dart';
import 'package:nte/features/splash/screens/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../core/utils/app_strings.dart';
import '../../features/login/screen/loginscreen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String loginRoute = '/login';
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
