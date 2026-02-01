import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colours.dart';

class AppStyle {
  static const TextStyle bold16white = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColours.whiteColor,
  );
  static final TextStyle bold24black = GoogleFonts.elMessiri(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColours.blackColor,
  );
  static final TextStyle bold24primary = GoogleFonts.elMessiri(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColours.primaryColor,
  );
  static final TextStyle bold20white = GoogleFonts.elMessiri(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColours.whiteColor,
  );
  static final TextStyle bold20primary = GoogleFonts.elMessiri(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColours.primaryColor,
  );
  static const TextStyle bold14black = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColours.blackColor,
  );

  static const TextStyle bold14white = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColours.whiteColor,
  );

  static final TextStyle bold16black = GoogleFonts.elMessiri(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColours.blackColor,
  );
}
