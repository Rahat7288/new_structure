import 'package:flutter/material.dart';
import '../app_theme.dart';
import '../colors/app_colors.dart';
import '../colors/colors.dart';
import '../text_style_guide/text_styles.dart';

class LightTheme extends AppTheme {
  @override
  AppColors get colors => LightThemeColor();

  @override
  FilledButtonThemeData get filledButtonThemeData => FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: colors.primary,
      foregroundColor: colors.background,
      textStyle: TextStyles.titleLarge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    ),
  );

  @override
  FloatingActionButtonThemeData get floatingActionButtonThemeData => FloatingActionButtonThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(100),

    ),
    backgroundColor: colors.primary,
    foregroundColor: colors.background,
  );

  @override
  IconButtonThemeData get iconButtonThemeData => IconButtonThemeData();

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    labelStyle: TextStyles.titleSmall,
    hintStyle: TextStyles.bodyMedium,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: BrandColors.borderColorGray100,
      )
    )

  );

  @override
  TextButtonThemeData get textButtonThemeData => TextButtonThemeData(
    style:  TextButton.styleFrom(
      textStyle: TextStyles.titleMedium,
    )
  );

  @override
  TextTheme get textTheme => TextTheme(
    headlineLarge: TextStyles.headerLarge,
    headlineMedium: TextStyles.headerMedium,
    headlineSmall: TextStyles.headerSmall,
    titleLarge: TextStyles.titleLarge,
    titleMedium: TextStyles.titleMedium,
    titleSmall: TextStyles.titleSmall,
    bodyLarge: TextStyles.bodyLarge,
    bodyMedium: TextStyles.bodyMedium,
    bodySmall: TextStyles.bodySmall,
    labelLarge: TextStyles.bodyMedium,
    labelMedium: TextStyles.bodyMedium,
    labelSmall: TextStyles.bodySmall,
  );

  @override
  ThemeData get themeData => ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: colors.background,
    // shadowColor: colors.,
    appBarTheme: AppBarTheme(
      backgroundColor: colors.primary,
      foregroundColor: colors.background,
    ),

    filledButtonTheme: filledButtonThemeData,
    floatingActionButtonTheme: floatingActionButtonThemeData,
    iconButtonTheme: iconButtonThemeData,
    inputDecorationTheme: inputDecorationTheme,
    textButtonTheme: textButtonThemeData,
    tabBarTheme:tabBarThemeData,
    textTheme: textTheme,

  );

  @override
  TabBarThemeData get tabBarThemeData => TabBarThemeData(
    labelPadding: EdgeInsets.symmetric(horizontal: 10),
    labelColor: colors.background,
    unselectedLabelColor: colors.titleText2,

    indicator: BoxDecoration(
      color: colors.primary,
     borderRadius: BorderRadius.circular(100),
      shape: BoxShape.rectangle,
    ),
    //   indicatorColor: colors.primary,
  );

}

class LightThemeColor extends AppColors{
  @override

  Color get background => BrandColors.backgroundColor;

  @override

  Color get bodyTextLarge => BrandColors.primary;

  @override

  Color get bodyTextLight => BrandColors.textColorShade000;

  @override

  Color get bodyTitle => BrandColors.textColorShade000;

  @override

  Color get error => BrandColors.errorColor;

  @override
  Color get primary => BrandColors.primary;

  @override
  Color get secondary => BrandColors.shadowColor;

  @override
  Color get surface => BrandColors.colorShade1;

  @override
  Color get titleText => BrandColors.textColorShade000;

  @override
  Color get titleText2 => BrandColors.textColorShade034;

  @override
  Color get titleTextLight => BrandColors.textColorShade383;

}