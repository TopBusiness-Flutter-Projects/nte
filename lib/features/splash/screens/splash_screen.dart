import 'package:flutter/material.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:nte/config/routes/app_routes.dart';
import 'package:nte/core/utils/assets_manager.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: Colors.white,
      body: Stack(

        children: [
          Positioned(
            //alignment: Alignment.topRight,
            right: 0,
                left: width/3,
                top: 0,
                child: Image.asset(ImageAssets.topSplashImage),
          ),
          Align(alignment: Alignment.center,
          child: Image.asset(ImageAssets.centerSplashImage,width: width/1.5,)),

          Positioned(
            left: 0,
          bottom: 0,
          right: width/3,
          //  alignment: Alignment.bottomLeft,
            child: Image.asset(ImageAssets.bottomSplashImage),
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
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }
}

