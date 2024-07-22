import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tablitsacheyto/providers/arithmetic_score.dart';
import 'package:tablitsacheyto/providers/timer_provider.dart';

import '../../models/test.dart';

class ArithmeticsLogics extends ConsumerStatefulWidget {
  final List<Test> myTests;

  const ArithmeticsLogics({
    super.key,
    required this.myTests,
  });

  @override
  ConsumerState<ArithmeticsLogics> createState() => _ArithmeticsLogicsState();
}

class _ArithmeticsLogicsState extends ConsumerState<ArithmeticsLogics> {
  int sec = 60;

  int indexOftest = 0;
  int score = 0;
  bool isWrong = true;

  void _check(String number) {
    ref.watch(arithmeticResultProvider.notifier).addRecord(score.toString());

    if (number == widget.myTests[indexOftest].answer) {
      score++;
      ref.watch(arithmeticResultProvider.notifier).addRecord(score.toString());
    } else {
      ref.read(timerProvider.notifier).decrementTimer(5);
    }
  }

  @override
  Widget build(BuildContext context) {
    var myTest = widget.myTests[indexOftest];
    List<String> answers = List.from(widget.myTests[indexOftest].answers);
    answers.shuffle();
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 300,
          width: double.infinity,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                myTest.n1,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              Text(
                myTest.equesion,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              Text(
                myTest.n2,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              ),
              const Text(
                '=',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
              )
            ],
          ),
        ),
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 3 / 2,
              ),
              itemBuilder: (context, index) => InkWell(
                splashColor: Colors.grey[100],
                onTap: () {
                  setState(() {
                    _check(answers[index]);
                    indexOftest++;
                  });
                },
                child: Ink(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(223, 200, 226, 239),
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text(
                      answers[index],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 36),
                    ))),
              ),
              itemCount: answers.length,
            ),
          ),
        )
      ],
    );
  }
}
