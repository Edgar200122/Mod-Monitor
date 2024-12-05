import 'package:flutter/material.dart';

import '../colors.dart';
import '../text_styles.dart';

class Instructions extends StatelessWidget {
  const Instructions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: '1. Sit or lie down in a comfortable position.',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.primary,
        ),
        TextWidget(
          text: '2. Close your eyes and relax your shoulders.',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.primary,
        ),
        TextWidget(
          text: '3. Inhale through your nose for a count of 4\n     seconds.',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.primary,
          textAlign: TextAlign.start,
        ),
        TextWidget(
          text: '4. Hold your breath for 7 seconds.',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.primary,
        ),
        TextWidget(
          text: '5. Exhale slowly through your mouth for 8 seconds.',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.primary,
        ),
        TextWidget(
          text:
              '6. Repeat this cycle 4–6 times. This exercise can\n   help slow your heart rate and calm your nervous\n    system',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.primary,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
