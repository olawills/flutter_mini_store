import 'package:flutter/material.dart';
import 'package:mini_shop/exports/constants_exports.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: lightScaffoldColor,
    primaryColor: lightCardColor,
    backgroundColor: lightBackgroundColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: lightIconsColor,
      ),
      backgroundColor: lightScaffoldColor,
      centerTitle: true,
      titleTextStyle: TextStyle(
          color: lightTextColor, fontSize: 22, fontWeight: FontWeight.bold),
      elevation: 0,
    ),
    iconTheme: IconThemeData(
      color: lightIconsColor,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: blackColor,
      selectionColor: blueColor,
    ),
    cardColor: lightCardColor,
    brightness: Brightness.light,
    colorScheme: ThemeData().colorScheme.copyWith(
          secondary: lightIconsColor,
          brightness: Brightness.light,
        ),
  );

  static final darkTheme = ThemeData();
}
