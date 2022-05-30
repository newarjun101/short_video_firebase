
import 'package:cloud_mm_vdo_short/view/reusable_widget/text_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/font_and_margin.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onClick;
  final Color buttonTextColor;
  final Color buttonColor;
  final double? fontSize;
  final double? radius;
  final FontWeight? fontWeight;
  final double? buttonHeight;

  const CustomButton(
      {Key? key,
        required this.buttonText,
        required this.onClick,
        required this.buttonTextColor,
        required this.buttonColor,
        this.fontSize,
        this.buttonHeight,
        this.fontWeight,
        this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: buttonHeight ?? 0.056.sh,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? kMediumFont14.sw)),
      color: buttonColor,
      onPressed: onClick,
      child: TextView(
        title: buttonText,
        fontWeight: fontWeight,
        textColor: buttonTextColor,
        fontSize: fontSize ?? kMediumFont14.sp,
      ),
    );
  }
}