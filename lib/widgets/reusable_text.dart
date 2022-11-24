import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bag_app/responsive/res.dart';

Text returnText(
    {required String text,
    required Color color,
    required bool isHeading,
    required Responsive res,
    required double size}) {
  return Text(text,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: isHeading ? res.getWidth(size) : res.getWidth(size),
      ));
}
