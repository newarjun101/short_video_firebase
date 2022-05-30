import 'package:cloud_mm_vdo_short/di/locator.dart';
import 'package:cloud_mm_vdo_short/view/screens/bottom_nav_main/build_bottom_item_bar.dart';
import 'package:cloud_mm_vdo_short/view/screens/discover_screen/discover_screen.dart';
import 'package:cloud_mm_vdo_short/view/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controller/bottom_nav_main_controller.dart';
import '../add_video_screen/add_video_screen.dart';
import '../inbox_screen/inbox_screen.dart';
import '../keyboard_screen/keyboard_screen.dart';

class ButtonNavMain extends StatelessWidget {
  const ButtonNavMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavMainController = locator.get<BottomNavMainController>();
    return ChangeNotifierProvider(
      create: (_) => bottomNavMainController,
      child: Consumer<BottomNavMainController>(builder: (_, controller, __) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          extendBody: true,
          backgroundColor: Colors.black.withOpacity(0.1),
          body: IndexedStack(
            index: bottomNavMainController.index,
            children: [
              HomeScreen(),
              DiscoverScreen(),
              AddVideoScreen(),
              InboxScreen(),
              KeyboardScreen()
            ],
          ),
          bottomNavigationBar: BuildBottomItemBar(
            bottomNavMainController: controller,
          ),
        );
      }),
    );
  }
}
