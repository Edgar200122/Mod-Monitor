import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_monitor_app/ui_kit/colors.dart';

import '../../bloc/home_bloc.dart';
import '../../bloc/home_state.dart';
import '../text_styles.dart';

class MoodButton extends StatelessWidget {
  final Color color;
  final String label;
  final String image;

  const MoodButton({
    super.key,
    required this.color,
    required this.label,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final isSelected = state.selectedMood == label;
        final hasSelection = state.selectedMood != null;

        return GestureDetector(
          onTap: () {
            context.read<HomeCubit>().selectMood(label);
          },
          child: Container(
            height: 130 / 812 * MediaQuery.sizeOf(context).height,
            width: 163 / 375 * MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: isSelected
                  ? color
                  : hasSelection
                      ? color.withOpacity(0.5)
                      : color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  image,
                  width: 40,
                  color: isSelected
                      ? AppColors.secondary
                      : AppColors.secondary.withOpacity(
                          hasSelection ? 0.5 : 1.0,
                        ),
                ),
                const SizedBox(height: 10),
                TextWidget(
                  text: label,
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: isSelected
                      ? AppColors.secondary
                      : AppColors.secondary.withOpacity(
                          hasSelection ? 0.5 : 1.0,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
