import 'package:flutter_riverpod/flutter_riverpod.dart';

class ArithmeticScoreNotifier extends StateNotifier<String> {
  ArithmeticScoreNotifier() : super('0');

  void addRecord(String record) {
    state = record;
  }

  void reset() {
    state = '0';
  }
}

final arithmeticResultProvider =
    StateNotifierProvider<ArithmeticScoreNotifier, String>(
        (ref) => ArithmeticScoreNotifier());
