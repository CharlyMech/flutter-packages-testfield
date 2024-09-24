import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kitchen/constants/themes.dart';
import 'package:flutter_kitchen/screens/home.dart';
import 'cubits/theme/theme_cubit.dart';
import 'utils/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit()..getTheme(),
      child: BlocBuilder<ThemeCubit, MyTheme>(
        builder: (context, themeState) {
          return MaterialApp(
            theme: themeState.toThemeData(),
            home: const Home(),
          );
        },
      ),
    );
  }
}
