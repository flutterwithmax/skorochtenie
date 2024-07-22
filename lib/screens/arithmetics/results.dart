import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tablitsacheyto/providers/arithmetic_score.dart';

class ResultsOfArithmetics extends ConsumerWidget {
  const ResultsOfArithmetics({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final result = ref.watch(arithmeticResultProvider);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 174, 144, 249),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                Image.asset('assets/images/correct.png', height: 150),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  ' $result sollutions  per minute',
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Arithmetics',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 200,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () {
                    ref.watch(arithmeticResultProvider.notifier).reset();
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Text(
                      'OK',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
