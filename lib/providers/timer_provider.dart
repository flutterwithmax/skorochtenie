import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

class TimerNotifier extends StateNotifier<int> {
  TimerNotifier() : super(60);

  Timer? _timer;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state > 0) {
        state -= 1;
      } else {
        timer.cancel();
      }
    });
  }

  void decrementTimer(int seconds) {
    state = (state - seconds).clamp(0, 60);
  }

  void resetTimer() {
    _timer?.cancel();
    state = 60;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

final timerProvider = StateNotifierProvider<TimerNotifier, int>((ref) {
  return TimerNotifier();
});
