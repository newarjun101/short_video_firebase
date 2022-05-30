import 'package:flutter/foundation.dart';

class BottomNavMainController extends ChangeNotifier {
  int index = 1;

  BottomNavMainController() {}

  onNavBarItemTapped(int selectedIndex) {
    index = selectedIndex;
    notifyListeners();
  }
}
