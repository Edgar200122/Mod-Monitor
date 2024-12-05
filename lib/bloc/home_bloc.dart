import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_monitor_app/pages/settings_screen.dart';
import '../pages/main_screen.dart';
import '../pages/practice_screen.dart';
import '../pages/statistics_screen.dart';
import '../utils/constants.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  static final List<Widget> pages = [
    const MainScreen(),
    const StatisticsScreen(),
    const PracticeScreen(),
    const SettingsScreen(),
  ];
  static HomeCubit? homeBloc;
  HomeCubit()
      : super( HomeState(
          selectedDateIndex:  AppConstants.defaultSelectedIndex,
          selectedMood: null,
        ));

  void changePage(int pageIndex) {
    emit(state.copyWith(getActivePageIndex: pageIndex));
  }

  void selectDate(int index) {
    emit(state.copyWith(getSelectedDateIndex: index));
  }

  void selectMood(String mood) {
    emit(state.copyWith(selectedMood: mood));
  }
}
