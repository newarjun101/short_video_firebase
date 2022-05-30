import 'package:cloud_mm_vdo_short/core/theme/app_theme.dart';
import 'package:cloud_mm_vdo_short/di/locator.dart';
import 'package:cloud_mm_vdo_short/view/screen_route_handling/screen_route.dart';
import 'package:cloud_mm_vdo_short/view/screen_route_handling/screen_route_name.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
      builder: (context,child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme().getWhiteTheme(),
          initialRoute: ScreenRouteName.rINITIAL,
          getPages: ScreenRoute().routerPage,
        );
      }
    );
  }
}

