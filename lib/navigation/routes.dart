import 'package:flutter/material.dart';

import '../pages/home_screen.dart';
import '../pages/my_trigger_screen.dart';
import '../pages/onboarding_screen.dart';
import '../pages/practice_timer_screen.dart';

class AppRouting {
  Map<String, Widget Function(BuildContext)> routes = {
    "/": (context) => const OnBoardingScreen(),
    'homeScreen': (context) => const HomeScreen(),
    'practiceTimerScreen': (context) => const PracticeTimerScreen(),
    'myTriggerScreen': (context) =>  MyTriggerScreen(),
    // 'addCreditScreen': (context) => const AddCreditScreen(),
    // 'make_payment': (context) => const MakePayment(),
    // 'settings_screen': (context) => const SettingScreen(),
    // 'reminderScreen_screen': (context) => const ReminderScreen(),
    // 'createReminderScreen': (context) => const CreateReminderScreen(),
    // 'privacyPolicyScreen': (context) => const PrivacyPolicyScreen(),
    // 'termsOfUseScreen': (context) => const TermsOfUseScreen(),
    // 'scheduleScreen': (context) => const ScheduleScreen(),
  };

  void navigationToPage(
      BuildContext context, String routeName, bool removePrevious,
      [var cubit]) {
    Navigator.pushNamedAndRemoveUntil(
        context, routeName, (route) => removePrevious,
        arguments: {'cubit': cubit});
  }
}
