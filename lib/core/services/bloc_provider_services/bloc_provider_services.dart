import 'package:flutter_bloc/flutter_bloc.dart';
import '../../theme_data/theme_cubit.dart';

class BlocProviderServices {
  static List<BlocProvider> providers(){
    return [
      BlocProvider<ThemeCubit>(create: (context)=> ThemeCubit() ),
    ];
  }
}