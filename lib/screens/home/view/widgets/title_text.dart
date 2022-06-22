import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TittleText extends StatelessWidget {
  const TittleText({
    Key? key,
    this.fontSize = 18,
    this.text = '',
    this.color = Colors.blue,
  }) : super(key: key);

  final String text;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.mulish(
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        color: color,
      ),
    );
  }
}
