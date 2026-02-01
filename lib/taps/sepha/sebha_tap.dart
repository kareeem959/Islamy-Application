import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/App_assets.dart';
import '../../utils/app_colours.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({Key? key}) : super(key: key);

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int totalPraises = 0;
  int index = 0;

  final List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إِلَهَ إِلَّا اللهُ وَحْدَهُ لا شَرِيكَ له، له المُلْكُ وَلَهُ الحَمْدُ، وَهو علَى كُلِّ شيءٍ قَدِيرٌ",
  ];

  void _onSebhaClick() {
    setState(() {
      if (index == 3) {
        index = 0;
        counter = 1;
        totalPraises++;
        HapticFeedback.mediumImpact();
        return;
      }

      counter++;
      totalPraises++;
      HapticFeedback.selectionClick();

      if (counter == 34) {
        index++;
        counter = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    final double circleRadius = size.width * 0.30;
    final double beadSize = size.width * 0.07;
    final double headHeight = size.height * 0.12;

    double getFontSize() {
      if (index == 3) return size.width * 0.05;
      return size.width * 0.07;
    }

    final TextStyle elMessiriStyle = GoogleFonts.elMessiri(
      color: AppColours.whiteColor,
      fontWeight: FontWeight.bold,
      fontSize: getFontSize(),
    );

    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.defaultBg),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.05),
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى",
              style: elMessiriStyle.copyWith(fontSize: size.width * 0.06),
            ),
            const Spacer(),
            _SebhaDisplay(
              onTap: _onSebhaClick,
              index: index,
              counter: counter,
              azkar: azkar,
              size: size,
              circleRadius: circleRadius,
              beadSize: beadSize,
              headHeight: headHeight,
              elMessiriStyle: elMessiriStyle,
            ),
            const Spacer(),
            _TotalPraisesCounter(
              totalPraises: totalPraises,
              elMessiriStyle: elMessiriStyle,
              size: size,
            ),
            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }
}

class _SebhaDisplay extends StatelessWidget {
  final VoidCallback onTap;
  final int index;
  final int counter;
  final List<String> azkar;
  final Size size;
  final double circleRadius;
  final double beadSize;
  final double headHeight;
  final TextStyle elMessiriStyle;

  const _SebhaDisplay({
    required this.onTap,
    required this.index,
    required this.counter,
    required this.azkar,
    required this.size,
    required this.circleRadius,
    required this.beadSize,
    required this.headHeight,
    required this.elMessiriStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.width * 0.9,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -headHeight * 0.2,
            child: Image.asset(AppAssets.sebhaHead, height: headHeight),
          ),
          Positioned(
            top: headHeight * 0.6,
            child: GestureDetector(
              onTap: onTap,
              child: SizedBox(
                width: circleRadius * 2,
                height: circleRadius * 2,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    CustomPaint(
                      size: Size(circleRadius * 2, circleRadius * 2),
                      painter: ThreadPainter(color: AppColours.sebhaColor),
                    ),
                    ..._buildBeads(),
                    _buildZikrAndCounter(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildBeads() {
    return List.generate(33, (i) {
      final double angle = (2 * math.pi * i / 33) - (math.pi / 2);
      final double x = circleRadius * math.cos(angle);
      final double y = circleRadius * math.sin(angle);

      bool showBead = (index == 3) ? true : (i < counter);

      return Positioned(
        left: (circleRadius + x) - (beadSize / 2),
        top: (circleRadius + y) - (beadSize / 2),
        child: showBead
            ? Transform.rotate(
          angle: angle + (math.pi / 2),
          child: Image.asset(
            AppAssets.sebhaBead,
            width: beadSize,
            height: beadSize,
          ),
        )
            : const SizedBox(),
      );
    });
  }

  Widget _buildZikrAndCounter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation,
                    child: ScaleTransition(scale: animation, child: child)),
            child: Text(
              azkar[index],
              key: ValueKey<String>(azkar[index]),
              textAlign: TextAlign.center,
              style: elMessiriStyle.copyWith(height: 1.2),
            ),
          ),
          SizedBox(height: size.height * 0.01),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Text(
              index == 3 ? "" : "$counter",
              key: ValueKey<int>(counter),
              style: elMessiriStyle.copyWith(
                fontSize: size.width * 0.08,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TotalPraisesCounter extends StatelessWidget {
  final int totalPraises;
  final TextStyle elMessiriStyle;
  final Size size;

  const _TotalPraisesCounter({
    required this.totalPraises,
    required this.elMessiriStyle,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("إجمالي التسبيحات: ",
              style: elMessiriStyle.copyWith(
                  fontSize: size.width * 0.05, color: AppColours.sebhaColor)),
          Text("$totalPraises",
              style: elMessiriStyle.copyWith(fontSize: size.width * 0.06)),
        ],
      ),
    );
  }
}

class ThreadPainter extends CustomPainter {
  final Color color;

  ThreadPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
