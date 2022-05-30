import 'package:cloud_mm_vdo_short/controller/home_controller.dart';
import 'package:cloud_mm_vdo_short/controller/keyboard_controller.dart';
import 'package:cloud_mm_vdo_short/di/locator.dart';
import 'package:cloud_mm_vdo_short/util/font_and_margin.dart';
import 'package:cloud_mm_vdo_short/view/reusable_widget/custom_button.dart';
import 'package:cloud_mm_vdo_short/view/reusable_widget/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class KeyboardScreen extends StatelessWidget {
  const KeyboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keyboardController = locator.get<KeyboardController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        elevation: 4,
        title: Text("Keyboard Screen"),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (_) => keyboardController,
        child: SizedBox(
          //       height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Consumer<KeyboardController>(builder: (_, keyboardCtrl, __) {
                  return ListView(
                    children: [
                      Center(
                        child: AnimatedContainer(
                          height :keyboardCtrl.value.toDouble(),
                          duration: Duration(microseconds: 500),),
                      ),
                      SizedBox(
                          height: 120.h,
                          child: Image.asset("assets/images/rocket.png")),

                    ],
                  );
                }),
              ),
              const Divider(),
              SizedBox(
                height: 100.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => keyboardController.actionOnClick(isUp: false),
                      child: TextView(
                        title: "Up",
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const VerticalDivider(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () => keyboardController.actionOnClick(isUp: true),
                      child: TextView(
                        title: "Down",
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
