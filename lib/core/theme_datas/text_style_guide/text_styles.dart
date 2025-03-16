import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_structure/core/theme_datas/colors/app_colors.dart';
import 'package:new_structure/core/theme_datas/colors/colors.dart';

class TextStyles {
  // header text styles ===================
  static TextStyle headerLarge = GoogleFonts.urbanist(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    color: BrandColors.primary,
  );
  static TextStyle headerMedium = headerLarge.copyWith(
    fontWeight: FontWeight.w500,
    color: BrandColors.textColorShade000,
  );
  static TextStyle headerSmall = headerMedium.copyWith(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
//   title text styles ===================
  static TextStyle titleLarge = headerSmall.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: BrandColors.backgroundColor,
  );

  static TextStyle titleMedium = titleLarge.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: BrandColors.textColorShade000,
  );
  static TextStyle titleSmall = titleMedium.copyWith(
    fontWeight: FontWeight.w500,
    color: BrandColors.textColorShadeC67,
  );
// body text styles ===================

  static TextStyle bodyLarge = titleMedium.copyWith(

  );
  static TextStyle bodyMedium = bodyLarge.copyWith(
    fontSize: 12,
    color: BrandColors.textColorShade383,
  );

  static TextStyle bodySmall = bodyMedium.copyWith(
    fontWeight: FontWeight.w500,
    color: BrandColors.textColorShade034,
  );

}