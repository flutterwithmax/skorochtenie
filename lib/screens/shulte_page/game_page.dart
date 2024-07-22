import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tablitsacheyto/providers/shulte_records.dart';
/* import 'package:flutter/services.dart'; */
import 'package:tablitsacheyto/screens/shulte_page/result_page.dart';
import 'dart:async';

import 'package:tablitsacheyto/widgets/container.dart';
import '../../data/modes.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen(
      {super.key,
      required this.gameAbsOrNot,
      required this.mylist,
      required this.gameModeIndex,
      required this.colorfulMode});
  final List<String> mylist;
  final int gameModeIndex;
  final int gameAbsOrNot;
  final int colorfulMode;

  @override
  ConsumerState<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  late List<Color> randomContainerColors;
  bool topContainerVisible = false;
  bool bottomContainerVisible = false;
  List<Color> availableColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
  ];
  int get gameMode {
    int localInt = widget.gameModeIndex;
    if (localInt == 0) {
      localInt = 0;
    }
    if (localInt == 1) {
      localInt = 9;
    }
    if (localInt == 2) {
      localInt = 20;
    }
    if (localInt == 3) {
      localInt = 33;
    }
    if (localInt == 4) {
      localInt = 48;
    }
    return localInt;
  }

  var index = 1;
  void _onPicked(String number) {
    if (widget.gameAbsOrNot == 0) {
      if (index == 16 + gameMode && int.parse(number) == 16 + gameMode) {
        stopTimer();
        ref.read(userRecordsProvider.notifier).addRecord(
              double.parse(
                (milliseconds / 1000).toStringAsFixed(2),
              ),
            );
        print('storing data');

        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ResultsScreen(
              result: (milliseconds / 1000).toStringAsFixed(2),
              index: widget.gameModeIndex,
            ),
          ),
        );

        return;
      }
      if (int.parse(number) == index) {
        setState(() {
          index++;
        });
      } else {
        showIncorrectContainers();
        Future.delayed(const Duration(milliseconds: 10), () {
          hideIncorrectContainers();
        });
      }
    } else {
      if (index == 16 + gameMode &&
          number == myAlphabetList[widget.gameModeIndex][(16 + gameMode) - 1]) {
        stopTimer();
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ResultsScreen(
              result: (milliseconds / 1000).toStringAsFixed(2),
              index: widget.gameModeIndex,
            ),
          ),
        );

        return;
      }
      if (number == myAlphabetList[widget.gameModeIndex][index - 1]) {
        setState(() {
          index++;
        });
      } else {
        showIncorrectContainers();
        Future.delayed(const Duration(milliseconds: 100), () {
          hideIncorrectContainers();
        });
      }
    }
  }

  void showIncorrectContainers() {
    setState(() {
      topContainerVisible = true;
      bottomContainerVisible = true;
    });
  }

  void hideIncorrectContainers() {
    setState(() {
      topContainerVisible = false;
      bottomContainerVisible = false;
    });
  }

  Timer? timer;
  int milliseconds = 0;

  void startTimer() {
    timer = Timer.periodic(const Duration(milliseconds: 10), (Timer t) {
      setState(() {
        milliseconds += 10;
      });
    });
  }

  void stopTimer() {
    timer?.cancel();
    timer = null;
  }

  void resetTimer() {
    setState(() {
      milliseconds = 0;
    });
  }

  @override
  void initState() {
    randomContainerColors = generateRandomColors();
    startTimer();

    super.initState();
  }

  List<Color> generateRandomColors() {
    List<Color> colors = widget.colorfulMode == 0
        ? List.generate(
            16 + gameMode, (index) => const Color.fromARGB(223, 200, 226, 239))
        : List.generate(16 + gameMode,
            (index) => availableColors[index % availableColors.length]);

    // Shuffle the colors
    colors.shuffle();

    return colors;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            (milliseconds / 1000).toStringAsFixed(2),
            style: const TextStyle(fontSize: 18.0),
          ),
        ),
        const SizedBox(height: 10),
        Center(
          child: Text(
            widget.gameAbsOrNot == 0
                ? myList[widget.gameModeIndex][index - 1]
                : myAlphabetList[widget.gameModeIndex][index - 1],
            style: const TextStyle(color: Colors.red, fontSize: 18),
          ),
        ),
        //top container,
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: topContainerVisible,
          child: Container(
            margin: const EdgeInsets.all(10),
            color: Colors.red[200],
            width: double.infinity,
            height: 30,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          height: 400,
          child: GridView.count(
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            crossAxisCount: 4 + widget.gameModeIndex,
            children: widget.mylist
                .map((e) => InkWell(
                      splashColor: Colors.green[50],
                      onTap: () {
                        _onPicked(e);
                      },
                      child: ValContainer(
                        key: ValueKey<String>(e),
                        title: e,
                        color: widget.colorfulMode == 0
                            ? const Color.fromARGB(223, 200, 226, 239)
                            : randomContainerColors[widget.mylist.indexOf(e)],
                        fontSize: 32,
                      ),
                    ))
                .toList(),
          ),
        ),
        //bottom Container
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: bottomContainerVisible,
          child: Container(
            margin: const EdgeInsets.all(10),
            color: Colors.red[200],
            width: double.infinity,
            height: 30,
          ),
        ),
      ],
    );
  }
}
