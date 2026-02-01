import 'package:flutter/material.dart';
import 'package:islamy_app/utils/app_Style.dart';

class HadethContent extends StatelessWidget {
  final String content;

  HadethContent({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      textAlign: TextAlign.center,
      style: AppStyle.bold20primary,
    );
  }
}
