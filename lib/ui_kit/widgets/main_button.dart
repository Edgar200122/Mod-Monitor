import 'package:flutter/material.dart';
import 'package:mod_monitor_app/ui_kit/colors.dart';

import '../text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    this.width,
    this.height,
    this.radius,
    this.fontSize,
    this.fontColor = AppColors.secondary,
    this.containerColor = AppColors.primary,
    this.fontWeight = FontWeight.w600,
    required this.onTap,
    required this.text,
    this.disabled = false,
  });

  final double? width;
  final double? height;
  final double? radius;
  final double? fontSize;
  final Color fontColor;
  final Color containerColor;
  final VoidCallback? onTap;
  final String text;
  final FontWeight fontWeight;
  final bool disabled;
  @override
  Widget build(BuildContext context) {
    return Align(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
      
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: disabled ? containerColor.withOpacity(0.5) : containerColor,
            borderRadius: BorderRadius.circular(radius ?? 10),
          ),
          child: Center(
            child: TextWidget(
              text: text,
              fontSize: fontSize ?? 20,
              color: fontColor,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
