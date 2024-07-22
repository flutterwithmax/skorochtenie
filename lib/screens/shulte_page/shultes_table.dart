import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablitsacheyto/widgets/container.dart';
import '../../data/modes.dart';
import 'package:tablitsacheyto/screens/shulte_page/game_page.dart';
import 'dart:math';
import '../../models/exercise.dart';

class ShulteGameScreen extends StatefulWidget {
  const ShulteGameScreen({super.key});

  @override
  State<ShulteGameScreen> createState() => _ShulteGameScreenState();
}

class _ShulteGameScreenState extends State<ShulteGameScreen> {
  int? index = 0; //game mode changer
  int? indexAbsor123 = 0;
  int? indexOfColor = 0;
  var start = false;
  int get indexAdd {
    var indexnum = 0;
    if (index == 1) {
      indexnum = 9;
    }
    if (index == 2) {
      indexnum = 20;
    }
    if (index == 3) {
      indexnum = 33;
    }
    if (index == 4) {
      indexnum = 48;
    }
    return indexnum;
  }

  double get fontSize {
    var fontsize = 32.0;
    if (index == 2) {
      fontsize = 28.0;
    }
    if (index == 3) {
      fontsize = 26.0;
    }
    if (index == 4) {
      fontsize = 26.0;
    }
    return fontsize;
  }

  @override
  Widget build(BuildContext context) {
    List<Color> availableColors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.yellow,
    ];
    List<ColorContainer> myColorfulList = List.generate(
      16 + indexAdd,
      (index) => ColorContainer(
        title: (index + 1).toString(),
        color: availableColors[Random().nextInt(availableColors.length)],
      ),
    );

    // Print the myList

    var localList = myList[index!];
    if (indexAbsor123 == 1) {
      localList = myAlphabetList[index!];
    }
    if (indexAbsor123 == 1 && indexOfColor == 1) {
      List<ColorContainer> myAbsColorfulList = [];
      for (var i in myAlphabetList[index!]) {
        myAbsColorfulList.add(
          ColorContainer(
            title: i,
            color: availableColors[Random().nextInt(availableColors.length)],
          ),
        );
      }
      myColorfulList = myAbsColorfulList;
    }

    Widget content = Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        //gamemode //4x4//5x5//etc
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: CupertinoSlidingSegmentedControl(
            thumbColor: const Color.fromARGB(255, 167, 154, 196),
            padding: const EdgeInsets.all(5),
            groupValue: index,
            children: {
              0: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  '4x4',
                  style: index == 0
                      ? const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)
                      : const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.black54),
                ),
              ),
              1: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Text(
                  '5x5',
                  style: index == 1
                      ? const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)
                      : const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.black54),
                ),
              ),
              2: Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  '6x6',
                  style: index == 2
                      ? const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18)
                      : const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.black54),
                ),
              ),
              3: Text(
                '7x7',
                style: index == 3
                    ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                    : const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Colors.black54),
              ),
              4: Text(
                '8x8',
                style: index == 4
                    ? const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
                    : const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Colors.black54),
              ),
            },
            onValueChanged: (value) => setState(() {
              index = value;
            }),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Row(
            children: [
              Expanded(
                child: CupertinoSlidingSegmentedControl(
                  thumbColor: const Color.fromARGB(255, 167, 154, 196),
                  padding: const EdgeInsets.all(5),
                  groupValue: indexAbsor123,
                  children: {
                    0: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        '123',
                        style: indexAbsor123 == 0
                            ? const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)
                            : const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.black54),
                      ),
                    ),
                    1: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'ABC',
                        style: indexAbsor123 == 1
                            ? const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)
                            : const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.black54),
                      ),
                    ),
                  },
                  onValueChanged: (value) => setState(() {
                    indexAbsor123 = value;
                  }),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: CupertinoSlidingSegmentedControl(
                  thumbColor: const Color.fromARGB(255, 153, 140, 182),
                  padding: const EdgeInsets.all(5),
                  groupValue: indexOfColor,
                  children: {
                    0: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'B/W',
                        style: indexOfColor == 0
                            ? const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)
                            : const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.black54),
                      ),
                    ),
                    1: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'CLR',
                        style: indexOfColor == 1
                            ? const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)
                            : const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                                color: Colors.black54),
                      ),
                    ),
                  },
                  onValueChanged: (value) => setState(() {
                    indexOfColor = value;
                  }),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          width: double.infinity,
          height: 467,
          child: GridView.count(
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            crossAxisCount: 4 + index!,
            children: [
              if (indexOfColor == 0)
                for (int i = 0; i < localList.length; i++)
                  ValContainer(
                    title: localList[i],
                    color: const Color.fromARGB(223, 200, 226, 239),
                    fontSize: fontSize,
                  ),
              if (indexOfColor == 1)
                for (int i = 0; i < localList.length; i++)
                  ValContainer(
                    title: myColorfulList[i].title,
                    color: myColorfulList[i].color,
                    fontSize: fontSize,
                  ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              start = true;
            });
          },
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'START',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );

    if (start) {
      List<String> shuffledList = List.from(localList);
      shuffledList.shuffle();

      content = GameScreen(
        gameAbsOrNot: indexAbsor123!,
        colorfulMode: indexOfColor!,
        mylist: shuffledList,
        gameModeIndex: index!,
      );
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            'Shulte`s Table',
            style: TextStyle(
                fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ),
        actions: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.cancel_outlined,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
        leading: start
            ? null
            : Center(
                child: IconButton(
                  onPressed: () {
                    /*  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => InfoShulte(),
                    )); */
                  },
                  icon: const Icon(
                    Icons.info_outline,
                    size: 40,
                    color: Colors.black,
                  ),
                ),
              ),
      ),
      backgroundColor: Colors.white,
      body: content,
    );
  }
}
