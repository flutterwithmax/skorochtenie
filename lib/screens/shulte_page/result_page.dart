import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final String result;
  final int index;
  ResultsScreen({super.key, required this.result, required this.index});

  final List<String> myList = ['4x4', '5x5', '6x6', '7x7', '8x8'];
  @override
  Widget build(BuildContext context) {
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
                  ' $result seconds',
                  style: const TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Shulte ${myList[index]}',
                  style: const TextStyle(color: Colors.white),
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
