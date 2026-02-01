import 'package:flutter/material.dart';
import 'package:islamy_app/taps/quran/shared_pref_utils.dart';
import 'package:shared_preferences/shared_preferences.dart'
    show SharedPreferences;

class MostResentProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  // تم تغيير اسم الدالة إلى الاسم الصحيح والمعبر
  Future<void> readMostRecent() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentListAsString =
        prefs.getStringList(SharedPrefsKeys.mostRecentKey) ?? [];
    mostRecentList = mostRecentListAsString
        .map((element) => int.parse(element))
        .toList();
    notifyListeners();
  }

  // هذه الدالة تقوم بالحفظ، ويتم استدعاؤها من شاشة تفاصيل السورة
  Future<void> setLastSuraIndex(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // يتم قراءة القائمة الحالية أولاً
    List<String> mostRecentListAsString =
        prefs.getStringList(SharedPrefsKeys.mostRecentKey) ?? [];
    // إزالة المؤشر إذا كان موجوداً لمنعه من التكرار ووضعه في المقدمة
    mostRecentListAsString.remove(index.toString());
    // إضافة المؤشر الجديد في بداية القائمة
    mostRecentListAsString.insert(0, index.toString());
    // حفظ القائمة المحدثة
    await prefs.setStringList(
      SharedPrefsKeys.mostRecentKey,
      mostRecentListAsString,
    );
    // تحديث الحالة في الـ Provider وإعلام المستمعين
    await readMostRecent();
  }
}
