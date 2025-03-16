import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_structure/core/theme_datas/app_theme.dart';
import 'package:new_structure/core/theme_datas/light_theme/light_theme.dart';

import 'core/services/bloc_provider_services/bloc_provider_services.dart';
import 'core/theme_datas/theme_cubit.dart';
import 'features/login/presentations/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: BlocProviderServices.providers(),
      child: BlocBuilder<ThemeCubit, AppTheme>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: state.themeData,
            home: const LoginView(),
          );
        },
      ),
    );
  }
}
