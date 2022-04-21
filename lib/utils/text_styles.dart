import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

mixin TextStyles {
  static TextStyle get primary => GoogleFonts.dmSans(
        fontSize: 17,
        fontWeight: FontWeight.normal,
        color: Colors.white,
        decoration: TextDecoration.none,
      );

  static TextStyle get secondary => GoogleFonts.epilogue(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        decoration: TextDecoration.none,
      );
}
