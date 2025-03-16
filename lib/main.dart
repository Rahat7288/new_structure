import 'package:flutter/material.dart';
import 'package:new_structure/core/theme_datas/light_theme/light_theme.dart';

import 'features/login/presentations/views/login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: LightTheme().themeData,
      home: const LoginView(),
    );
  }
}
