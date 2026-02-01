import 'package:flutter/material.dart';
import 'package:islamy_app/model/hadeth_details_args.dart';
import 'package:islamy_app/utils/App_assets.dart';
import 'package:islamy_app/utils/app_Style.dart';

import '../../../utils/app_colours.dart';

class HadethDetailScreen extends StatelessWidget {
  const HadethDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    HadethDetailsArgs args =
        ModalRoute.of(context)?.settings.arguments as HadethDetailsArgs;

    return Scaffold(
      backgroundColor: AppColours.backgroundColor,
      appBar: AppBar(
        title: Text('hadeth ${args.index + 1}', style: AppStyle.bold20primary),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppAssets.leftcorrnerImage, width: width * 0.17),
                Expanded(
                  child: Text(
                    args.hadeth.title,
                    style: AppStyle.bold24primary,
                    textAlign: TextAlign.center,
                  ),
                ),
                Image.asset(AppAssets.rightcorrnerImage, width: width * 0.17),
              ],
            ),
          ),

          // محتوى الحديث المنسق
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                vertical: height * 0.02,
                horizontal: width * 0.06,
              ),
              child: _buildStyledHadethContent(args.hadeth.Content),
            ),
          ),

          // صورة المسجد ثابتة في القاع
          Image.asset(
            AppAssets.hadehMosque,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  Widget _buildStyledHadethContent(String content) {
    const String target = "قال";
    int splitIndex = content.indexOf(target);

    if (splitIndex == -1) {
      return Text(
        content.trim(),
        style: AppStyle.bold24primary.copyWith(height: 1.7),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      );
    }

    String beforeText = content.substring(0, splitIndex);
    String afterText = content.substring(splitIndex);

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: beforeText,
            style: AppStyle.bold24primary.copyWith(
              color: AppColours.primaryColor.withOpacity(0.7),
              height: 1.7,
              fontSize: 22,
            ),
          ),

          TextSpan(
            text: afterText,
            style: AppStyle.bold24primary.copyWith(
              height: 1.7,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
  }
}
