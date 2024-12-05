import 'package:flutter/material.dart';
import 'colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.text,
    this.color = AppColors.secondary,
    this.fontSize,
    this.fontWeight = FontWeight.w600,
    this.fontFemily = 'Jost',
    this.textAlign = TextAlign.center,
  });
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String fontFemily;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontWeight: fontWeight,
          fontFamily: fontFemily,
          overflow: TextOverflow.ellipsis),
    );
  }
}
