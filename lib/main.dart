import 'package:flutter/material.dart';
import 'package:islamy_app/provider/most_resent_provider.dart';
import 'package:islamy_app/taps/hadeth/hadeth_deteails/hadeth_detail_screen.dart';
import 'package:islamy_app/taps/quran/Quran_details/sura_detail_screen.dart';
import 'package:islamy_app/taps/sepha/sebha_tap.dart';
import 'package:islamy_app/utils/app_routs.dart' show AppRouts;
import 'package:islamy_app/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart'; // تأكد من إضافة الاستيراد

import 'home_screen/HomeScreen.dart';
import 'home_screen/onboarding_screen.dart';

void main() async {
  // ضمان تهيئة Flutter قبل أي عمليات غير متزامنة
  WidgetsFlutterBinding.ensureInitialized();

  // 1. قراءة حالة الـ Onboarding من الـ SharedPreferences
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isCompleted = prefs.getBool('onboarding_completed') ?? false;

  // إنشاء Provider وقراءة البيانات الأولية
  final mostResentProvider = MostResentProvider();
  await mostResentProvider.readMostRecent();

  runApp(
    ChangeNotifierProvider.value(
      value: mostResentProvider,
      // 2. تمرير الحالة للـ MyApp
      child: MyApp(isCompleted: isCompleted),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isCompleted; // متغير لاستقبال الحالة

  const MyApp({super.key, required this.isCompleted});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // 3. تحديد الـ initialRoute بناءً على الحالة المخزنة
      initialRoute: isCompleted
          ? AppRouts.homeScreenRoute
          : AppRouts.onboarding_screenRoute,

      routes: {
        AppRouts.onboarding_screenRoute: (context) => OnboardingScreen(),
        AppRouts.homeScreenRoute: (context) => HomeScreen(),
        AppRouts.SebhaTapRoute: (context) => SebhaTab(),
        AppRouts.SuraDetailScreen: (context) => SuraDetailScreen(),
        AppRouts.HadethdetailsScreen: (context) => HadethDetailScreen(),
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}