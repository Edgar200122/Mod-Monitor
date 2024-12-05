import 'package:flutter/material.dart';

import '../navigation/routes.dart';
import '../ui_kit/colors.dart';
import '../ui_kit/text_styles.dart';
import '../ui_kit/widgets/main_button.dart';
import '../ui_kit/widgets/mood_button.dart';
import '../utils/assets_paths.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../bloc/home_state.dart';
import '../utils/constants.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7E6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      AppConstants.dates.length,
                      (index) => GestureDetector(
                        onTap: () =>
                            context.read<HomeCubit>().selectDate(index),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            border: state.selectedDateIndex == index
                                ? Border.all(color: Colors.black, width: 1.5)
                                : null,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              TextWidget(
                                  text: AppConstants.dates[index]["day"]!,
                                  fontSize: 14,
                                  color: AppColors.secondary),
                              TextWidget(
                                  text: AppConstants.dates[index]["label"]!
                                      .toUpperCase(),
                                  fontSize: 14,
                                  color: AppColors.secondary),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 15),
                child: TextWidget(
                    text: 'Today, I am',
                    fontSize: 20,
                    color: AppColors.secondary),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    MoodButton(
                      color: AppColors.yellow,
                      label: 'Happy',
                      image: AppIcons.happyIcon,
                    ),
                    MoodButton(
                      color: AppColors.purple,
                      label: 'Sad',
                      image: AppIcons.sadIcon,
                    ),
                    MoodButton(
                      color: AppColors.red,
                      label: 'Angry',
                      image: AppIcons.angryIcon,
                    ),
                    MoodButton(
                      color: AppColors.green,
                      label: 'Anxiety',
                      image: AppIcons.anxietyIcon,
                    ),
                  ],
                ),
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return MainButton(
                    onTap: () {},
                    containerColor: const Color(0xff4D9DE0),
                    text: 'Go next',
                    height: 50,
                    fontColor: AppColors.primary,
                    disabled: state.selectedMood == null,
                  );
                },
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                    AppRouting().navigationToPage(
                          context, 'myTriggerScreen', true);
                },
                child: Container(
                  height: 91,
                  decoration: BoxDecoration(
                      color: const Color(0xff4D9DE0),
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextWidget(
                            text: 'My trigger list',
                            color: AppColors.primary,
                            fontSize: 20,
                          ),
                          GestureDetector(
                            child: SizedBox(
                                height: 20,
                                width: 20,
                                child: Image.asset(
                                  AppIcons.plusIcon,
                                  width: 14,
                                )),
                          )
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 33,
                        padding: const EdgeInsets.all(9),
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadiusDirectional.circular(10)),
                        child: const Row(
                          children: [
                            TextWidget(
                              text: 'You don`t have any trigger list.',
                              fontSize: 12,
                              color: AppColors.secondary,
                              fontWeight: FontWeight.w400,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            TextWidget(
                              text: 'Let`s create it!',
                              fontSize: 12,
                              color: Color(0xff4D9DE0),
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
