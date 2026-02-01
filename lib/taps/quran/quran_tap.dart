import 'package:flutter/material.dart';
import 'package:islamy_app/model/quran_resources.dart';
import 'package:islamy_app/taps/quran/shared_pref_utils.dart';
import 'package:islamy_app/taps/quran/widget/SuraItemWidget.dart';
import 'package:islamy_app/taps/quran/widget/most_Resent_wedget.dart';
import 'package:islamy_app/utils/App_assets.dart';
import 'package:islamy_app/utils/app_Style.dart';
import 'package:islamy_app/utils/app_colours.dart';

import '../../ui_extensions/ui_extensions.dart';
import '../../utils/app_routs.dart';


class QuranTap extends StatefulWidget {
  QuranTap({super.key});

  @override
  State<QuranTap> createState() => _QuranTapState();
}

class _QuranTapState extends State<QuranTap> {
  List<int>filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
              style: const TextStyle(
                color: AppColours.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              cursorColor: AppColours.primaryColor,
              decoration: InputDecoration(
                enabledBorder: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder(),
                prefixIcon: Image.asset(AppAssets.quranSearchIcon),
                hintText: "Sura Name",
                hintStyle: AppStyle.bold16white,
                suffixIcon: const Icon(
                    Icons.search, color: AppColours.primaryColor),
              ),
              onChanged: (newtext) {
                sershbynewtext(newtext);
              }
          ),
          SizedBox(height: height * 0.02),
          MostResentWidget(),
          SizedBox(height: height * 0.02),
          Text("Suras List", style: AppStyle.bold16white),
          const SizedBox(height: 8),
          Expanded(
            child: filterList.isEmpty ?
            Center(
              child: Text("No Sura in search", style: AppStyle.bold20primary,),)
                :
            ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      //todo : save sura index in shared preferences
                      saveLastSuraIndex(filterList[index]);
                      //todo : navigate to sura detail screen
                      Navigator.of(context).pushNamed(AppRouts.SuraDetailScreen,
                          arguments: filterList[index]);
                    },
                    child: SuraItemWidget(index: filterList[index])
                );
              },
              separatorBuilder: (context, index) {
                return Divider(color: AppColours.whiteColor,
                  thickness: 1,
                  indent: width * 0.06,
                  endIndent: width * 0.06,);
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: AppColours.primaryColor, width: 2),
    );
  }

  void sershbynewtext(String newtext) {
    List<int> filterSearshlist = [];
    for (int i = 0; i < QuranResources.englishQuranSuraslist.length; i++) {
      if (QuranResources.englishQuranSuraslist[i].toLowerCase().contains(
          newtext.toLowerCase())) {
        filterSearshlist.add(i);
      }
    }
    for (int i = 0; i < QuranResources.arabicQuranSuraslist.length; i++) {
      if (QuranResources.arabicQuranSuraslist[i].contains(newtext)) {
        filterSearshlist.add(i);
      }
    }
    filterList = filterSearshlist;
    setState(() {

    });
  }
}
