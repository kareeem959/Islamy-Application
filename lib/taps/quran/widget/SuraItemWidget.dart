import 'package:flutter/material.dart';
import 'package:islamy_app/model/quran_resources.dart';
import 'package:islamy_app/utils/App_assets.dart';

import '../../../utils/app_Style.dart';

class SuraItemWidget extends StatelessWidget {
  final int index;

  const SuraItemWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppAssets.vector),
              Text('${index + 1}', style: AppStyle.bold20white),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  QuranResources.englishQuranSuraslist[index],
                  style: AppStyle.bold20white,
                ),
                Text(
                  '${QuranResources.versesNumberlist[index]} verses',
                  style: AppStyle.bold14white,
                ),
              ],
            ),
          ),
          Text(
            QuranResources.arabicQuranSuraslist[index],
            style: AppStyle.bold20white,
          ),
        ],
      ),
    );
  }
}
