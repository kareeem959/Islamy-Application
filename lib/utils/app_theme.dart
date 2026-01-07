import 'package:flutter/material.dart';

import 'app_colours.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColours.transparent,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColours.whiteColor,
      unselectedItemColor: AppColours.blackColor,
    ),
  );
}
