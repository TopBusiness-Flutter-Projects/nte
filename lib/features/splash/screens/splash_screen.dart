// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:nte/core/models/login_model.dart';
import 'package:nte/core/preferences/preferences.dart';
import 'package:nte/core/utils/assets_manager.dart';
import 'package:nte/core/utils/getsize.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                ImageAssets.logo,
                width: getSize(context) / 2,
              )),
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: getSize(context) / 44,
                bottom: 0,
                child: Opacity(
                  opacity: 0.20,
                  child: Image.asset(
                    ImageAssets.splash,
                    width: getSize(context) / 1.2,
                  ),
                ),
              ),
              // Positioned(
              //   bottom: 0,
              //   child: Container(
              //     alignment: Alignment.center,
              //     child: Image.asset(
              //       ImageAssets.copyRight,
              //       width: getSize(context) / 2.5,
              //     ),
              //   ),
              // )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    debugPrint('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    debugPrint('go!');
    _getStoreUser();
  }

  Future<void> _getStoreUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('onBoarding') == true) {
      if (prefs.getString('user') != null) {
        Preferences.instance.getUserModel().then((value) {
          if (value.data!.type == 'user' && value.data!.userType != null) {
            Navigator.pushReplacementNamed(context, Routes.homeScreen);
          } else {
            Navigator.pushReplacementNamed(context, Routes.homeScreenDriver);
          }
        });
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          Routes.loginRoute,
          ModalRoute.withName(
            Routes.initialRoute,
          ),
        );
      }
    } else {
      Navigator.pushReplacementNamed(
        context,
        Routes.onBoardingRoute,
      );
    }
  }
}
