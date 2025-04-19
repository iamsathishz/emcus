import 'package:emcus_sathishkumar_r/core/constants/theme/app_colors.dart';
import 'package:emcus_sathishkumar_r/core/constants/theme/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final Color? color;
  final double? fontSize;
  final int? maxLine;
  final TextAlign? textAlign;
  final FontStyle? fontStyle;
  final TextDecoration? decoration;
  final FontWeight? fontWeight;
  final String text;
  final String? fontFamily;
  final double? lineHeight;
  final TextOverflow? overflow;
  final double? letterSpacing;

  const CustomText(this.text,
      {super.key,
      this.overflow,
      this.color,
      this.decoration = TextDecoration.none,
      this.fontSize = 12,
      this.fontStyle,
      this.fontWeight = FontWeight.normal,
      this.maxLine,
      this.textAlign,
      this.fontFamily = AppFonts.humanst521BT,
      this.lineHeight,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLine,
      overflow: overflow,
      style: TextStyle(
        color: color ?? AppColors.textColor,
        height: lineHeight,
        letterSpacing: letterSpacing,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        decoration: decoration,
        fontFamily: fontFamily,
      ),
    );
  }
}
