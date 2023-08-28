import 'package:flutter/material.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:nte/core/utils/assets_manager.dart';
import 'package:nte/core/utils/getsize.dart';

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
          // Positioned(
          //   //alignment: Alignment.topRight,
          //   right: 0,
          //   left: width / 3,
          //   top: 0,
          //   child: Image.asset(ImageAssets.topSplashImage),
          // ),
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                ImageAssets.logo,
                width: getSize(context) / 2,
              )),
          Positioned(
            left: getSize(context) / 44,
            bottom: 0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Opacity(
                  opacity: 0.20,
                  child: Image.asset(
                    ImageAssets.splash,
                    width: getSize(context) / 1.2,
                  ),
                ),
                Container(
                  child: Image.asset(
                    ImageAssets.copyRight,
                    width: getSize(context) / 1.2,
                  ),
                )
              ],
            ),
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
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }
}
