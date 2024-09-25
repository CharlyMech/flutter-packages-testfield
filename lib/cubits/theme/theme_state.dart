import 'package:flutter_kitchen/constants/themes.dart';

abstract class ThemeState {
  final MyTheme theme;
  const ThemeState({required this.theme});
}

class LightThemeState extends ThemeState {
  const LightThemeState({required MyTheme lightTheme})
      : super(theme: lightTheme);
}

class DarkThemeState extends ThemeState {
  const DarkThemeState({required MyTheme darkTheme}) : super(theme: darkTheme);
}

class SystemThemeState extends ThemeState {
  const SystemThemeState({required MyTheme systemTheme})
      : super(theme: systemTheme);
}
