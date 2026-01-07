import 'package:flutter/material.dart';
import 'package:islamy_app/utils/app_routs.dart' show AppRouts;
import 'package:islamy_app/utils/app_theme.dart';

import 'home_screen/HomeScreen.dart';
import 'home_screen/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouts.onboarding_screenRoute,
      routes: {
        AppRouts.onboarding_screenRoute: (context) => OnboardingScreen(),
        AppRouts.homeScreenRoute: (context) => HomeScreen(),
      },

      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
