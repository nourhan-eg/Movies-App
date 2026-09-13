import 'dart:ui';
import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle heading1(Color color) => GoogleFonts.inter(
    fontSize: 36,
    fontWeight: FontWeight.w500,
    color: color,
  );

  static TextStyle heading2(Color color) => GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: color,
  );

  static TextStyle headingSmall(Color color) => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: color,
  );


  static TextStyle title1(Color color) => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: color,
  );

  static TextStyle title2(Color color) => GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: color,
  );

  static TextStyle textSmall(Color color) => GoogleFonts.roboto(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: color,
  );



}