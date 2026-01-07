import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../utils/app_colours.dart';
import '../utils/app_routs.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final TextStyle titlestyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColours.primaryColor,
  );
  final TextStyle bodystyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColours.primaryColor,
  );

  late final listPagesViewModel = [
    PageViewModel(
      titleWidget: Text("Welcome To Islmi App", style: titlestyle),
      body: "",
      image: Image.asset("assets/images/intro1.png"),
    ),
    PageViewModel(
      titleWidget: Text("Welcome To Islmi App", style: titlestyle),
      bodyWidget: Text(
        "We Are Very Excited To Have You In Our\n Community",
        style: bodystyle,
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/images/intro2.png"),
    ),
    PageViewModel(
      titleWidget: Text("Reading the Quran", style: titlestyle),
      bodyWidget: Text(
        "Read, and your Lord is the Most Generous",
        style: bodystyle,
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/images/intro3.png"),
    ),
    PageViewModel(
      titleWidget: Text("Bearish", style: titlestyle),
      bodyWidget: Text(
        "Praise the name of your Lord, the Most High",
        style: bodystyle,
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/images/intro4.png"),
    ),
    PageViewModel(
      titleWidget: Text("Holy Quran Radio", style: titlestyle),
      bodyWidget: Text(
        "You can listen to the Holy Quran Radio through the application for free and easily",
        style: bodystyle,
        textAlign: TextAlign.center,
      ),
      image: Image.asset("assets/images/intro5.png"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: const Color(0xff202020),
      pages: listPagesViewModel,
      showNextButton: false,
      bodyPadding: const EdgeInsets.only(top: 260),
      globalHeader: Image.asset("assets/images/islamy_top.png"),
      done: Text("Done", style: bodystyle),
      dotsDecorator: DotsDecorator(
        color: const Color(0xff707070),
        activeSize: Size(18, 7),
        activeColor: AppColours.primaryColor,
        activeShape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
        ),
      ),
      showSkipButton: true,
      skip: Text("skip", style: bodystyle),

      back: const Icon(
        Icons.arrow_back_ios_new,
        color: AppColours.primaryColor,
      ),
      showBackButton: true,
      onSkip: () {
        Navigator.pushNamed(context, AppRouts.homeScreenRoute);
      },
      onDone: () {
        Navigator.pushNamed(context, AppRouts.homeScreenRoute);
      },
    );
  }
}
