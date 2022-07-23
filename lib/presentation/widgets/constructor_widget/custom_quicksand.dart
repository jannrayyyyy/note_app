// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final int? maxLine;
  final TextAlign? textAlign;
  final double? fontSize;

  final FontWeight? fontWeight;
  final TextOverflow? overflow;

  const CustomText({
    Key? key,
    required this.text,
    this.maxLine,
    this.textAlign,
    this.fontSize,
    this.fontWeight,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLine,
        textAlign: textAlign,
        style: GoogleFonts.quicksand(
            textStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                color: Colors.black)));
  }
}
