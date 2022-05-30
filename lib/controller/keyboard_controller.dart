import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class KeyboardController extends ChangeNotifier {
  static const platform = const MethodChannel('samples.flutter.dev/battery');
  int value = 0;

  Future<void> actionOnClick({required bool isUp}) async {

    try {
      final int result = isUp
          ? await platform.invokeMethod('getUpButton')
          : await platform.invokeMethod('getDownButton');

      value = result;
      print(value);
    } on PlatformException catch (e) {

    }

    notifyListeners();
  }
}
