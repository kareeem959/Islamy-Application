import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app/model/quran_resources.dart';
import 'package:islamy_app/provider/most_resent_provider.dart';
import 'package:islamy_app/utils/App_assets.dart';
import 'package:islamy_app/utils/app_Style.dart';
import 'package:islamy_app/utils/app_colours.dart';
import 'package:provider/provider.dart';

class SuraDetailScreen extends StatefulWidget {
  const SuraDetailScreen({super.key});

  @override
  State<SuraDetailScreen> createState() => _SuraDetailScreenState();
}

class _SuraDetailScreenState extends State<SuraDetailScreen> {
  List<String> _verses = [];
  int? _suraIndex;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args is int && _suraIndex != args) {
      _suraIndex = args;
      Provider.of<MostResentProvider>(
        context,
        listen: false,
      ).setLastSuraIndex(args);
      _loadSuraFile(args);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final index = _suraIndex ?? 0;

    return Scaffold(
      backgroundColor: AppColours.backgroundColor,
      appBar: _buildAppBar(index, screenWidth),
      body: Column(
        children: [
          _SuraHeader(index: index, screenWidth: screenWidth),
          _buildVersesView(screenWidth),
          _buildMosqueImage(),
        ],
      ),
    );
  }

  AppBar _buildAppBar(int index, double screenWidth) {
    return AppBar(
      backgroundColor: AppColours.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: AppColours.gold),
      centerTitle: true,
      title: Text(
        QuranResources.englishQuranSuraslist[index],
        style: AppStyle.bold20primary.copyWith(
          fontSize: screenWidth * 0.055,
          color: AppColours.gold,
        ),
      ),
    );
  }

  Widget _buildVersesView(double screenWidth) {
    if (_verses.isEmpty) {
      return const Expanded(
        child: Center(child: CircularProgressIndicator(color: AppColours.gold)),
      );
    }

    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.07,
          vertical: 10,
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Text.rich(
            textAlign: TextAlign.center,
            TextSpan(
              children: List.generate(_verses.length, (i) {
                return TextSpan(
                  children: [
                    TextSpan(
                      text: "${_verses[i].trim()} ",
                      style: TextStyle(
                        color: AppColours.sebhaColor,
                        fontSize: screenWidth * 0.06,
                        height: 1.9,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: "(${i + 1}) ",
                      style: TextStyle(
                        color: AppColours.gold,
                        fontSize: screenWidth * 0.04,
                        fontFamily: "ElMessiri",
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMosqueImage() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Image.asset(AppAssets.mousqueImage, fit: BoxFit.fitWidth),
    );
  }

  Future<void> _loadSuraFile(int index) async {
    try {
      final fileContent = await rootBundle.loadString(
        "assets/files/Suras/${index + 1}.txt",
      );
      final lines = fileContent.trim().split('\n');
      if (mounted) {
        setState(() => _verses = lines);
      }
    } catch (e) {
      debugPrint("Error loading sura file: $e");
      if (mounted) {
        setState(() => _verses = ["فشل تحميل السورة."]);
      }
    }
  }
}

class _SuraHeader extends StatelessWidget {
  const _SuraHeader({required this.index, required this.screenWidth});

  final int index;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.03,
        vertical: 17,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AppAssets.leftcorrnerImage, width: screenWidth * 0.16),
          Text(
            QuranResources.arabicQuranSuraslist[index],
            style: AppStyle.bold24primary.copyWith(
              fontSize: screenWidth * 0.07,
              color: AppColours.gold,
            ),
          ),
          Image.asset(AppAssets.rightcorrnerImage, width: screenWidth * 0.16),
        ],
      ),
    );
  }
}
