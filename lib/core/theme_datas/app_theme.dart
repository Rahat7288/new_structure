import 'package:flutter/material.dart';

abstract class AppTheme {
  // AppColors get colors;
  TextTheme get textTheme;
  ThemeData get themeData;
  FilledButtonThemeData get filledButtonThemeData;
  TextButtonThemeData get textButtonThemeData;
  IconButtonThemeData get iconButtonThemeData;
  FloatingActionButtonThemeData get floatingActionButtonThemeData;
  InputDecorationTheme get inputDecorationTheme;
}