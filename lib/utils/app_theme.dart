import 'package:flutter/material.dart';

import 'app_colours.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColours.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColours.blackColor,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: AppColours.primaryColor,
      ),

    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColours.whiteColor,
      unselectedItemColor: AppColours.blackColor,

    ),
  );
}
