import 'package:cloud_mm_vdo_short/view/screen_route_handling/screen_route_name.dart';
import 'package:cloud_mm_vdo_short/view/screens/home_screen/home_screen.dart';
import 'package:get/get.dart';

import '../screens/bottom_nav_main/buttom_nav_main.dart';

class ScreenRoute {
  var routerPage = [
    GetPage(name: ScreenRouteName.rHomeScreen, page: () =>  HomeScreen()),
    GetPage(name: ScreenRouteName.rINITIAL, page: () =>  ButtonNavMain())
  ];
}
