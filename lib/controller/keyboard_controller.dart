import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class KeyboardController extends ChangeNotifier {
  static const platform = MethodChannel('KEYBOARD');
  int value = 0;

  ///action on up down button click
  Future<void> actionOnClick({required bool isUp}) async {
    try {
      final int result = isUp
          ? await platform.invokeMethod('getUpButton')
          : await platform.invokeMethod('getDownButton');

      value = isUp==true? result+10 : result-10;
      print(value);
    } on PlatformException catch (e) {}

    notifyListeners();
  }
}
