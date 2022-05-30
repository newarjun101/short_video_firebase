

import 'package:cloud_mm_vdo_short/controller/home_controller.dart';
import 'package:cloud_mm_vdo_short/controller/keyboard_controller.dart';
import 'package:get_it/get_it.dart';

import '../controller/add_video_controller.dart';
import '../controller/bottom_nav_main_controller.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => HomeController());
  locator.registerLazySingleton(() => BottomNavMainController());
  locator.registerLazySingleton(() => AddVideoController());
  locator.registerLazySingleton(() => KeyboardController());
}