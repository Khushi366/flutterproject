
import 'package:flutter/material.dart';
import 'package:weathers/Theme/AppColors.dart';
import 'AppString.dart';
class AppTheme {
  static ThemeData light = _lightTheme;
}

ThemeData _lightTheme = ThemeData(
  fontFamily: fontPoppinsRegular,
  // scaffoldBackgroundColor: kBackground,
  // primarySwatch: green,
//  primaryColor: kPrimaryColor,
  //colorScheme: const ColorScheme.light(primary: kAccentColor, secondary: kAccentColor),
  // hintColor: kGrey,
  textTheme: const TextTheme(
    displayLarge: TextStyle(color: kBlack, fontSize: fsXXXLarge, fontWeight: FontWeight.bold, letterSpacing: .6,),//30.0
    displayMedium: TextStyle(color: kBlack, fontSize: fsXLarge, fontWeight: FontWeight.bold, letterSpacing: .6,),//20.0
    displaySmall: TextStyle(color: kBlack, fontSize: fsXLarge, fontWeight: FontWeight.bold, letterSpacing: .6,),//20.0
    headlineLarge: TextStyle(color: kBlack, fontSize: fsLarge, fontWeight: FontWeight.w700, letterSpacing: .6,),//18.0
    headlineMedium: TextStyle(color: kBlack, fontSize: fsLarge, fontWeight: FontWeight.w700, letterSpacing: .6,),//18.0
    headlineSmall: TextStyle(color: kBlack, fontSize: fsMedium, fontWeight: FontWeight.w700, letterSpacing: .6,),//16.0
    titleLarge: TextStyle(color: kBlack,fontSize: fsNormal, fontWeight: FontWeight.w600, letterSpacing: .6,),//14
    bodySmall: TextStyle(color: kBlack, fontSize: fsSmall, fontWeight: FontWeight.normal,letterSpacing: .6,),//12


  ),
  // dividerColor: kDividerColor,
  // textSelectionTheme: const TextSelectionThemeData(cursorColor: kAccentColor),
  inputDecorationTheme: InputDecorationTheme(
    //hintStyle: TextStyle(fontSize: fsNormal),
    //labelStyle: TextStyle(fontSize: fsNormal),
    // contentPadding: const EdgeInsets.all(12),
    //enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: kGrey)),
    //focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: kAccentColor, width: 2)),
    // errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: kErrorColor)),
  ),
);