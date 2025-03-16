import 'package:flutter/material.dart';
class BrandColors{
  static const Color primary = Color(0xffA1045A);
  static const Color backgroundColor = Color(0xffFFFFFF);
  static const Color colorShade1 = Color(0xffFAF1F7);
  static const Color colorShade2 = Color(0xffFAF2F7);
  static const Color shadowColor = Color.fromARGB(25,181, 181, 181);
  static const Color borderColorGray100 = Color(0xffE1E3E5);
  static const LinearGradient gradientBorder = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xffA1045A),
      Color(0xff737373),
    ],  );

//   text styles ===================

static const Color textColorShade000 = Color(0xff000000);
static const Color textColorShade034 = Color(0xff2D3034);
static const Color textColorShadeGry700 = Color(0xff616161);
static const Color textColorShadeC67 = Color(0xff525C67);
static const Color textColorShade383 = Color(0xff838383);
static const Color textColorShade69D = Color(0xff90969D);

}