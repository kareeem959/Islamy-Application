import 'package:flutter/material.dart';

import '../taps/Radio/Radio_tap.dart';
import '../taps/Time/Time_tap.dart';
import '../taps/hadeth/hadeth_tap.dart';
import '../taps/quran/quran_tap.dart';
import '../taps/sepha/sebha_tap.dart';
import '../utils/App_assets.dart';
import '../utils/app_colours.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  //
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<String> backgroundImages = <String>[
    AppAssets.quranPg,
    AppAssets.hadethPg,
    AppAssets.sebhaPg,
    AppAssets.radioPg,
    AppAssets.timePg,
  ];
  List<Widget> tablist = [
    QuranTap(),
    HadethTap(),
    SebhaTap(),
    RadioTap(),
    TimeTap(),
  ];

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Image.asset(
          backgroundImages[selectedIndex],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          backgroundColor: AppColours.transparent,
          bottomNavigationBar: Theme(
            data: Theme.of(
              context,
            ).copyWith(canvasColor: AppColours.primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              //type: BottomNavigationBarType.fixed,
              //backgroundColor: AppColours.primaryColor,
              items: [
                buildBottomNavigationBarItem(
                  index: 0,
                  icon_selectedName: AppAssets.iconeQuranSelect,
                  iconunselectedName: AppAssets.icQuran,
                  label: "Quran",
                ),
                buildBottomNavigationBarItem(
                  index: 1,
                  icon_selectedName: AppAssets.iconeHadethSelect,
                  iconunselectedName: AppAssets.hadeth,
                  label: "Hadeth",
                ),
                buildBottomNavigationBarItem(
                  index: 2,
                  icon_selectedName: AppAssets.iconeSebhaSelect,
                  iconunselectedName: AppAssets.sebha,
                  label: "Sebha",
                ),
                buildBottomNavigationBarItem(
                  index: 3,
                  icon_selectedName: AppAssets.iconeRadioSelect,
                  iconunselectedName: AppAssets.radio,
                  label: "Radio",
                ),
                buildBottomNavigationBarItem(
                  index: 4,
                  icon_selectedName: AppAssets.iconeTimeSelect,
                  iconunselectedName: AppAssets.time,
                  label: "Time",
                ),
              ],
            ),
          ),
          body: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.islamyTop, height: hight * 0.15),
              Expanded(child: tablist[selectedIndex]),
            ],
          ),
        ),
      ],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem({
    required int index,
    required String iconunselectedName,
    required String icon_selectedName,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: selectedIndex == index
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 19, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColours.blackColor,
              ),
              child: Image.asset(
                selectedIndex == index ? icon_selectedName : iconunselectedName,
              ),
            )
          : Image.asset(
              selectedIndex == index ? icon_selectedName : iconunselectedName,
            ),
      label: label,
    );
  }
}
