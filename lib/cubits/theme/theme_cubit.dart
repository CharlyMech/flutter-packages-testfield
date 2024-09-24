import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kitchen/constants/themes.dart';
import 'package:flutter_kitchen/utils/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<MyTheme> {
  ThemeCubit() : super(defaulTheme());

  static MyTheme defaulTheme() {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    return themes[
        brightness == Brightness.dark ? ThemeType.dark : ThemeType.light]!;
  }

  Future<void> getTheme() async {
    final themePref = await getThemeFromPreferences();

    if (themePref != null) {
      final themeType = ThemeType.values.firstWhere(
        (type) => type.toString() == themePref,
        orElse: () => ThemeType.system,
      );
      emit(themes[themeType]!);
    } else {
      var brightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;
      emit(themes[
          brightness == Brightness.dark ? ThemeType.dark : ThemeType.light]!);
    }
  }

  void toggleTheme() {
    final newTheme =
        state == themes[ThemeType.light] ? ThemeType.dark : ThemeType.light;
    emit(themes[newTheme]!);
  }

  Future<void> _saveThemePreference(ThemeType themeType) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', themeType.toString());
  }
}
