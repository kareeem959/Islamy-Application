import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/model/hadeth.dart';
import 'package:islamy_app/taps/hadeth/widget_hadeth/hadeth_item.dart';
import 'package:islamy_app/utils/app_colours.dart';

import '../../ui_extensions/ui_extensions.dart';

class HadethTap extends StatefulWidget {
  const HadethTap({super.key});

  @override
  State<HadethTap> createState() => _MostResentWidgetState();
}

class _MostResentWidgetState extends State<HadethTap> {
  List<Hadeth> _allHadeths = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadAllHadeths();
  }

  // دالة تحميل الأحاديث من ملفات الـ assets
  Future<void> _loadAllHadeths() async {
    List<Hadeth> loadedHadeths = [];
    for (int i = 1; i <= 50; i++) {
      try {
        final fileContent = await rootBundle.loadString(
            'assets/files/Hadeeth/h$i.txt');
        final lines = fileContent.trim().split('\n');

        if (lines.isNotEmpty) {
          final title = lines.first.trim(); // أول سطر هو العنوان
          final content = lines
              .skip(1)
              .join('\n')
              .trim(); // باقي الأسطر هي المحتوى
          loadedHadeths.add(Hadeth(title: title, Content: content));
        }
      } catch (e) {
        debugPrint("Error loading hadeth h$i.txt: $e");
      }
    }

    if (mounted) {
      setState(() {
        _allHadeths = loadedHadeths;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // عرض مؤشر تحميل حتى تنتهي قراءة الملفات
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColours.primaryColor),
      );
    }

    final screenHeight = context.height;

    return Padding(
      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
      child: Column(
        children: [
          // الـ Carousel لعرض الأحاديث بشكل جذاب
          Expanded(
            child: CarouselSlider.builder(
              itemCount: _allHadeths.length,
              itemBuilder: (BuildContext context, int itemIndex,
                  int pageViewIndex) {
                return HadethItem(
                  hadeth: _allHadeths[itemIndex],
                  index: itemIndex, // تمرير الـ index المطلوب لحل الـ Error
                );
              },
              options: CarouselOptions(
                height: screenHeight * 0.7,
                enlargeCenterPage: true,
                // تكبير العنصر المعروض في المنتصف
                viewportFraction: 0.75,
                // نسبة عرض العنصر من الشاشة
                enableInfiniteScroll: false,
                initialPage: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}