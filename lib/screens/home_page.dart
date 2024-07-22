import 'package:flutter/material.dart';
import 'package:tablitsacheyto/providers/arithmetic_records.dart';
import 'package:tablitsacheyto/providers/shulte_records.dart';

import 'package:tablitsacheyto/screens/arithmetics/arithmatics.dart';
import 'package:tablitsacheyto/screens/checking.dart';
import 'package:tablitsacheyto/screens/shulte_page/shultes_table.dart';
import 'package:tablitsacheyto/screens/profile.dart';
import 'package:tablitsacheyto/screens/records.dart';
import 'package:tablitsacheyto/screens/welcome_page.dart';
import 'package:tablitsacheyto/widgets/exercises_card.dart';
import '../data/exercises_data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

int index = 0;

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await ref.read(userRecordsProvider.notifier).loadRecord();
      await ref.read(arithmeticsRecordsProvider.notifier).loadRecord();

      setState(() {});
    });
  }

  void setScreen(int index) {
    if (index == 0) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ShulteGameScreen(),
      ));
    }
    if (index == 1) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const ArithmeticsSCreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Exercises',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: CardForExercises(
                    iconPath: exercises[index].iconImgPath,
                    imagePath: exercises[index].imagePath,
                    subtitle: exercises[index].subtitle,
                    title: exercises[index].title,
                    onTap: () {
                      setScreen(index);
                    },
                  )),
              itemCount: exercises.length,
            ),
          ),
        ],
      ),
    );

    if (index == 3) {
      content = const CheckingScreen();
    }
    if (index == 4) {
      content = const ProfileScreen();
    }
    if (index == 0) {
      content = const WelcomePage();
    }
    if (index == 1) {
      content = const RecordsScreen();
    }
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 30,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Records',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.extension),
            label: 'Exercises',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_incandescent_sharp),
            label: 'Checking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: content,
    );
  }
}
