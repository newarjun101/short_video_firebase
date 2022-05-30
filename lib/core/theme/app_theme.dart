import 'package:cloud_mm_vdo_short/util/color_constans.dart';
import 'package:flutter/material.dart';

class AppTheme {


  ThemeData getWhiteTheme() {

    return ThemeData(

      primaryColor: primaryColor,
      hintColor: hintColor,
      scaffoldBackgroundColor:  scaffoldBackground,
      backgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(color: primaryColor),
      colorScheme: ColorScheme.fromSwatch().copyWith(
          onPrimary: onPrimary,
          primaryContainer: primaryContainer
      ),
      textTheme:  const TextTheme(
        labelMedium: TextStyle(color: Color(0xff5A596A)),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.black),
        headline1: TextStyle(color: onPrimary),
        caption: TextStyle(color: primaryColor),
      )
    );
  }
}