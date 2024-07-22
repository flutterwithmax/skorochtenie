import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tablitsacheyto/providers/arithmetic_records.dart';
import 'package:tablitsacheyto/providers/shulte_records.dart';
import 'package:tablitsacheyto/providers/user_provider.dart';
import 'package:tablitsacheyto/widgets/profile_record_cointainer.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  int weekOrMonth = 0;
  @override
  Widget build(BuildContext context) {
    final record = ref.read(userRecordsProvider);
    final recordOfAr = ref.read(arithmeticsRecordsProvider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
                size: 35,
              ))
        ],
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  //addicon
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(223, 209, 230, 241),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  //change
                  '${ref.watch(userProvider)}',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Personal records',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.blue[300],
                    ),
                    child: RecordContainer(
                      image: 'assets/images/shulte.png',
                      record: '$record',
                      subtitle: 'sec',
                      title: 'Shulte',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.teal[300],
                    ),
                    child: RecordContainer(
                        image: 'assets/images/math.png',
                        record: '$recordOfAr',
                        title: 'Arithmetics',
                        subtitle: 'per minute'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.purple,
                    ),
                    child: const RecordContainer(
                        image: 'assets/images/hourglass.png',
                        record: '0',
                        title: 'Game 3',
                        subtitle: 'sec'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 246, 209, 47),
                    ),
                    child: const RecordContainer(
                        image: 'assets/images/clock.png',
                        record: '0',
                        title: 'Game 4',
                        subtitle: 'sec'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Statics',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: CupertinoSlidingSegmentedControl(
                thumbColor: const Color.fromARGB(255, 167, 154, 196),
                padding: const EdgeInsets.all(5),
                groupValue: weekOrMonth,
                children: {
                  0: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'Week',
                      style: weekOrMonth == 0
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
                      'Month',
                      style: weekOrMonth == 1
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
                  weekOrMonth = value!;
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
