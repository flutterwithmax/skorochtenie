import 'package:flutter/material.dart';

class CardForExercises extends StatelessWidget {
  const CardForExercises({
    super.key,
    required this.iconPath,
    required this.imagePath,
    required this.subtitle,
    required this.title,
    required this.onTap,
  });
  final String title;
  final String subtitle;
  final String imagePath;
  final String iconPath;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.all(5),
      child: ListTile(
        onTap: onTap,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
        subtitle: Text(
          subtitle,
        ),
        leading: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(imagePath)),
        trailing: Image.asset(
          iconPath,
          height: 25,
        ),
      ),
    );
  }
}
