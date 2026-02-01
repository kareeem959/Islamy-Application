import 'package:flutter/material.dart';

import '../../utils/app_Style.dart';
import '../../utils/app_colours.dart';

class TimeTap extends StatelessWidget {
  const TimeTap({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          // خلفية شبه شفافة لتناسب التصميم الغامق
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: AppColours.primaryColor, width: 1), // إطار ذهبي متناسق
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.auto_awesome_rounded, // أيقونة جمالية تعبر عن التطوير
              color: AppColours.primaryColor,
              size: 60,
            ),
            const SizedBox(height: 20),
            Text(
              "قريباً بإذن الله",
              style: AppStyle.bold24primary,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              "نعمل حالياً على تطوير هذا القسم لتقديم تجربة تليق بكم. نسألكم الدعاء بالتوفيق.",
              style: AppStyle.bold16black.copyWith(
                color: Colors.white70,
                height: 1.5, // لزيادة تباعد الأسطر وجعلها مريحة للعين
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
