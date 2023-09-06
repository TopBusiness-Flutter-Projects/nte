import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nte/app.dart';
import 'package:nte/app_bloc_observer.dart';
import 'package:nte/core/utils/restart_app_class.dart';
import 'package:nte/injector.dart' as injector;
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

/*
map key >>    AIzaSyCqeB0JnSmNrrtuICRJEG3ZJPxC1DLWSmU
move camera
        ///here after  edit save shared Preference and 
*/
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: true));
  await injector.setup();
  Bloc.observer = AppBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('ar', ''), Locale('en', '')],
      path: 'assets/lang',
      saveLocale: true,
      startLocale: const Locale('ar', ''),
      fallbackLocale: const Locale('ar', ''),
      child: HotRestartController(child: const NTE()),
    ),
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}
