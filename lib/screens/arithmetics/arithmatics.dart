import 'package:flutter/material.dart';
import 'package:tablitsacheyto/data/arithmetics_data.dart';
import 'package:tablitsacheyto/providers/timer_provider.dart';
import 'package:tablitsacheyto/screens/arithmetics/arithmetics_logic.dart';
import 'package:tablitsacheyto/screens/arithmetics/progress_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/test.dart';

class ArithmeticsSCreen extends ConsumerWidget {
  const ArithmeticsSCreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Test> myTestss = List.from(tests);
    myTestss.shuffle();
    ref.watch(timerProvider.notifier).startTimer();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.watch(timerProvider.notifier).resetTimer();
            },
            icon: const Icon(
              Icons.cancel_outlined,
              size: 40,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const ProgressBar(),
          ArithmeticsLogics(
            myTests: myTestss,
          ),
        ],
      ),
    );
  }
}
