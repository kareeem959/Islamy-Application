import 'package:flutter/material.dart';
import 'package:islamy_app/model/quran_resources.dart';
import 'package:islamy_app/provider/most_resent_provider.dart';
import 'package:islamy_app/ui_extensions/ui_extensions.dart';
import 'package:islamy_app/utils/App_assets.dart';
import 'package:islamy_app/utils/app_Style.dart';
import 'package:islamy_app/utils/app_colours.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_routs.dart';

class MostResentWidget extends StatelessWidget {
  const MostResentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MostResentProvider>(
      builder: (context, provider, child) {
        if (provider.mostRecentList.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Most Recently", style: AppStyle.bold16white),
            SizedBox(height: context.height * 0.02),
            SizedBox(
              height: context.height * 0.16,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: provider.mostRecentList.length,
                itemBuilder: (context, index) {
                  int suraIndex = provider.mostRecentList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        AppRouts.SuraDetailScreen,
                        arguments: suraIndex,
                      );
                    },
                    child: _buildSuraCard(context, suraIndex),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: context.width * 0.03);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSuraCard(BuildContext context, int suraIndex) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.02),
      decoration: BoxDecoration(
        color: AppColours.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                QuranResources.englishQuranSuraslist[suraIndex],
                style: AppStyle.bold24black,
              ),
              Text(
                QuranResources.arabicQuranSuraslist[suraIndex],
                style: AppStyle.bold24black,
              ),
              Text(
                "${QuranResources.versesNumberlist[suraIndex]} Verses",
                style: AppStyle.bold14black,
              ),
            ],
          ),
          Image.asset(AppAssets.most_recent),
        ],
      ),
    );
  }
}
