import 'package:flutter/material.dart';
import 'package:islamy_app/model/hadeth.dart';
import 'package:islamy_app/model/hadeth_details_args.dart';
import 'package:islamy_app/utils/App_assets.dart';
import 'package:islamy_app/utils/app_Style.dart';
import 'package:islamy_app/utils/app_routs.dart';

import '../../../utils/app_colours.dart';

class HadethItem extends StatelessWidget {
  final Hadeth hadeth;
  final int index;

  const HadethItem({super.key, required this.hadeth, required this.index});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRouts.HadethdetailsScreen,
          arguments: HadethDetailsArgs(hadeth: hadeth, index: index),
        );
      },
      child: Container(
        width: screenWidth * 0.8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
            image: AssetImage(AppAssets.hadehbackground),
          ),
          color: AppColours.primaryColor,
        ),
        child: Column(
          children: [
            _buildHeader(context, screenWidth),
            _buildContent(screenWidth),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      child: Row(
        children: [
          Image.asset(AppAssets.hadethleftcorrner, width: width * 0.14),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              hadeth.title,
              style: AppStyle.bold24black,
              textAlign: TextAlign.center,
            ),
          ),
          Image.asset(AppAssets.hadehrightcorrner, width: width * 0.14),
        ],
      ),
    );
  }

  Widget _buildContent(double width) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width * 0.04),
        child: Text(
          hadeth.Content,
          style: AppStyle.bold16black,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildFooter() {
    return Image.asset(
      AppAssets.hadehMosque,
      width: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
