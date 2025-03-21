import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_theme.dart';
import 'colors/app_colors.dart';
import 'light_theme/light_theme.dart';

extension ThemeExtension on BuildContext{
  AppColors get colors => read<ThemeCubit>().state.colors;
  TextTheme get textTheme => read<ThemeCubit>().state.textTheme;
}

class ThemeCubit extends Cubit<AppTheme>{
  ThemeCubit() : super(LightTheme());
}