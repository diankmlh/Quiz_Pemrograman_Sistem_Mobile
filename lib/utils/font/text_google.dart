import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextGoogle extends StatelessWidget {
  final String text;
  final String font;

  const TextGoogle(
    this.text, {
    super.key,
    this.font = 'alata',
  });

  @override
  Widget build(BuildContext context) {
    if (font == 'russo') {
      return Text(
        text,
        style: GoogleFonts.russoOne(),
      );
    }

    if (font == 'fredoka') {
      return Text(
        text,
        style: GoogleFonts.fredoka(),
      );
    }

    return Text(
      text,
      style: GoogleFonts.alata(),
    );
  }
}