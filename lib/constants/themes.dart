enum ThemeType { light, dark, system }

class MyTheme {
  final String backgroundColor;
  final String primaryColor;
  final String primaryLight;
  final String primaryDark;
  final String colorRed;
  final String colorYellow;
  final String colorPurple;
  final String colorGreen;
  final String defaultText;
  final String lightText;
  final String darkText;
  final String shadow;

  MyTheme({
    required this.backgroundColor,
    required this.primaryColor,
    required this.primaryLight,
    required this.primaryDark,
    required this.colorRed,
    required this.colorYellow,
    required this.colorPurple,
    required this.colorGreen,
    required this.defaultText,
    required this.lightText,
    required this.darkText,
    required this.shadow,
  });
}

final Map<ThemeType, MyTheme> themes = {
  ThemeType.light: MyTheme(
    backgroundColor: "#FFFFFF",
    primaryColor: "#0553B1",
    primaryLight: "#027DFD",
    primaryDark: "#042B59",
    colorRed: "#F25D50",
    colorYellow: "#FFF275",
    colorPurple: "#6200EE",
    colorGreen: "#1CDAC5",
    defaultText: "#212121",
    lightText: "#757575",
    darkText: "#FFFFFF",
    shadow: "#202020",
  ),
  ThemeType.dark: MyTheme(
    backgroundColor: "#041E3C",
    primaryColor: "#0553B1",
    primaryLight: "#027DFD",
    primaryDark: "#042B59",
    colorRed: "#F25D50",
    colorYellow: "#FFF275",
    colorPurple: "#6200EE",
    colorGreen: "#1CDAC5",
    defaultText: "#FFFFFF",
    lightText: "#757575",
    darkText: "#FFFFFF",
    shadow: "#202020",
  ),
};
