import 'package:flutter/material.dart';

import 'colors.dart';

class ThemeStyle {
  static ThemeData customThemeData() {
    const fontFamily = "HKGrotesk";
    AppBarTheme getAppBarTheme() => const AppBarTheme(
        color: Colors.white,
        elevation: 0.7,
        iconTheme: IconThemeData(color: Colors.white));

    TextTheme getTextTheme() {
      return const TextTheme(
          headline3: TextStyle(
              fontFamily: fontFamily,
              fontSize: 22,
              fontWeight: FontWeight.w800,
              height: 1.365),
          headline4: TextStyle(
              fontFamily: fontFamily,
              fontSize: 18,
              fontWeight: FontWeight.w800,
              height: 1.365),
          headline5: TextStyle(
              fontFamily: fontFamily,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              height: 1.5),
          headline6: TextStyle(
              fontFamily: fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.w800,
              height: 1.714),
          bodyText2: TextStyle(
              fontFamily: fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              height: 1.428),
          subtitle1: TextStyle(
              fontFamily: fontFamily,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              height: 1.714),
          subtitle2: TextStyle(
              fontFamily: fontFamily,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              height: 1.5),
          button: TextStyle(
              fontFamily: fontFamily,
              fontSize: 12,
              fontWeight: FontWeight.w800,
              height: 1.333),
          caption: TextStyle(
              fontFamily: fontFamily,
              fontSize: 12,
              height: 2,
              fontWeight: FontWeight.w800));
    }

    TextButtonThemeData getTextButtonTheme() {
      return TextButtonThemeData(
          style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
      ));
    }

    return ThemeData(
      primaryColor: AppColors.red400,
      primaryColorDark: AppColors.black,
      primaryColorLight: const Color(0xffE4E7ED),
      fontFamily: fontFamily,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: Colors.white,
      disabledColor: const Color(0xff606060),
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      //dividerColor: const Color(0xffCFCFCF),
      dividerColor: Colors.black,
      errorColor: const Color(0xffB00020),
      secondaryHeaderColor: const Color(0xff9B9B9B),
      textButtonTheme: getTextButtonTheme(),
      appBarTheme: getAppBarTheme(),
      textTheme: getTextTheme(),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.red,
      ).copyWith(secondary: Colors.transparent, primary: AppColors.black),
    );
  }
}
