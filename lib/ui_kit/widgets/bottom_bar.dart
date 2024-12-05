import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_monitor_app/ui_kit/text_styles.dart';

import '../../bloc/home_bloc.dart';
import '../../bloc/home_state.dart';

import '../../utils/assets_paths.dart';
import '../colors.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key,});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          width: double.maxFinite,
          height: 100,
          decoration: const BoxDecoration(
            color: AppColors.bottomBarColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(HomeCubit.pages.length, (index) {
              return BottomBarButton(
                onSelect: () {
                 HomeCubit.homeBloc!.changePage(index);
                },
                icon: _getIconForIndex(index),
                label: _getLabelForIndex(index),
                isActive: state.activePageIndex == index,
              );
            }),
          ),
        );
      },
    );
  }

  String _getIconForIndex(int index) {
    switch (index) {
      case 0:
        return AppIcons.homeIcon;
      case 1:
        return AppIcons.staticsIcon;
      case 2:
        return AppIcons.practiceIcon;
      case 3:
        return AppIcons.settingsIcon;

      default:
        return AppIcons.homeIcon;
    }
  }

  String _getLabelForIndex(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Statistics";
      case 2:
        return "Practice";
      case 3:
        return "Settings";

      default:
        return "Home";
    }
  }
}

class BottomBarButton extends StatelessWidget {
  const BottomBarButton({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onSelect,
  });

  final String icon;
  final String label;
  final bool isActive;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            icon,
            color: isActive ? AppColors.secondary : AppColors.primary,
            width: 28,
          ),
          const SizedBox(height: 5),
          TextWidget(
            text: label,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isActive ? AppColors.secondary : AppColors.primary,
          )
        ],
      ),
    );
  }
}
