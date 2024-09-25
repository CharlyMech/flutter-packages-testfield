import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kitchen/cubits/theme/theme_state.dart';
import 'package:flutter_kitchen/screens/home.dart';
import 'cubits/theme/theme_cubit.dart';
import 'utils/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            theme: themeState.theme.toThemeData(),
            home: const Home(),
          );
        },
      ),
    );
  }
}
