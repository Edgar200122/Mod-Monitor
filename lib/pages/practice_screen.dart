import 'package:flutter/material.dart';
import 'package:mod_monitor_app/ui_kit/colors.dart';
import 'package:mod_monitor_app/ui_kit/text_styles.dart';
import 'package:mod_monitor_app/ui_kit/widgets/main_button.dart';
import 'package:mod_monitor_app/utils/assets_paths.dart';

import '../navigation/routes.dart';

class PracticeScreen extends StatelessWidget {
  const PracticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 20 / 812 * MediaQuery.sizeOf(context).width,
            vertical: 20 / 812 * MediaQuery.sizeOf(context).height),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TextWidget(
              text: 'Exercises',
              fontSize: 32,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 30 / 812 * MediaQuery.sizeOf(context).height,
            ),
            const TextWidget(
              text: 'Breathing exercises',
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 15 / 812 * MediaQuery.sizeOf(context).height,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 270 / 800 * MediaQuery.sizeOf(context).height,
              decoration: BoxDecoration(
                color: AppColors.secondary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  Row(
                    children: [
                      const TextWidget(
                        text: '4-7-8 Breathing Technique',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                      const Spacer(),
                      Image.asset(
                        AppIcons.arrowOpenIcon,
                        width: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const TextWidget(
                    text: '1. Sit or lie down in a comfortable position.',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                  const TextWidget(
                    text: '2. Close your eyes and relax your shoulders.',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                  const TextWidget(
                    text:
                        '3. Inhale through your nose for a count of 4\n    seconds.',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                    textAlign: TextAlign.start,
                  ),
                  const TextWidget(
                    text: '4. Hold your breath for 7 seconds.',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                  const TextWidget(
                    text: '5. Exhale slowly through your mouth for 8 seconds.',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                  ),
                  const TextWidget(
                    text:
                        '6. Repeat this cycle 4–6 times. This exercise can\n    help slow your heart rate and calm your nervous\n    system.',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primary,
                    textAlign: TextAlign.start,
                  ),
                  const Spacer(),
                  MainButton(
                    onTap: () {
                      AppRouting().navigationToPage(
                          context, 'practiceTimerScreen', true);
                    },
                    text: 'Start practice',
                    height: 35,
                    containerColor: AppColors.bottomBarColor,
                    fontColor: AppColors.primary,
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.secondary,
                ),
                child: Row(
                  children: [
                    const TextWidget(
                      text: 'Diaphragmatic Breathing (Belly Breathing)',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                    const Spacer(),
                    SizedBox(
                      height: 16,
                      width: 16,
                      child: Image.asset(
                        AppIcons.arrowCloseIcon,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.secondary,
              ),
              child: Row(
                children: [
                  const TextWidget(
                    text: 'Box Breathing (Square Breathing)',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 16,
                    width: 16,
                    child: Image.asset(
                      AppIcons.arrowCloseIcon,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
