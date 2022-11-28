import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../view/shared/styles/colors.dart';

enum ThemeType { lightTheme, darkTheme }

abstract class _IThemeManager {
  void changeThemeType(ThemeType themeType);
  MaterialColor get primary;
  MaterialColor get neutral;
  MaterialColor get semanticRed;
  MaterialColor get semanticGreen;
  MaterialColor get semanticYellow;
  Color get scaffoldBackground;
  Color get clicked;
  Color get contrastColor;
  Color get contrastColorDark;
  Duration get normalDuration;
  Duration get mediumDuration;
  Duration get highDuration;
  BorderRadius get normalBorderRadius;
  BorderRadius get mediumBorderRadius;
  BorderRadius get highBorderRadius;
  BoxConstraints get appBoxConstraint;
  RadialGradient get splashBackground;
  List<BoxShadow> get cardShadow;
  List<BoxShadow> get smallShadow;
  List<BoxShadow> get bottomBarShadow;
  List<BoxShadow> get buttonShadow;
  EdgeInsets get pagePadding;
  EdgeInsets get horizontalPagePadding;
}

class ThemeManager extends ChangeNotifier with _IThemeManager {
  ThemeType activeThemeType = ThemeType.lightTheme;

  @override
  void changeThemeType(ThemeType themeType) {
    activeThemeType = themeType;
    notifyListeners();
  }

  @override
  MaterialColor get primary => MaterialColor(
        AppColors.primary.value,
        const <int, Color>{
          50: AppColors.killarney50,
          100: AppColors.killarney100,
          200: AppColors.killarney200,
          300: AppColors.killarney300,
          400: AppColors.killarney400,
          500: AppColors.killarney500,
          600: AppColors.killarney600,
          700: AppColors.killarney700,
          800: AppColors.killarney800,
          900: AppColors.killarney900,
        },
      );

  @override
  MaterialColor get neutral => MaterialColor(
        AppColors.dustyGray500.value,
        const <int, Color>{
          100: AppColors.dustyGray100,
          200: AppColors.dustyGray200,
          300: AppColors.dustyGray300,
          400: AppColors.dustyGray400,
          500: AppColors.dustyGray500,
          600: AppColors.dustyGray600,
          700: AppColors.dustyGray700,
          800: AppColors.dustyGray800,
          900: AppColors.dustyGray900,
        },
      );

  @override
  MaterialColor get semanticGreen => MaterialColor(
        AppColors.green500.value,
        const <int, Color>{
          100: AppColors.green100,
          200: AppColors.green200,
          300: AppColors.green300,
          400: AppColors.green400,
          500: AppColors.green500,
          600: AppColors.green600,
          700: AppColors.green700,
          800: AppColors.green800,
          900: AppColors.green900,
        },
      );

  @override
  MaterialColor get semanticRed => MaterialColor(
        AppColors.red500.value,
        const <int, Color>{
          100: AppColors.red100,
          200: AppColors.red200,
          300: AppColors.red300,
          400: AppColors.red400,
          500: AppColors.red500,
          600: AppColors.red600,
          700: AppColors.red700,
          800: AppColors.red800,
          900: AppColors.red900,
        },
      );

  @override
  MaterialColor get semanticYellow => MaterialColor(
        AppColors.red500.value,
        const <int, Color>{
          100: AppColors.gold100,
          200: AppColors.gold200,
          300: AppColors.gold300,
          400: AppColors.gold400,
          500: AppColors.gold500,
          600: AppColors.gold600,
          700: AppColors.gold700,
          800: AppColors.gold800,
          900: AppColors.gold900,
        },
      );

  @override
  Color get scaffoldBackground => neutral[200]!;

  @override
  Color get clicked => AppColors.shadowGreen;

  @override
  Color get contrastColor => AppColors.plum;

  @override
  Color get contrastColorDark => AppColors.tawnyPort;

  @override
  Duration get normalDuration => const Duration(milliseconds: 300);

  @override
  Duration get mediumDuration => const Duration(milliseconds: 500);

  @override
  Duration get highDuration => const Duration(milliseconds: 1000);

  @override
  BorderRadius get normalBorderRadius => BorderRadius.circular(6);

  @override
  BorderRadius get mediumBorderRadius => BorderRadius.circular(8);

  @override
  BorderRadius get highBorderRadius => BorderRadius.circular(10);

  @override
  BoxConstraints get appBoxConstraint => const BoxConstraints(maxWidth: 1170);

  @override
  RadialGradient get splashBackground => const RadialGradient(
      colors: [Color(0xff02B78B), Color(0xff7602D1)],
      stops: [0, 1],
      center: Alignment.topLeft,
      radius: 2);

  @override
  EdgeInsets get pagePadding =>
      const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 24);

  @override
  EdgeInsets get horizontalPagePadding =>
      const EdgeInsets.symmetric(horizontal: 15);

  @override
  List<BoxShadow> get cardShadow => [
        const BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .11),
            offset: Offset(0, 8),
            blurRadius: 12,
            spreadRadius: -6)
      ];

  @override
  List<BoxShadow> get smallShadow => [
        const BoxShadow(
            color: Color.fromRGBO(0, 0, 0, .11),
            offset: Offset(0, 8),
            blurRadius: 8,
            spreadRadius: -6)
      ];

  @override
  List<BoxShadow> get bottomBarShadow => [
        const BoxShadow(
          color: Color.fromRGBO(51, 51, 51, .12),
          offset: Offset(0, -2),
          blurRadius: 9,
        )
      ];
  @override
  List<BoxShadow> get buttonShadow => [
        const BoxShadow(
          color: Color.fromRGBO(149, 149, 149, .25),
          offset: Offset(0, 4),
          blurRadius: 20,
          spreadRadius: 0,
        )
      ];
}

final themeProvider = ChangeNotifierProvider((_) => ThemeManager());
