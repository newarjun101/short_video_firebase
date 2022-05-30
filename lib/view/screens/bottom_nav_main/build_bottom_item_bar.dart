import 'package:cloud_mm_vdo_short/util/font_and_margin.dart';
import 'package:cloud_mm_vdo_short/view/reusable_widget/text_view.dart';
import 'package:cloud_mm_vdo_short/view/screens/bottom_nav_main/custom_add_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/bottom_nav_main_controller.dart';

class BuildBottomItemBar extends StatelessWidget {
  final BottomNavMainController bottomNavMainController;

  const BuildBottomItemBar({Key? key, required this.bottomNavMainController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        buildItem(
            index: 0,
            icon: Icons.home_outlined,
            title: "Home",
            bottomNavMainController: bottomNavMainController),
        buildItem(
            index: 1,
            icon: Icons.disc_full_outlined,
            title: "Discover",
            bottomNavMainController: bottomNavMainController),
        buildItem(
            index: 2,
            icon: Icons.add,
            customIcon: CustomIcon(),
            title: "",
            bottomNavMainController: bottomNavMainController),  buildItem(
            index: 2,
            icon: Icons.message_outlined,
            title: "Inbox",
            bottomNavMainController: bottomNavMainController),
        buildItem(
            index: 3,
            icon: Icons.account_circle_outlined,
            title: "Profile",
            bottomNavMainController: bottomNavMainController),
      ],
      onTap: (selectedIndex) =>
          bottomNavMainController.onNavBarItemTapped(selectedIndex),
      elevation: 0,
      selectedItemColor: bottomNavMainController.index == 0
          ? Theme.of(context).colorScheme.primaryContainer
          : Theme.of(context).colorScheme.onPrimary,
      unselectedItemColor: Theme.of(context).hintColor,
      showUnselectedLabels: true,
      backgroundColor: bottomNavMainController.index == 0
          ? Colors.transparent
          : Theme.of(context).colorScheme.primaryContainer,
      type: BottomNavigationBarType.fixed,
      currentIndex: bottomNavMainController.index,
      selectedFontSize: kMediumFont14.sp,
      iconSize: 24.sp,
      unselectedFontSize: kMediumFont14.sp,
    );
  }
}

BottomNavigationBarItem buildItem(
    {required int index,
    required IconData icon,
      customIcon,
    required String title,
    required BottomNavMainController bottomNavMainController}) {
  return BottomNavigationBarItem(
      icon:customIcon?? Icon(
        icon,
        size: 24.sp,
      ),
      label: title);
}
