import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mod_monitor_app/ui_kit/colors.dart';
import 'package:mod_monitor_app/ui_kit/text_styles.dart';

import '../bloc/timer_bloc.dart';
import '../bloc/timer_state.dart';
import '../ui_kit/widgets/Instructions_widget.dart';
import '../ui_kit/widgets/main_button.dart';
import '../utils/assets_paths.dart';

class PracticeTimerScreen extends StatelessWidget {
  const PracticeTimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: 'Practice',
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leadingWidth: 50,
        leading: Container(
          padding: const EdgeInsets.only(left: 20),
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              AppIcons.arrowLeftIcon,
              width: 10,
            ),
          ),
        ),
      ),
      body: BlocBuilder<TimerCubit, TimerState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 9),
                  height: 529 / 812 * MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: AppColors.secondary,
                      borderRadius: BorderRadiusDirectional.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      const TextWidget(
                        text: '4-7-8 Breathing Technique',
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                      const SizedBox(height: 30),
                      _TimerDisplay(state: state),
                      const SizedBox(height: 25),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: TextWidget(
                          text: 'Take each step for one minute',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primary,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      const SizedBox(height: 25),
                      const Instructions(),
                    ],
                  ),
                ),
                const Spacer(),
                MainButton(
                  text: state.isRunning ? 'Stop' : 'Start',
                  onTap: () {
                    final timerCubit = context.read<TimerCubit>();
                    if (state.isRunning) {
                      timerCubit.stopTimer();
                    } else {
                      timerCubit.startTimer();
                    }
                  },
                  containerColor: state.isRunning
                      ? AppColors.red
                      : AppColors.bottomBarColor,
                  height: 50,
                  fontSize: 20,
                  fontColor: AppColors.primary,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TimerDisplay extends StatelessWidget {
  final TimerState state;

  const _TimerDisplay({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: CircularProgressIndicator(
            value: state.secondsRemaining / 60,
            strokeWidth: 30,
            backgroundColor: AppColors.secondary,
            color: AppColors.primary,
          ),
        ),
        TextWidget(
          text:
              '${state.secondsRemaining ~/ 60}:${(state.secondsRemaining % 60).toString().padLeft(2, '0')}',
          fontSize: 32,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
        ),
      ],
    );
  }
}
