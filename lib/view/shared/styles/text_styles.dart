import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/extensions/context_extensions.dart';
import 'colors.dart';

class AppTextStyles {
  // button
  static TextStyle textButton3 = _getTextStyle(14, FontWeight.w600);

  static TextStyle textButton2 = _getTextStyle(14, FontWeight.w800);

  static TextStyle textButton1 = _getTextStyle(18, FontWeight.w700);

  // body
  static TextStyle body1 = _getTextStyle(16, FontWeight.w500);

  // body2
  static TextStyle body2 = _getTextStyle(14, FontWeight.w500);

  // body3
  static TextStyle body3 = _getTextStyle(16, FontWeight.w700);

  // body3
  static TextStyle body4 = _getTextStyle(14, FontWeight.w400);

  // body5
  static TextStyle body5 = _getTextStyle(12, FontWeight.w700);

  // body6
  static TextStyle body6 = _getTextStyle(15, FontWeight.w600);

  // body7
  static TextStyle body7 = _getTextStyle(10, FontWeight.w500);

    // body8
  static TextStyle body8 = _getTextStyle(10, FontWeight.w700);

  // body9
  static TextStyle body9 = _getTextStyle(13, FontWeight.w400);

  // heading
  static TextStyle heading1 = _getTextStyle(22, FontWeight.w600);

  static TextStyle heading2 = _getTextStyle(20, FontWeight.w700);

  static TextStyle heading3 = _getTextStyle(18, FontWeight.w600);

  static TextStyle heading4 = _getTextStyle(16, FontWeight.w600);

  static TextStyle heading5 = _getTextStyle(14, FontWeight.w700);

  static TextStyle heading6 = _getTextStyle(17, FontWeight.w700);

  static TextStyle heading7 = _getTextStyle(24, FontWeight.w500);

  // bottomNavBar
  static TextStyle bottomNavBar = _getTextStyle(14, FontWeight.w500);
  // bottomNavBar
  static TextStyle forgotPassword = _getTextStyle(15, FontWeight.w500);

  // CTA Text
  static TextStyle ctaText = _getTextStyle(14, FontWeight.w700);

  // input_text
  static TextStyle inputTextRegular = _getTextStyle(16, FontWeight.w400);

  // toast_message_text
  static TextStyle toastMessageText = _getTextStyle(12, FontWeight.w600);

  //footer_notes
  static TextStyle termsFooterNotes = _getTextStyle(14, FontWeight.w400);

  // text underlined
  static TextStyle textUnderlined = _getTextStyle(14, FontWeight.w500)
      .copyWith(decoration: TextDecoration.underline);

  // special
  static TextStyle special = _specialTextStyle(48, FontWeight.w400);

  static TextStyle tertiaryButtonText(BuildContext context) {
    return TextStyle(
      fontSize: context.screenAwareSize(11),
      fontWeight: FontWeight.w500,
      color: const Color(0xFF606060),
    );
  }

  static TextStyle _getTextStyle(double fontSize, FontWeight fontWeight,
          {double? height, Color color = AppColors.dustyGray800}) =>
      TextStyle(
          fontFamily: 'HKGrotesk',
          fontSize: fontSize,
          fontWeight: fontWeight,
          height: height ?? 1.2,
          color: color);

  static TextStyle _specialTextStyle(
    double fontSize,
    FontWeight fontWeight,
  ) =>
      GoogleFonts.bebasNeue(
          fontSize: fontSize, fontWeight: fontWeight, color: Colors.white);
}
