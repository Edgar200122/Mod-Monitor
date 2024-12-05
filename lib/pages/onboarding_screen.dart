import 'package:flutter/material.dart';
import 'package:mod_monitor_app/navigation/routes.dart';
import 'package:mod_monitor_app/ui_kit/widgets/main_button.dart';

import '../ui_kit/colors.dart';
import '../ui_kit/text_styles.dart';
import '../utils/assets_paths.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;

  Future<void> _nextPage() async {
    if (_currentPage == 2) {
      AppRouting().navigationToPage(context, 'homeScreen', true);
    } else {
      setState(() {
        _currentPage++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppImages.onBoarding1,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Column(
            children: [
              Expanded(
                child: IndexedStack(
                  index: _currentPage,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height:
                                283 / 812 * MediaQuery.sizeOf(context).height,
                          ),
                          const TextWidget(
                            text: 'MOOD',
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          ),
                          const TextWidget(
                            text: 'MONITOR',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          const TextWidget(
                            text: 'APP',
                            fontSize: 64,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextWidget(
                          color: AppColors.black,
                          text:
                              'Monitor your mood and improve your\nquality of life with MoodMonitor,\nyour personal assistant in managing\nemotions.',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextWidget(
                          color: AppColors.black,
                          text:
                              'Start controlling your mood and\nwork on improving your emotional state\ntoday!',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? AppColors.secondary
                          : Colors.transparent,
                      border: Border.all(color: AppColors.secondary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 13),
              Padding(
                padding: EdgeInsets.only(
                  bottom: 45 / 812 * MediaQuery.sizeOf(context).height,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MainButton(
                    onTap: _nextPage,
                    height: 56,
                    width: 200,
                    text: _currentPage == 2 ? 'Get started' : 'Next',
                    fontColor: AppColors.black,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
