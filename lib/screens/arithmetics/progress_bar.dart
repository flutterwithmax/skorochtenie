import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tablitsacheyto/providers/arithmetic_records.dart';
import 'package:tablitsacheyto/providers/arithmetic_score.dart';
import 'package:tablitsacheyto/providers/timer_provider.dart';
import 'package:tablitsacheyto/screens/arithmetics/results.dart';

class ProgressBar extends ConsumerWidget {
  const ProgressBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remainingSeconds = ref.watch(timerProvider);
    final progress = remainingSeconds / 60.0;
    final result = ref.watch(arithmeticResultProvider);

    // Check if remainingSeconds is 0 to navigate to the next screen
    if (remainingSeconds == 0 || remainingSeconds < 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ResultsOfArithmetics()),
        );
        ref
            .watch(arithmeticsRecordsProvider.notifier)
            .addRecord(int.parse(result));
        ref.watch(timerProvider.notifier).resetTimer();
      });
    }

    return Column(
      children: [
        Container(
          height: 4,
          clipBehavior: Clip.hardEdge, // Clip the overflowing child
          decoration: const BoxDecoration(
            color: Colors.grey, // Background color
          ),
          child: Row(
            children: [
              Container(
                width: progress *
                    MediaQuery.of(context).size.width, // Dynamic width
                height: 10,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: Colors.blue, // Progress color
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Spacer(),
            const Icon(Icons.timer_outlined),
            Text(remainingSeconds.toString()),
            const Spacer(),
          ],
        ),
        Text(
          ' score: $result',
          style: const TextStyle(color: Colors.blue),
        ),
      ],
    );
  }
}
