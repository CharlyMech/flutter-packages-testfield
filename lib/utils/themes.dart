import 'package:flutter/material.dart';
import 'package:flutter_kitchen/constants/themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> getThemeFromPreferences() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('theme');
}

extension MyThemeToThemeData on MyTheme {
  ThemeData toThemeData() {
    return ThemeData(
        primaryColor: Color(int.parse(primaryColor.replaceFirst('#', '0xff'))),
        primaryColorLight:
            Color(int.parse(primaryLight.replaceFirst('#', '0xff'))),
        primaryColorDark:
            Color(int.parse(primaryDark.replaceFirst('#', '0xff'))),
        scaffoldBackgroundColor:
            Color(int.parse(backgroundColor.replaceFirst('#', '0xff'))),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
              color: Color(int.parse(defaultText.replaceFirst('#', '0xff')))),
          bodyMedium: TextStyle(
              color: Color(int.parse(defaultText.replaceFirst('#', '0xff')))),
        ),

        // TODO -> fine tune this
        colorScheme: ColorScheme(
          primary: Color(int.parse(primaryColor.replaceFirst('#', '0xff'))),
          primaryContainer:
              Color(int.parse(primaryLight.replaceFirst('#', '0xff'))),
          secondary: Color(int.parse(colorPurple.replaceFirst('#', '0xff'))),
          secondaryContainer:
              Color(int.parse(colorYellow.replaceFirst('#', '0xff'))),
          surface: Color(int.parse(backgroundColor.replaceFirst('#', '0xff'))),
          error: Color(int.parse(colorRed.replaceFirst('#', '0xff'))),
          onPrimary: Color(int.parse(defaultText.replaceFirst('#', '0xff'))),
          onSecondary: Color(int.parse(defaultText.replaceFirst('#', '0xff'))),
          onSurface: Color(int.parse(defaultText.replaceFirst('#', '0xff'))),
          onError: Color(int.parse(defaultText.replaceFirst('#', '0xff'))),
          brightness: this == themes[ThemeType.light]
              ? Brightness.light
              : Brightness.dark,
        ),
        appBarTheme: AppBarTheme(
            color: Color(int.parse(backgroundColor.replaceFirst('#', '0xff'))),
            shadowColor: Color(int.parse(shadow.replaceFirst('#', '0xff')))),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor:
              Color(int.parse(primaryColor.replaceFirst('#', '0xff'))),
          iconSize: 40,
          foregroundColor: Color(int.parse(darkText.replaceFirst('#', '0xff'))),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(int.parse(primaryColor.replaceFirst('#', '0xff'))),
        ),
        // TODO -> IconButton Theme
        checkboxTheme: CheckboxThemeData(
          checkColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            return Color(int.parse(darkText.replaceFirst('#', '0xff')));
          }),
        ),
        switchTheme: SwitchThemeData(
          trackOutlineWidth: WidgetStateProperty.resolveWith<double?>(
              (Set<WidgetState> states) {
            return;
          }),
        ));
  }
}
