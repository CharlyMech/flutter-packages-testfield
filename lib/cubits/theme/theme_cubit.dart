import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kitchen/constants/themes.dart';
import 'package:flutter_kitchen/cubits/theme/theme_state.dart';
import 'package:flutter_kitchen/utils/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(SystemThemeState(systemTheme: defaulTheme())) {
    _initializeTheme();
  }

  static MyTheme defaulTheme() {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return themes[
        brightness == Brightness.dark ? ThemeType.dark : ThemeType.light]!;
  }

  void _initializeTheme() async {
    final themePref = await getThemeFromPreferences();

    if (themePref != null) {
      final themeType = ThemeType.values.firstWhere(
        (type) => type.toString() == themePref,
        orElse: () => ThemeType.system,
      );

      if (themeType == ThemeType.light) {
        emit(LightThemeState(lightTheme: themes[ThemeType.light]!));
      } else if (themeType == ThemeType.dark) {
        emit(DarkThemeState(darkTheme: themes[ThemeType.dark]!));
      }
    } else {
      emit(SystemThemeState(systemTheme: defaulTheme()));
    }
  }

  void setTheme(ThemeType theme) {
    final ThemeType setTheme = ThemeType.values.firstWhere(
      (type) => type == theme,
      orElse: () => ThemeType.system,
    );
    switch (setTheme) {
      case ThemeType.light:
        emit(LightThemeState(lightTheme: themes[setTheme]!));
        _saveThemePreference(ThemeType.light);
        break;
      case ThemeType.dark:
        emit(DarkThemeState(darkTheme: themes[setTheme]!));
        _saveThemePreference(ThemeType.dark);
        break;
      case ThemeType.system:
      default:
        final systemTheme = defaulTheme();
        emit(SystemThemeState(systemTheme: systemTheme));
        _saveThemePreference(ThemeType.system);
        break;
    }
  }

  void toggleTheme() {
    if (state is LightThemeState) {
      emit(DarkThemeState(darkTheme: themes[ThemeType.dark]!));
      _saveThemePreference(ThemeType.dark);
    } else {
      emit(LightThemeState(lightTheme: themes[ThemeType.light]!));
      _saveThemePreference(ThemeType.light);
    }
  }

  Future<void> _saveThemePreference(ThemeType themeType) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', themeType.toString());
  }
}
