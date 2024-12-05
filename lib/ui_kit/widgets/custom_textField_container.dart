import 'package:flutter/material.dart';

import '../../utils/assets_paths.dart';
import '../colors.dart';

class CustomTextFieldContainer extends StatelessWidget {
  final String hintText;
  final double height;
  final int maxLines;
  final TextEditingController? controller;
  final bool hasSuffixIcon;
  final VoidCallback? onSuffixTap;

  const CustomTextFieldContainer({
    super.key,
    required this.hintText,
    this.controller,
    this.hasSuffixIcon = false,
    this.onSuffixTap,
    this.height=34,
    this.maxLines=1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        cursorColor: AppColors.secondary,
        maxLength: 30,
        maxLines: maxLines,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 8),
          counterText: '',
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 0),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primary, width: 0),
          ),
          suffixIcon: hasSuffixIcon
              ? GestureDetector(
                  onTap: onSuffixTap,
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: Image.asset(AppIcons.plusIcon),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
