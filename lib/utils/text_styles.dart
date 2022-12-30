import 'package:flutter/material.dart';

import 'colors.dart';

class MyTextStyles {
  static TextStyle get normalTextStyle => TextStyle(
        fontSize: 14,
        fontFamily: "Mulish",
        color: AppColors.textColor,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get headerTextStyle => TextStyle(
        fontSize: 16,
        fontFamily: "Mulish",
        color: AppColors.textColor,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get smallTextStyle => TextStyle(
        fontSize: 12,
        fontFamily: "Mulish",
        color: AppColors.textColor,
        fontWeight: FontWeight.w400,
      );
}
