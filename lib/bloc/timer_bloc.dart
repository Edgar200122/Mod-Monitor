import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerState(secondsRemaining: 60, isRunning: false));

  Timer? _timer;

  void startTimer() {
    if (_timer != null) return;
    emit(state.copyWith(isRunning: true));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.secondsRemaining > 0) {
        emit(state.copyWith(secondsRemaining: state.secondsRemaining - 1));
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    emit(state.copyWith(isRunning: false,secondsRemaining: 60,));
  }

  void resetTimer() {
    stopTimer();
    emit(state.copyWith(secondsRemaining: 60));
  }
}
